class HomeController < ApplicationController
    def index
        if user_signed_in?
            @journals = current_user.journals # Assuming `current_user` has many journals
          else
            @journals = [] # Initialize as an empty array to avoid nil errors
          end
    end
end