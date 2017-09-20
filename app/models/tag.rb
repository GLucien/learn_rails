class Tag < ApplicationRecord
  validates :title, uniqueness: {message: "标签已存在"}

  has_and_belongs_to_many :blogs
end
