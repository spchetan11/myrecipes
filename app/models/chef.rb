class Chef < ActiveRecord::Base
   
     before_save {self.email = email.downcase}
     VALID_EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
     validates :chefname, :presence => true, :length => {:minimum => 3, :maximum => 40}
	 validates :email, :presence => true, :length => {:maximum => 105}, :uniqueness => {:case_sensitive => false}, :format =>{:with => VALID_EMAIL_REGEX}
    
end