require 'rubygems'
require 'faraday'
require 'json'

class HelloworldController < ApplicationController

	GOOGLE_APP_DATA = {
	    auth_uri: "https://accounts.google.com/o/oauth2/auth",
	    client_secret: "zAvmBdvltnYBpgghH5O6jCY1",
	    token_uri: "https://accounts.google.com/o/oauth2/token",
	    client_email: "813193938703-js9sig85teuuk2ef7leit1glgurjkfej@developer.gserviceaccount.com",
	    client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/813193938703-js9sig85teuuk2ef7leit1glgurjkfej@developer.gserviceaccount.com",
	    client_id: "813193938703-js9sig85teuuk2ef7leit1glgurjkfej.apps.googleusercontent.com",
	    auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs"
	  }

	def index

		#authdata = HelloworldController::GOOGLE_APP_DATA


		#redirect_url = oauth2callback_url
		#redirect_to "#{authdata[:auth_uri]}?client_id=#{authdata[:client_id]}&redirect_uri=#{redirect_url}&scope=https://gdata.youtube.com&response_type=code&access_type=offline"
	end

	def auth_response
		puts "Code: #{params[:code]}"
		# client = HelloworldController.auth_and_get_client(params[:code], oauth2callback_url)

		# puts client.current_user

		# @result = client.get_all_videos(:user => 'hickok45')
	end

	def self.auth_and_get_client(code, oauth2callback_url)
		access_token = HelloworldController.get_access_token(code, oauth2callback_url)
		client = HelloworldController.get_client(access_token)
		return client
	end

	def self.get_access_token(code, oauth2callback_url)
		conn = Faraday.new(:url => 'https://accounts.google.com',:ssl => {:verify => false}) do |faraday|
	   faraday.request  :url_encoded
	   faraday.response :logger
	   faraday.adapter  Faraday.default_adapter
	  end

	  appdata = HelloworldController::GOOGLE_APP_DATA

		result = conn.post '/o/oauth2/token', {
			'code' => code,
			'client_id' => appdata[:client_id],
			'client_secret' => appdata[:client_secret],
			'redirect_uri' => oauth2callback_url,
			'grant_type' => 'authorization_code'
		}

		return JSON.parse(result.body)['access_token']
	end

	def self.get_client(access_token)
		
		appdata = HelloworldController::GOOGLE_APP_DATA

		client = YouTubeIt::OAuth2Client.new(
			client_access_token: access_token,
			client_id: appdata[:client_id],
			client_secret: appdata[:client_secret],
			#dev_key: "dev key"
		)

		return client
	end
end
