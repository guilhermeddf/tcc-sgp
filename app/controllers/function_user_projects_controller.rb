class FunctionUserProjectsController < ApplicationController
  before_action :set_function_user_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  # GET /function_user_projects
  # GET /function_user_projects.json
  def index
    @function_user_projects = FunctionUserProject.all
  end

  # GET /function_user_projects/1
  # GET /function_user_projects/1.json
  def show
  end

  # GET /function_user_projects/new
  def new
    @function_user_project = FunctionUserProject.new
    @function_user_project.project = @project
  end

  # GET /function_user_projects/1/edit
  def edit
  end

  # POST /function_user_projects
  # POST /function_user_projects.json
  def create
    @client = Octokit::Client.new(:login => current_user.usernamegit, :password => current_user.passwordgit)
    @function_user_project = FunctionUserProject.new(function_user_project_params)
    @function_user_project.project = @project
    @client.invite_user_to_repository(current_user.usernamegit+'/'+@project.name, User.find(@function_user_project.user_id).usernamegit)



    respond_to do |format|
      if @function_user_project.save
        format.html { redirect_to project_path(@function_user_project.project), notice: 'Membro adicionando com sucesso ao projeto.' }
        format.json { render :show, status: :created, location: @function_user_project }
      else
        format.html { render :new, project: @function_user_project.project_id, notice: "o id dessa merda é #{@function_user_project.project_id}" }
        format.json { render json: @function_user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /function_user_projects/1
  # PATCH/PUT /function_user_projects/1.json
  def update
    respond_to do |format|
      if @function_user_project.update(function_user_project_params)
        @function_user_project.project = @project
        format.html { redirect_to project_path(@function_user_project.project), notice: 'Função do membro do projeto atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @function_user_project }
      else
        format.html { render :edit }
        format.json { render json: @function_user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /function_user_projects/1
  # DELETE /function_user_projects/1.json
  def destroy
    #@client = Octokit::Client.new(:login => current_user.usernamegit, :password => current_user.passwordgit)
    #var = @client.repository_invitations(@project.name)

    #@client.delete_repository_invitation(current_user.usernamegit+'/'+@project.name, invitation_id)

    @function_user_project.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@function_user_project.project), notice: 'Membro foi excluido do projeto.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function_user_project
      @function_user_project = FunctionUserProject.find(params[:id])      
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_user_project_params
      params.require(:function_user_project).permit(:project_id, :function_id, :user_id)
    end
end
