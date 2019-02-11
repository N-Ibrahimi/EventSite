class Event < ApplicationRecord

  validates :start_date, presence: true
  validate :future_date 
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true}
  validates :location, presence:true

  has_many :attendances
  has_many :inviteds, class_name: 'User',  through: :attendances
  belongs_to :admin, :foreign_key => :admin_id, class_name: 'User'
  
  
  def future_date
    errors.add(:start_date,"la date doit être apartir d'aujourd'hui") unless start_date.present? && start_date > Date.today
  end
end
