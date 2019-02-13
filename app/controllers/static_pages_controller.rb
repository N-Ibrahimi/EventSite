class StaticPagesController < ApplicationController
    before_action :authenticate_user, only: [:welcome]
  
  
    def contact # ET téléphone maison
    end
  
    def team  # The Super Fuck Friends
    end
    
  end
  