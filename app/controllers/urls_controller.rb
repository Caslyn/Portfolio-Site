class UrlsController < ApplicationController
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

	def rand
		expires_in 1.day, public: true
		send_file Rails.root.join("app/views/urls", "image_2.jpg"), type: "video/mp2t", disposition: "inline"
	end
end
