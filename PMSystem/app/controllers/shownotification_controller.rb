class ShownotificationController < ApplicationController
    def show
        @n = Notification.new
        date= params[:id]
        @n = Notification.where(:date=>date)
        @n=@n[0]
        
    end
    
    def index
        @n = Notification.new
        
        @n = Notification.all        
    end

    def apply
        @obj = Response.new
       

        temp = 1000000
        cin = params[:id]
        @r = Rregister.new
        @s = Sregister.new
        @r = Rregister.where(:cinno=>cin)
        @r=@r[0]       
        @s = Sregister.where(:rno=>session[:userdata]['uname'])[0]
        ssal=@s.salary.to_i
        rsal=@r.salary.to_i
        #puts rsal
        if((ssal) == 0 || ((ssal) <  temp && (rsal) > temp ))
            eligible = true
        else
            eligible = false
        end

        @obj.sid = @s.rno
        @obj.sname = @s.name
        @obj.cno = @r.cinno
        @obj.cname = @r.name
        #puts @obj.sid
        #puts @obj.cno
        @cond = Response.new
        @cond = Response.where(:sid => @obj.sid) 
        @cond =  @cond.where(:cno => @obj.cno)
        
        applied = false

        if(@cond.size > 0)
            applied=true
        end

        if(eligible==true and applied==false)            
            @obj.save
            flash[:success]="Eligible"
        elsif (eligible==true and applied==true)
            flash[:success]="Already applied"
        else 
            flash[:success]="Not Eligible"
        end
            
        
        #puts (@s.salary.to_i)
        redirect_to shownotification_index_path  
        
    end
end
