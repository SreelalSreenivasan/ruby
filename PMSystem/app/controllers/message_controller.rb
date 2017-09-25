class MessageController < ApplicationController
	def create
		@m = Inbox.new
		if(params[:cin].empty?)
			flash[:error]="CIN Missing"
			redirect_to message_acompose_path
		else
			@m.CIN = params[:cin]
			@m.title = params[:title]
			@m.tofrom = params[:tofrom]
			@m.content = params[:content]
			@m.save
			redirect_to message_inbox_path
		end
	end

	def inbox
		@s = Inbox.new
		@s = Inbox.all
	end
	
	def inbox2
		cin = session[:userdata]['uname']
		@s = Inbox.new
		@s = Inbox.where(:CIN=>cin)
	end
	
	def rcreate
		@m = Inbox.new
		@m.CIN = session[:userdata]['uname']
		@m.title = params[:title]
		@m.tofrom = "to"
		@m.content = params[:content]
		@m.save
		redirect_to message_inbox2_path
	end
	
	def show
		id = params[:id]
		@a = Inbox.where(:id=>id)
		@a=@a[0]
	end
	def show2
		@a = Inbox.new
		id = params[:id]
		#cin = session[:userdata]['uname']
		@a = Inbox.where(:id=>id)
		@a=@a[0]
	end
	def reply
		cin = params[:CIN]
		@a = Inbox.where(:CIN=>cin)
		@a = @a[0]
	end
	
	def replymessage
		@m = Inbox.new
		@m.CIN = params[:cin]
		@m.title = params[:title]
		@m.tofrom = params[:tofrom]
		@m.content = params[:content]
		@m.save
		redirect_to ahome_path
	end
end
