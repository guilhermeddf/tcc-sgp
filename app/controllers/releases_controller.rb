class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.all
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
  end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = Release.new(release_params)
    @release.project = @project

    respond_to do |format|
      if @release.save
        format.html { redirect_to [@release.project, @release], notice: 'Release criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to [@project, @release], notice: 'Release atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html { redirect_to project_releases_path(@project), notice: 'Release deletada.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release
      @release = Release.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:release).permit(:version, :deliver_date, :project_id)
    end
end
