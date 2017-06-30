class UrlsController < ApplicationController
	before_action :clear_cookies, :log_headers

	def log_headers
		http_envs = {}.tap do |envs|
			request.headers.each do |key, value|
				envs[key] = value if
					key.downcase.starts_with?('http')
			end
		end

		  logger.info "Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}. Processing with headers #{http_envs.inspect} and params #{params.inspect}"
	end

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

	def short_ttl
		expires_in 3.seconds, public: true
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
