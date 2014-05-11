class PagesController < ApplicationController

  def home
  end

# Moved this to Users Controller 
  # def users # currently found at url/users
  	# @user = User.all
  # end


  def zip_submission
     @zip_selected = Zip.where( 'zip = ?', (params[:zip]) ).first
     puts "----------zip record is: " + @zip_selected.inspect
     if @zip_selected.blank?
       flash[:notice] = "Zip Not Found" 
       redirect_to root_path
       return
     end
     redirect_to new_user_registration_path(
                              :elec_choice_value => @zip_selected.landing_page, 
                              :zip_id => @zip_selected.id,
                              :zip_value => @zip_selected.zip,
                              :city => @zip_selected.city, 
                              :state => @zip_selected.state)
  end
  

  def thankyou
  end

end