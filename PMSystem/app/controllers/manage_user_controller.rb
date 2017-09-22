class ManageUserController < ApplicationController
	def show
		@l=User.new
		@r=Rregister.new
		@l = User.where(:status=>"no")
	end
	def approve
		name=params[:id]
		#puts(name)
		@l = User.where(:uname=>name)
		@l=@l[0]
		@l.status="yes"
		@l.save
		redirect_to ahome_path
	end
	def create
		salary=params[:salary]
		cinno=params[:cinno]
		@r=Rregister.where(:cinno=>cinno)
		@r=@r[0]
		@r.salary=salary
		#puts @r.salary
		@r.save
		redirect_to ahome_path
	end
	def cdata
		salary=params[:salary]
		rno=params[:rno]
		@s=Sregister.where(:rno=>rno)
		@s=@s[0]
		@s.salary=salary
		#puts @r.salary
		@s.save
		redirect_to ahome_path
	end
end
