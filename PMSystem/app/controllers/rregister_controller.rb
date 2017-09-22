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
		if @r.cno.length<10
			flash[:error]="Phone number is invalid"
			redirect_to root_path
		else
			@r.mail=params[:mail]
		
			#@r.con=params[:cno]
			pword1=params[:pword1]
			pword2=params[:pword2]
			if not pword1.eql?(pword2)
				flash[:error]="Password mismatch"
				redirect_to root_path
				else		
				@u.pword=pword1
				@u.utype="recruiter"
				salt=rand(10000)
				@u.salt=salt
					#puts @user.pword
				@u.pword=get_hash(@u.pword,salt.to_s)	
				@u.status="no"		
				@r.save
				@u.save
				redirect_to root_path
			end
		end
	end	
end
