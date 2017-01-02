class UsersController < ApplicationController
   # this controller method creates a new user during registration
   
   # please set @success to true or false, and set the value of @message to the
   # appropriate value. Note that if a field is empty, you should call
   #            @@BLANK_FIELD_MESSAGE % field_name
   # to return a new string with the appropriate field name filled in.
   
   @@SUCCESS_MESSAGE = 'New account successfully created.'
   @@PASSWORD_DIFFERENT_MESSAGE = "The password fields don't match. Please try again."
   @@INVALID_EMAIL_MESSAGE = 'The provided e-mail address is invalid. Please enter a valid Binghamton University e-mail address and try again.'
   @@BLANK_FIELD_MESSAGE = "The %s field is empty. Please make sure all fields are filled in and try again"
   @@LENGTH_MESSAGE = ""
   def index
      
   end
   
   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      # Do not add password_confirmation here inside the permit. This grants authority to use those values to create a user.
   end

   def new
   end
   
   def create
      
      @allValuesPresent = true
      @success = true
      @notExist = true   
      params[:user].each do |key, value|
         if !value.present?
            @success = false
            @message = "One or more fields is empty."
            return
         end
      end
   
=begin
      if not params[:user][:email].end_with? '@binghamton.edu'
           @success = false
           @message = "Must use Binghamton e-mail address."
           return
      end
=end      
      if (params[:user][:password] != params[:post][:password_confirmation])
         @message = "The password fields don't match."
         @success = false
         return
      end
      
      if (params[:user][:password].length < 7)
         @message = "The password must be 7 characters or more."
         @success = false
         return
      end
      
      if (params[:user][:password].include? ' ')
         @message = "The password cannot contain a space."
         @success = false
         return
      end
      
      if(User.exists?(:email => params[:user][:email]) == true)
         @message = "User already exists with this email."
         @success = false
         @notExist = false
         return
      end
      
      if(User.exists?(:first_name => params[:user][:first_name]) == true && User.exists?(:last_name => params[:user][:last_name]) == true)   
         @message = "User already exists with this name."
         @success = false
         @notExist = false
         return
      end

   end

   def destroy
      # #destroy one user
      User.destroy
      # #destroy multiple users
      User.where(:id => params[:ids]).destroy_all
   end
   
   def edit
      #@user = current_user
   end
   
   def show
      username = current_user[:email]
      userid = current_user[:id]
      username.slice!('@binghamton.edu')
      @message = 'Welcome ' + username + '!'
   end


   def login
      
   end
   
   def update
=begin
      @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
=end
   end
end