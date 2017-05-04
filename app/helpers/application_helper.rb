module ApplicationHelper
  def is_current_page?(path)
    	'active' if current_page?(path)
  end

  def current_project
    if session[:project]
      project ||=  Project.find(session[:project])
    end
  end
end
