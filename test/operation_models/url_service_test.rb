require_reletive "Urloperation"


  RSpec.describe do

   it "check for get original url from new url " do
     var = Urloperation.new
     
     # exmple 
     # original url https://www.gnu.org/software/ddd/"
     # new url ddd.com
     
     res=var.get_by_urlnew("ddd.com")

     expect(res).to eg("https://www.gnu.org/software/ddd/")
     
   end


  end


end