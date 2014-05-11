class UsersController < ApplicationController

 #  before_filter :user_is_admin
  

  def index #/admin/users/
    @users = User.order('created_at DESC')
    respond_to do |format|
      format.html # index.html.erb under /views/users/
      format.json { render :json => @users }
    end #do
  end # def index


  # handled via Devise-Registrations-New
  # def new
    # @user = User.new
    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render :json => @user }
    # end
  # end

# handled via Devise-Registrations-Create
  # def create # responds to submission of the 'new' forms
    # ## Remove Blank Fields for index-unique fields so AR doesn't try to put in an empty-string in place of null
    # # is email present?
    # params[:user].delete(:email) if (params[:user][:email]).blank?
    # # is phone present?
    # params[:user].delete(:phone) if (params[:user][:phone]).blank?
#     
    # @user = User.new(params[:user])
    # if @user.save
      # flash[:notice] = "Successfully Created User." 
      # redirect_to users_path
    # else
      # flash[:notice] = "Error Saving User."
      # render :action => 'new'
    # end
  # end
  
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    
    ## Remove Blank Fields for index-unique fields so AR doesn't try to put in an empty-string in place of null
    # is email present?
    params[:user].delete(:email) if (params[:user][:email]).blank?
    # is phone present?
    params[:user].delete(:phone) if (params[:user][:phone]).blank?
    
    # add params to @user without saving
    @user.assign_attributes(params[:user])
    
    if @user.save
      flash[:notice] = "Successfully updated User."
      redirect_to users_path      
    else
      flash[:notice] = "User-Save Failed."
      render :action => 'edit'
    end
  end

 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      flash[:notice] = "User deleted."
      redirect_to users_path
    end
  end

end #class
