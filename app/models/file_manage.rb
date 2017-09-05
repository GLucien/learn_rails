class FileManage < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :avatar
end
