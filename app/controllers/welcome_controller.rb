class WelcomeController < ApplicationController
	def index
		expires_in 1.minutes, public: true
		cookies.delete @_request
		render :index
	end


end
