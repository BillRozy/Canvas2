class PhotosController < ApplicationController
  def destroy
    Photo.find(params[:id]).destroy
    redirect_to :back
  end

  def new
    @photo = Photo.new
    @category = params[:category].gsub(/\s+/, "")
    respond_to do |format|
      format.html { redirect_to photos_path }
      format.js { render 'photos/add_new' }
      format.json { render 'photos/add_new' }
    end
  end


  def create
    @photo = current_user.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to current_user.portfolio }
        format.js {}
        format.json { render json: @photo, status: :created, location: @current_user.portfolio }
      else
        format.html { redirect_to current_user.portfolio }
        # format.json { render json: @photo.errors, status: :unprocessable_entity }
        format.json {}
      end
    end
  end


  def upload
    uploaded_io = params[:photo][:image]
    # File.open(Rails.root.join('public', 'uploads/photo/image', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end

    Aws.config.update(
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'eu-central-1'
    )
    #
    # s3 = Aws::S3::Resource.new
    # obj = s3.bucket('canvas-storage').object(uploaded_io.original_filename)
    # obj.upload_file(Rails.root.join('public', 'uploads/photo/image', uploaded_io.original_filename), acl:'public-read')
    # obj.public_url


    @photo = current_user.photos.build(photo_params)
      if @photo.save
        render partial:  'photos/photo_preview.html.erb', formats: :html
      else
        redirect_to current_user.portfolio
      end

  end


  def photo_params
    params.require(:photo).permit(:image, :image_cache, :category, :title)
  end
end
