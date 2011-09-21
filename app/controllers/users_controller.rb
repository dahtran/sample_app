class UsersController < ApplicationController
  def show
	@user = User.find(params[:id])
	@title = @user.name
  end

  def new
	@user = User.new
	@title = "Sign Up"
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
		sign_in @user
		redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
	else
		@user.password = ""
		@user.password_confirmation = ""
		@title = "Sign up"
		render 'new'
	end
  end
  
  def edit
	@user = User.find(params[:id])
	@title = "Edit User"
  end
  
  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		redirect_to (@user), :flash => { :success => "Profile updated." }
	else
		@title = "Edit User"
		render 'edit'
	end
  end
end


