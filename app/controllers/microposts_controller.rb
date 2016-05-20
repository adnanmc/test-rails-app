class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    #code
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    #code
  end
end
