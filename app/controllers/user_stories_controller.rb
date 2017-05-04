class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :set_theme

  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
    @user_story_acceptance_criterions = @user_story.user_story_acceptance_criterions
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
  end

  # GET /user_stories/1/edit
  def edit
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)
    @user_story.theme = @theme

    respond_to do |format|
      if @user_story.save
        format.html { redirect_to [@project, @theme], notice: 'User story criada com sucesso.' }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to [@project, @theme, @user_story], notice: 'User story atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to [@project, @theme], notice: 'User story deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_theme
      @theme = Theme.find(params[:theme_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      params.require(:user_story).permit(:description, :business_value, :status, :story_points, :theme_id)
    end
end
