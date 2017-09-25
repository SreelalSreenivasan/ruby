class AddadminController < ApplicationController
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
	def random_string(length)
    		letters = "abcdefghijklmnopqrstuvwxyz"
    		word = Array[]
    		length.times do
        		r = rand 0..25
        		letter = letters[r]
        		word.push(letter)
    		end
    	result = word.join("")
	end

	def create
		@u=User.new
		@a=Addadmin.new
		
		@a.empid=params[:empid]
		@u.uname=params[:empid]
		@a.name=params[:name]
		
		@a.contact=params[:contact]
		#if not pword1.eql?(pword2)
		#	flash[:error]="Password mismatch"
		#	redirect_to root_path
		#else
		x=rand(8)
		
		x.upto(10) do |i|
    			@u.pword = random_string(i)

		end		
		#@u.pword=pword1
		pword1=@u.pword
		@u.utype="admin"
		salt=rand(10000)
		@u.salt=salt
			#puts @user.pword
		@u.pword=get_hash(@u.pword,salt.to_s)	
		@u.status="yes"		
		@a.save
		@u.save
		flash[:Success] = "New admin's password is #{pword1}"
		redirect_to new_addadmin_path
		#end
	end
end
