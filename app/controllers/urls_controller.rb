class UrlsController < ApplicationController
	before_filter :clear_cookies

	def clear_cookies
		request.session_options[:skip] = true
	end

	def home
		expires_in 10.seconds, public: true
		render :home
	end

	def slow
		sleep 1.5
		render :home
	end

	# 1/3 chance of returning a 500 error
	def down
		if rand(1..3) == 2
			render status: 500, json: {
				message: "Internal Server Error"
			}.to_json
		else
			render :home
		end
	end
end
