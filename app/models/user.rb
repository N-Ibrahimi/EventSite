class User < ApplicationRecord

  has_many :attendances, foreign_key: 'invited_id'
  has_many :events, foreign_key: 'admin_id'
  after_create :welcome_send
  
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
