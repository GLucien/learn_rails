class Post < ApplicationRecord
  has_many :tags, :as => :tagable
end
