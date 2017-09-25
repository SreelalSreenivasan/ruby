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
		
		#if @s.rno=" " or @s.uname=" " or @s.name=" " or @s.cgpa=" " or @s.branch=" " or @s.cno=" "
  		#	flash[:error]="Some fields are missing"
		#	redirect_to new_sregister_path
		#else
		if(params[:rno].empty? or params[:pword1].empty? or params[:pword2].empty?)
			flash[:error]="Fields can't be blank"
			redirect_to new_sregister_path
		else
			if @s.cno.length<10
				flash[:error]="Phone number is not valid"
				redirect_to new_sregister_path
			else
				@s.mail=params[:mail]
				pword1=params[:pword1]
				pword2=params[:pword2]
				#@s.con=params[:cno]
				if not pword1.eql?(pword2)
					flash[:error]="Password mismatch"
					redirect_to new_sregister_path
				else		
					@u.pword=pword1
					@u.utype="student"
					salt=rand(10000)
					@u.salt=salt
					@s.salary="0"
					#puts @user.pword
					@u.pword=get_hash(@u.pword,salt.to_s)	
					@u.status="no"		
					@s.save
					@u.save
					flash[:success]="Registration completed"
					redirect_to root_path
				end
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
