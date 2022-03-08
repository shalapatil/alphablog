class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :email, :password))
        if @user.save 
            redirect_to articles_path
        else
            render 'new'
        end        
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:name, :email, :password))
            redirect_to articles_path
        else
            render 'edit'
        end       
    end
end