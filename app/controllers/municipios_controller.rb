class MunicipiosController < ApplicationController
	def index
     @municipio = Municipio.search(params[:search])

     respond_to do |format|
     	format.html {  }
     	format.json { render json @municipio }
     	format.js
     end
	end

	def show
		@municipio = Municipio.find(params[:id])
	end
	
end
