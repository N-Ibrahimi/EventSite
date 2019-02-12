class Attendance < ApplicationRecord

  belongs_to :invited, class_name: "User"
  belongs_to :event
  after_create :email_to_admin


def email_to_admin
  AdminMailer.alert_email(self).deliver_now
end


end