class NotificationController < ApplicationController
    def new
       @notification = Notification.new 
    end
    

    def show
        @n = Notification.find(params[:id])
        
    end
    
    def index
        @n = Notification.new
        
        @n = Notification.all
    end
    
    def eligible
        @obj = Response.new
        @obj = Response.all
    end


    

    def create
        @n = Notification.new()
        
        @n.title = params[:title]
        @n.content = params[:content]
        @n.cin = params[:cin]
        @n.date = Time.new
        
        if @n.title.length < 5 or @n.content.length < 5
                
                flash[:error]="Plese enter a title of length more than 5 or write some more content"
				redirect_to new_notification_path
        else    
                @n.save
                redirect_to @n        
        end     
    end
end
