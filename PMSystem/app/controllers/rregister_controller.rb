require 'digest'
class RregisterController < ApplicationController
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
		@r=Rregister.new
		
		@r.cinno=params[:cinno]
		@u.uname=params[:cinno]
		@r.company=params[:company]
		@r.name=params[:name]
		@r.link=params[:link]
		@r.cno=params[:cno]
		#if params[:cinno]=" "  or params[:company]=" " or params[:name]=" " or params[:link]=" " or params[:cno]=" "
  		#	flash[:error]="Some fields are missing"
		#	redirect_to new_rregister_path
		#else
		if(params[:cinno].empty? or params[:pword1].empty? or params[:pword2].empty?)
			flash[:error]="Fields can't be blank"
			redirect_to new_rregister_path
		else
			if @r.cno.length<10
				flash[:error]="Phone number is invalid"
				redirect_to new_rregister_path
			else
				@r.mail=params[:mail]
			
				#@r.con=params[:cno]
				pword1=params[:pword1]
				pword2=params[:pword2]
				if not pword1.eql?(pword2)
					flash[:error]="Password mismatch"
					redirect_to new_rregister_path
				else		
					@u.pword=pword1
					@u.utype="recruiter"
					salt=rand(10000)
					@u.salt=salt
					@r.salary="0"
					#puts @user.pword
					@u.pword=get_hash(@u.pword,salt.to_s)	
					@u.status="no"		
					@r.save
					@u.save
					flash[:success]="Registration completed"
					redirect_to root_path
				end
			end
		end
	end	
end
