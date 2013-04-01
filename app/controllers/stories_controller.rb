class StoriesController < ApplicationController
  def new
    @story = Story.new
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

  def index
    @stories = Story.all
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])

  end 

end