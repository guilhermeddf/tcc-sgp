class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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
    @dados_repos
    
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
    @client = Octokit::Client.new(:login => 'guilhermeddf', :password => 'a07021991')
    x = params[:opcao_privado] == "true"? true : false
    
    
    @dados_repos = { "name_repos" => params[:name],
    "desc_repos" => params[:description],
    "home_repos" => params[:site],
    "issu_repos" => params[:opc_issues],
    "proj_repos" => params[:opc_project],
    "wiki_repos" => params[:opc_wiki]}

    set_up_instance_variable(@dados_repos)

      @client.create_repository(params[:name], options = {"description": params[:description],
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
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :size, :start_date, :end_date, :local_id)
    end

    def set_up_instance_variable(teste)
        @dados_repos = teste
    end
end
