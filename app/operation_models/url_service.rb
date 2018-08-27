class Urloperation
      
  
        def new_url
          
           return Url.new
          
        end
  
        def getall
          
           return Url.all
          
        end
      
        def create(opject)
        url=Url.new(opject)
        var=Url.where(originalurl:"#{url.originalurl}")
          if  var.empty?

              if(url.save)
                  return  url

              else
              return url
              end
          else
            return url="taken"
          end 
        end
      
    
      
        def get_by_urlnew(urloriginal)
         # "add cache for Performance" 
         # urlshort = Rails.cache.read "#{urloriginal}"
          
         # if urlshort.empty?
         #  var=Url.where(["newurl = ? ", "#{urloriginal}"])
         #   if var.empty?
         #    Rails.cache.write "#{urloriginal}","not found"
         #    else
         #    Rails.cache.write "#{urloriginal}",var[0].originalurl
         # else
         # return urlshort
         # end
       
          
        var=Url.where(["newurl = ? ", "#{urloriginal}"])

           if var.empty?
          return "not found"
           else
           return var[0].originalurl
          end
        end
      
     
      
      
     
    end