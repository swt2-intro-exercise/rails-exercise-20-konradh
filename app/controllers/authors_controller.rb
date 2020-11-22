class AuthorsController < ApplicationController
  def new
  end

  def create
    Author.new(create_params).save
    redirect_to root_path, notice: "Success!"
  end

  def show
    @author = Author.find(params[:id])
  end

  private
  def create_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
