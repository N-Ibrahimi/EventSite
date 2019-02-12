class AdminMailer < ApplicationMailer

    default from: 'no-reply@events.fr'

    def alert_email(invite)

        @invited= invite.invited_id
        @invited_first_name=User.find(@invited).first_name
        @invited_last_name=User.find(@invited).last_name
        @invited_email=User.find(@invited).email
        event = Event.find(invite.event_id)
        @admin_first_name=User.find(event.admin_id).first_name
        @admin_last_name=User.find(event.admin_id).last_name
        @admin_email=User.find(event.admin_id).first_name

        @url  = 'http://events.fr/login' 
      
      mail(to:@admin_email,subject:" more person interessted to join at your event" )
      end

end
