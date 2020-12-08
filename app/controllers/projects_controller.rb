class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render :index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to project_url(@project)
		else
			#TODO
			render json: @project.errors.full_messages
		end
	end

	def show
		@project = Project.find_by(id: params[:id])
		render :show
	end

	private
	def project_params
		params.require(:project).permit(:name)
	end
end