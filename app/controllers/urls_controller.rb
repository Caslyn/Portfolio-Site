class UrlsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :clear_cookies, :log_headers

	def log_headers
		http_envs = {}.tap do |envs|
			request.headers.each do |key, value|
				envs[key] = value if
					key.downcase.starts_with?('http')
			end
		end

		  logger.info "Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}.\nProcessing with headers #{http_envs.inspect}\nand params #{params.inspect}"
	end

	def clear_cookies
		request.session_options[:skip] = true
	end

	def home
		expires_in 1.day, public: true
		render :home
	end

	def pass
		expires_in 0.seconds, private: true
		render :home
	end

	def slow
		sleep 55
		expires_in 0.seconds, private: true
		render :home
	end
end
