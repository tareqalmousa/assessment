require "#{Rails.root}/app/operation_models/url_service.rb"
class HomeController < ApplicationController
    $instance=Urloperation.new
  
  def index
    
   @geturl=request.original_url
   @url = $instance.new_url
    
  end
  
  
     def create
 
     @url= $instance.create(url_params)
     
      if(@url=="taken")
        
       redirect_to action: "index"
         
      else if(@url.errors.empty?)
     
         redirect_to action: "index"
       else
         render 'index'
       end
       end
         
   end

  def general
    
    #{request.protocol}#{request.host_with_port}#{request.fullpath}
     
     var=request.fullpath.sub('/', '')
    
     test= $instance.get_by_urlnew(var)
      
     if(test=="not found")
     # redirect_to "#{Rails.root}/public/404.html"
     @geturl=test
     else
       
       redirect_to "#{test}"
      
     
     end
  
    #@geturl=request.original_url
    #redirect_to @geturl
  end

  private
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:originalurl, :newurl)
    end
end


