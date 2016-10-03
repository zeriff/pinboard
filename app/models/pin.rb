class Pin < ApplicationRecord
  acts_as_commentable
  acts_as_votable
  after_commit :remove_image!, on: :destroy
  belongs_to :user
  belongs_to :category, class_name: 'Category'
  mount_uploader :image, PinImageUploader
  attr_accessor :remote_pin_image_url
end
