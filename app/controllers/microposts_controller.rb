class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(valid_params)
    if @micropost.save
      flash[:success] = "Micropost created successfully."
      redirect_to microposts_path
    else
      flash[:warning] = "Something went wrong! Try again."
      redirect_to new_micropost_path
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(valid_params)
      flash[:success] = "Micropost updated"
      redirect_to micropost_path(@micropost)
   else
      flash[:warning] = "Something went wrong"
      redirect_to edit_micropost_path(@micropost)
   end
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:warning] = "Micropost deleted succesfully"
    redirect_to microposts_path
  end

  private

  def valid_params
    params.require(:micropost).permit(:message, :email)
  end
end
