class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      flash[:notice] = "Your story was successfully created."
      redirect_to new_story_path
    else
      render :new
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Your story was successfully deleted."
    redirect_to stories_path
  end

  def index
    @stories = Story.all
    @comments = Comment.all
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Your story was successfully updated."
      redirect_to root_path
    else
      render :update
    end 
  end 

end