module StaticPagesHelper

  def get_age(user)
    ((Date.today - user.profile.birthday) / 365).floor
  end

  def get_photos_by_category(photos, shoot)
     chosen_photos =[]
    photos.each do |photo|
      if photo.category == shoot.category
        puts photo.inspect
        chosen_photos << photo
      end
    end
    return chosen_photos
  end
end
