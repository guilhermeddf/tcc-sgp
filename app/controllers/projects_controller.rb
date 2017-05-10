class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:show, :edit, :update, :destroy, :show_repository_project]
  def select
      @projects = current_user.projects
      session[:project] = params['project_id'] if params['project_id']
  end
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @function_user_project = FunctionUserProject.new
  end

  # GET /projects/new
  def new
    @project = Project.new

  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json

  def create
    @project = Project.new(project_params)
    x = params[:opcao_privado] == "true"? true : false
    #funcao que cria repositorio no git
    @client.create_repository(@project.name, options = {"description": params[:description],
                    "homepage": params[:site],
                    "private": x,
                    "has_issues": params[:opc_issues],
                    "has_projects": params[:opc_project],
                    "has_wiki": params[:opc_wiki]}) 

    respond_to do |format|                
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    #funcao que deleta repositorio do git
    @client.delete_repository(current_user.usernamegit+'/'+@project.name)

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_repository_project 
    @auxiliar_project = Project.find(params[:project_receive]) 
    @var = @client.repository(current_user.usernamegit+'/'+@auxiliar_project.name)
    @bra = @client.branches(current_user.usernamegit+'/'+@auxiliar_project.name)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_client
      @client = Octokit::Client.new(:login => current_user.usernamegit, :password => current_user.passwordgit) 
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :size, :start_date, :end_date, :local_id)
    end
end
