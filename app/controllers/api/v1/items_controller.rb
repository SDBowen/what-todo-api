# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authorize_request
      before_action :set_item, only: %i[show edit update destroy]

      def index
        @items = project.items.all.order('created_at ASC')
        render json: { message: 'Returned items',
                       data: @items }, status: :ok
      end

      def show
        render json: { message: 'Returned item', data: @item },
               status: :ok
      end

      def create
        @item = Item.new(item_params)
        if @item.save
          render json: { message: 'Item saved', data: @item },
                 status: :created
        else
          render json: { errors: @item.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if @item.update(item_params)
          render json: { message: 'Item updated', data: @item },
                 status: :ok
        else
          render json: { errors: @item.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @item.destroy
        render json: { message: 'Item deleted', data: @item },
               status: :ok
      end

      private

      def item_params
        params.permit(:description, :completed, :project_id)
      end

      def project
        @current_user.projects.find(params[:project_id])
      end

      def set_item
        @item = project.items.find(params[:id])
      end
    end
  end
end
