class AwesomeController < ApplicationController
	  #before_action :authenticate_user!
	
	def show 
		render :show, layout: false
	end

	def text 

	end

	def image_slider
		render :image_slider, layout: false
	end

end
