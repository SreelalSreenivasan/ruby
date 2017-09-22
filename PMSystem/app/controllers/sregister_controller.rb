require 'digest'
class SregisterController < ApplicationController
	#def new 
	#	@user=User.new
	#	@sreg=Sregister.new
	#end
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
		@u=User.new
		@s=Sregister.new
		
		@s.rno=params[:rno]
		@u.uname=params[:rno]
		@s.name=params[:name]
		@s.cgpa=params[:cgpa]
		@s.branch=params[:branch]
		@s.cno=params[:cno]
		if @s.cno.length<10
			flash[:error]="Phone number is not valid"
			redirect_to root_path
		else
			@s.mail=params[:mail]
		
			#@s.con=params[:cno]
			pword1=params[:pword1]
			pword2=params[:pword2]
			if not pword1.eql?(pword2)
				flash[:error]="Password mismatch"
				redirect_to root_path
			else		
				@u.pword=pword1
				@u.utype="student"
				salt=rand(10000)
				@u.salt=salt
				#puts @user.pword
				@u.pword=get_hash(@u.pword,salt.to_s)	
				@u.status="no"		
				@s.save
				@u.save
				redirect_to root_path
			end
		end
	end
	#private
	#	def sreg_params
	#		params.require(:sregister).permit(:rno,:name,:cgpa,:branch,:cno,:mail,:pword1,:pword2)
	#	end
		#def user_params
		#	params.require(:sregister).permit(:rno,:name,:cgpa,:branch,:cno,:mail,:pword1,:pwrod2)
		#end
end
