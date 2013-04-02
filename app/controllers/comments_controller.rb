class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = "Your comment was successfully created."
      redirect_to new_comment_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment was successfully deleted."
    redirect_to comments_path
  end

  def index
    @comments = Comment.all
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Your comment was successfully updated."
      redirect_to comments_path
    else
      render :update
    end 
  end 

end
