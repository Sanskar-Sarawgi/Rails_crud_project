class PhoneController < ApplicationController

    def create
        @user = User.find(params[:id])
        @phone = @user.phones.new(phone_params)
        respond_to do |format|
            if @phone.save
              format.html { redirect_to user_show_path(@user), notice: "User phone no add successfully." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @user = User.find(params[:id])
        @phone = Phone.find(params[:ids])
        @phone.destroy
        respond_to do |format|
            format.html { redirect_to user_show_path(@user), notice: "User phone no destroy successfully." }
        end
    end

    private
    def phone_params
        params.require(:phone).permit(:number)
    end
end
