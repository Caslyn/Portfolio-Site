class WelcomeController < ApplicationController
	def index
		expires_in 1.minutes, public: true
		request.session_options[:skip] = true
		render :index
	end


end
