class AdminController < ApplicationController
    def index
        @users = User.all
        @articles = Article.all
    end
    def show
    end
    def edit
    end
    def update
        if @user.update(user_params)
          redirect_to @user
        else
          flash.now[:alert] = @user.errors.full_messages
          render :edit
    end
     end 
     def destroy
        @user = User.find(params[:id])
        @user.destroy
        if current_user.admin?
            redirect_to admin_index_path
        else
            redirect_to root_path
        end
     end
     private
        def check_authorization
            unless current_user.id == params[:id].to_i
              redirect_to root_url
            end
          end
          def set_user
            @user = User.find(params[:id])
          end
          def user_params
            params.require(:user).permit(:username, :image, :email, :admin)
          end
end
