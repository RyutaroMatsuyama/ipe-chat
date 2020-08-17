class Message < ApplicationRecord
  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'
  belongs_to :reciever, class_name: 'User', :foreign_key => 'reciever_id'
  mount_uploader :image, ImageUploader
end
