class UsersController < ApplicationController
  def show
    @userr = User.find(params[:id])
    @book = Book.new
    @books = @userr.books.all
  end

  def index
    @users = User.all
    @book = Book.new
    @userr = current_user
  end

  def edit
    @userr = User.find(params[:id])
  end

  def update
    @userr = User.find(params[:id])
    if @userr.update(user_params)
      redirect_to user_path(@userr.id), notice: "USER INFOがアップデートされました。"
    else
      render :edit
    end
  end

 private

 def user_params
  params.require(:user).permit(:introduction,:name,:email,:profile_image)
 end

end
