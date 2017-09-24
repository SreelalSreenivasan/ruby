class ManageRecruiterController < ApplicationController
#def rlist
#	@up=Mrecruiter.new  #Upload=model name   up=object
#	@up=Mrecruiter.all  #accessing all data from Upload model into up object
 #   end
	def show
		@up=Mrecruiter.new  #Upload=model name   up=object
		@up=Mrecruiter.all  #accessing all data from Upload model into up object
	end
	def sshow
		@up=Mrecruiter.new  #Upload=model name   up=object
		@up=Mrecruiter.all  #accessing all data from Upload model into up object
	end
	def rshow
		@up=Mrecruiter.new  #Upload=model name   up=object
		@up=Mrecruiter.all  #accessing all data from Upload model into up object
	end

	#When a form is submitted, the fields of the form are sent to Rails as parameters. These parameters
	#can then be referenced inside the controller actions, typically to perform a particular task
	def create
	    @up=Mrecruiter.new  #creating an object up of Mrecruiter model(name,logopath)
		uploaded_io = params[:pimage] #The params method is the object which represents 
		#the parameters (or fields) coming in from the form.
		#uploaded_io==to store the url of image
        if (not uploaded_io==nil)
 			randomisepath=rand(99999).to_s+rand(99999).to_s+uploaded_io.original_filename
			File.open(Rails.root.join('public', 'uploads', randomisepath), 'wb') do |file|
  				file.write(uploaded_io.read)
  			end
  			@up.logopath="/uploads/"+randomisepath  #uploads=folder in public where the logo images will be saved
			@up.name= params[:name]
			@up.save 
			flash[:success]="....DATA ADDED...."
			redirect_to new_manage_recruiter_path
		else
			flash[:error]="....NO IMAGE SELECTED...."
			redirect_to new_manage_recruiter_path
		end
    end
end
