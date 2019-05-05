# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authorize_request
      before_action :set_project, only: %i[show edit update destroy]

      def index
        @projects = @current_user.projects.all.order('created_at ASC')
        render json: { message: 'Returned projects',
                       data: @projects }, status: :ok
      end

      def show
        render json: { message: 'Returned project', data: @project },
               status: :ok
      end

      def create
        @project = Project.new(project_params)
        @project.user = @current_user

        if @project.save
          render json: { message: 'Project created', data: @project },
                 status: :created
        else
          render json: { errors: @project.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @project.update(project_params)
          render json: { message: 'Project updated', data: @project },
                 status: :ok
        else
          render json: { errors: @project.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @project.destroy
        render json: { message: 'Project deleted', data: @project },
               status: :ok
      end

      private

      def project_params
        params.permit(:title)
      end

      def set_project
        @project = @current_user.projects.find(params[:id])
      end
    end
  end
end
