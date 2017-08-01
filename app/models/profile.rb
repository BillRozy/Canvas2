class Profile < ApplicationRecord
  belongs_to :user
  has_many :shootings, :through => :user
  mount_uploader :avatar, AvatarUploader
end
