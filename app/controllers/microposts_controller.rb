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
      redirect_to root_path
    else
      flash[:warning] = "Something went wrong! Try again."
      redirect_to new_micropost_path
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    #code
  end

  private

  def valid_params
    params.require(:micropost).permit(:message, :email)
  end
end
