class UserController < ApplicationController

    before_action :set_user, only: %i[ show edit update destroy]

    def index
        # @users = User.all
        @search = params[:search] == nil ? "" : params[:search];
        @users = User.where("lower(first) LIKE lower(?)", "%#{params[:search]}%")
    end
    
    def show
        @phone_no = @user.phones.all
        @phone = @user.phones.new
    end

    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            format.html { redirect_to user_show_path(@user), notice: "User was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def edit
      @phone_no = @user.phones.all
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_show_path(@user), notice: "User was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
      phone_no = @user.phones.all
      phone_no.each do |phone|
        phone.destroy
      end
      respond_to do |format|
        format.html { redirect_to user_path, notice: "User was successfully destroyed." }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first, :last, :email)
    end
end