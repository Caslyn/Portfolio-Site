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

	def down
		render status: 500, json: {
			message: "Internal Server Error"
		}.to_json
	end
end
