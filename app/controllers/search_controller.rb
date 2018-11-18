class SearchController < ApplicationController

	def index
		

		respond_to do |format|
	        format.html {  }
	        format.js {  }
	        format.json {
	          render :json => {:users => users}.to_json, :status => :ok
	        }	
	    end
	end

end
