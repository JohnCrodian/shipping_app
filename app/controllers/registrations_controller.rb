class RegistrationsController < Devise::RegistrationsController

	protected

	def after_sign_up_path_for(resource)
   		'/profiles/show'
 	end

	def after_update_path_for(resource)
    	'/profiles/show'
	end

  	private

  	def sign_up_params
    	params.require(:user).permit(:username, :email, :password)
  	end

  	def account_update_params
   	 	params.require(:user).permit(:username, :email, :password)
  	end

end