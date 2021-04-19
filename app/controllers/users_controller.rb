class UsersController < ApplicationController
   
   before_action :require_admin
   
   
    def index
        @q = User.ransack(params[:q])
        @users = @q.result
    end
    

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: "User was successfully destroyed." }
          format.json { head :no_content }
        end
    end
    
    private
    

   
    
end