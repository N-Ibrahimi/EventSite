class AdminMaileMailer < ApplicationMailer

    default from: 'no-reply@events.fr'

    def alert_email(invited)

        @invited= invited.user_id
        event = Event.find(invited.event_id)
        @count= Attendance.find_by(event_id:"event").size
        @admin_first_name=User.find(event.user_id).first_name
        @admin_last_name=User.find(event.user_id).last_name
        @admin_email=User.find(event.user_id).first_name

        @url  = 'http://events.fr/login' 
      
      mail(to:@admin_email,subject:" more person interessted to join at your event" )
      end

end
