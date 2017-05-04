class UserStoryAcceptanceCriterionsController < ApplicationController
  before_action :set_user_story_acceptance_criterion, only: [:show, :edit, :update, :destroy]
  before_action :set_user_story
  before_action :set_project
  before_action :set_theme

  # GET /user_story_acceptance_criterions
  # GET /user_story_acceptance_criterions.json
  def index
    @user_story_acceptance_criterions = UserStoryAcceptanceCriterion.all
  end

  # GET /user_story_acceptance_criterions/1
  # GET /user_story_acceptance_criterions/1.json
  def show
  end

  # GET /user_story_acceptance_criterions/new
  def new
    @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.new
  end

  # GET /user_story_acceptance_criterions/1/edit
  def edit
  end

  # POST /user_story_acceptance_criterions
  # POST /user_story_acceptance_criterions.json
  def create
    @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.new(user_story_acceptance_criterion_params)
    @user_story_acceptance_criterion.user_story = @user_story
    respond_to do |format|
      if @user_story_acceptance_criterion.save
        format.html { redirect_to [@project, @theme, @user_story, @user_story_acceptance_criterion], notice: 'Critério de aceitação criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /user_story_acceptance_criterions/1
  # PATCH/PUT /user_story_acceptance_criterions/1.json
  def update
    respond_to do |format|
      if @user_story_acceptance_criterion.update(user_story_acceptance_criterion_params)
        format.html { redirect_to [@project, @theme, @user_story, @user_story_acceptance_criterion], notice: 'Critério de aceitação atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /user_story_acceptance_criterions/1
  # DELETE /user_story_acceptance_criterions/1.json
  def destroy
    @user_story_acceptance_criterion.destroy
    respond_to do |format|
      format.html { redirect_to  [@project, @theme, @user_story], notice: 'Critério de aceitação deletado com sucesso .' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story_acceptance_criterion
      @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_theme
      @theme = Theme.find(params[:theme_id])
    end

    def set_user_story
      @user_story = UserStory.find(params[:user_story_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_acceptance_criterion_params
      params.require(:user_story_acceptance_criterion).permit(:description, :status, :user_story_id)
    end
end
