class User < ApplicationRecord
  has_secure_password
  has_many :user_messages, class_name: 'Message', :foreign_key => 'user_id'
  has_many :reciever_messages, class_name: 'Message', :foreign_key => 'reciever_id'
end
