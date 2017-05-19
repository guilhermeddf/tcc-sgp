class RepositoryController < ApplicationController
    before_action :set_client
    before_action :set_project, only: [:index]

    def index
      @var = @client.repository(current_user.usernamegit+'/'+@auxiliar_project.name)
      @bra = @client.branches(current_user.usernamegit+'/'+@auxiliar_project.name)
    end

    def branch
      @auxiliar_project = Project.find_by(name: params[:project_receive])
      @unibra = @client.branch(current_user.usernamegit+'/'+@auxiliar_project.name, params[:branche_receive])
      @comm = @client.commits(current_user.usernamegit+'/'+@auxiliar_project.name, params[:branche_receive])
    end


    private
      def set_client
        @client = Octokit::Client.new(:login => current_user.usernamegit, :password => current_user.passwordgit)
      end
      def set_project
        @projectid = params[:project_receive]
        @auxiliar_project = Project.find(params[:project_receive])
      end

end
