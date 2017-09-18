require 'digest'
class RegistrationsController < ApplicationController
	def new
		@user = User.new
  	end
	def get_hash(password,salt)
		#puts password
		#strs=password+has
		#Digest::SHA1.hexdigest(strs)
		digestor=Digest::SHA1.new
		input=digestor.hexdigest(salt + password)
		
		1000.times.inject(input) do |reply|
			digestor.hexdigest(reply)
		end 
	end
	def create
		#render plain: params[:type].inspect
		#@user = User.new(user_params)
		#salt=rand(10000)
		#@user.salt=salt
		#puts @user.pword
		#@user.pword=get_hash(@user.pword,salt.to_s) 
		if(user_params[:type] == "student")
			redirect_to new_sregister_path
		elsif(user_params[:type] == "recruiter")
			redirect_to new_rregister_path
		end
  		#@user.save
  	        #redirect_to root_path
	end
	private
		def user_params
			#params.require(:registrations).permit(:uname,:pword,:type)
		
			params.require(:registrations).permit(:type)
		end
end
