require 'rails_helper'

=begin
  Rspec.configure do |config|
    config.include SessionsHelper, :type => :controller 
  end
=end
RSpec.describe SessionsController, type: :controller do
    render_views
    describe 'login as a user' do
        
        it 'fails to login a user with one or more blank field' do
            post :create, {:session => {:email =>'', :password => ''}}
            assert_select "h2", "Invalid email/password combination"
        end
        
        it 'sign in successfully' do
            @controller = UsersController.new
            post :create, {:user => {:first_name => 'Matt', :last_name => 'Price', :email => 'mprice3@binghamton.edu', :password => 'goodmusic'}, :post => {:password_confirmation => 'goodmusic'}}
            @controller = SessionsController.new
            @test = post :create, {:session => {:email => 'mprice3@binghamton.edu', :password => 'goodmusic'}}
            #debugger
        end
        
         it 'fails to login a user with an invalid email/password combo' do
            post :create, {:session => {:email =>'mprice3@binghamton.edu', :password => 'garbage'}}
            assert_select "h2", "Invalid email/password combination"
        end
    end
end
