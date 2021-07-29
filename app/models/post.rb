class Post < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
  
  validates :title, presence: true, length: {minimum: 1}
  validates :body, presence: true, length: {minimum: 1}

  belongs_to :user
end
