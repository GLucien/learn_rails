class Person < ApplicationRecord
  has_many :tags, :as => :tagable

  attr_accessor :tag_names
end
