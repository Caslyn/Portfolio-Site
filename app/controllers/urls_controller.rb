class UrlsController < ApplicationController
	before_filter :clear_cookies

	def clear_cookies
		request.session_options[:skip] = true
	end

	def home
		expires_in 1.day, public: true
		render :home
	end

	def slow
		sleep 1.5
		expires_in 10.seconds, public: true
		render :home
	end

	def pass
		expires_in 0.seconds, private: true
		render :home
	end

	def cacheable
		expires_in 1.day, public: true
		render :home
	end

	# 1/2 chance of returning a 500 error
	def down
		expires_in 3.seconds, public: true
		if rand(1..2) == 2
			render status: 500, json: {
				message: "Internal Server Error"
			}.to_json
		else
			render :home
		end
	end
end
