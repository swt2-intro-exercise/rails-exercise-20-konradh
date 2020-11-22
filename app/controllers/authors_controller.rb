class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(create_params)
    if @author.save
      redirect_to authors_path, notice: "Success!"
    else
      render new_author_path
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
  end

  private
  def create_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
