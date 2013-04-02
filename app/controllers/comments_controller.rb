class CommentsController < ApplicationController
  def new
    @comment = Story.find(params[:story_id]).comments.build
  end

  def create
    @comment = Comment.new(params[:comment])
    #@comment = Story.find(params[:story_id]).comments.create(params[:comment])

    if @comment.save
      flash[:notice] = "Your comment was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # p params
    # @comment = Comment.find(params[:id])
    # @story = 
    @comment = Story.find(params[:story_id]).comments.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment was successfully deleted."
    redirect_to story_comments_path
  end

  def index
    @comments = Comment.all
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Your comment was successfully updated."
      redirect_to root_path
    else
      render :update
    end 
  end 

end
