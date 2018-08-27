require "#{Rails.root}/app/operation_models/url_service.rb"

module Api
    module V1
      
       class UrlsController < ActionController::API
         
          $instance=Urloperation.new
         
         
       def getall
            
         shorturls = $instance.getall
         render json: {status: 'SUCCESS', message:'Loaded Urls', data:shorturls},status: :ok
          
        end
         
         def create
          
           shorturls = $instance.create(url_params)
        
            if(shorturls=="taken")

                render json: {status: 'ERROR', message:'this Url is taken ', data:[]},status: :unprocessable_entity


                  else if(shorturls.errors.empty?)


                      render json: {status: 'SUCCESS', message:'Saved Url', data:shorturls},status: :ok

                   else
                     render json: {status: 'ERROR', message:'Url not saved', data:shorturls.errors},status: :unprocessable_entity

                   end
               end

        end
         
        def general
    
          #{request.protocol}#{request.host_with_port}#{request.fullpath}

          
           #var=request.fullpath.sub('/', '')
           
           test= $instance.get_by_urlnew(url_input[:newurl].to_s)

           if(test=="not found")
           # redirect_to "#{Rails.root}/public/404.html"
           render json: {status: 'ERROR ', message:'not found 404 ', data:[]},status: :unprocessable_entity
           else

           render json: {status: 'SUCCESS', message:'get Url', data: test },status: :ok
           


           end

          #@geturl=request.original_url
          #redirect_to @geturl
        end
      
      
      
        def url_params
          params.permit(:originalurl, :newurl)
        end
         
        def url_input
          params.permit(:newurl)
        end
      
       end
      
    end
end