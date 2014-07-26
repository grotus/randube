module Api
	class ChannelsController < ApplicationController
		before_filter :authenticate_user!

		def index
			render json: {channels: Channel.all}
		end
	end
end

