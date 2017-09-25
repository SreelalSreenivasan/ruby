class LoginController < ApplicationController
  #def index
	#@student=Sregister.all
	#@recruiter=Rregister.all
	#@admin=Addadmin.all
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
	@l=User.new
	if(params[:uname].empty? or params[:pword].empty?)
			flash[:error]="Fields can't be blank"
			redirect_to login_path
	else
		uname=params[:uname]
		pword=params[:pword]
		#puts uname
		#puts pword
		if(uname=="admin" and pword=="admin")
			redirect_to ahome_path
		else
			@l=User.where(:uname=>uname)
			if(@l.size==0)
				flash[:error]="Username doesn't exists"	
				redirect_to login_path
			elsif(@l.size>0)
				@l=@l[0]
				if(@l.pword==get_hash(pword,@l.salt.to_s)and @l.status=="yes")
					session[:userdata]=@l
					if(@l.utype=="student")
						redirect_to shome_path
					elsif(@l.utype=="recruiter")
						redirect_to rhome_path
					elsif(@l.utype=="admin")
						redirect_to ahome_path
					end
				end
				#else
				#	flash[:error]="Username/Password mismatch"
				#	redirect_to login_path
				#end
			else
				flash[:error]="User under verification"
				redirect_to login_path	
			end
		end
	end
  end

  def shome
	@student=Sregister.where(:rno=>session[:userdata]['uname'])[0]
  end
  def rhome
	@rec=Rregister.where(:cinno=>session[:userdata]['uname'])[0]
  end
  #def ahome
  #	@admin=Addadmin.where(:empid=>session[:userdata]['uname'])[0]
  #end
  def logout
	session[:userdata]=nil
	redirect_to root_path
  end
end
