class User < ApplicationRecord

  has_many :attendances, foreign_key: 'invited_id' , dependent: :destroy
  has_many :events, foreign_key: 'admin_id',  dependent: :destroy
  after_create :welcome_send
  
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
