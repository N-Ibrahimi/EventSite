class UserMailer < ApplicationMailer

        default from: 'no-reply@events.fr'
       
        def welcome_email(user)
          @user = user 
          @url  = 'http://events.fr/login' 
          mail(to: @user.email, subject: 'Bienvenue chez nous !') 
        end
end
