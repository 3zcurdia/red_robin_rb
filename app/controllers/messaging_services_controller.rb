# frozen_string_literal: true

class MessagingServicesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], unless: lambda {
                                                                                                       Rails.env.test?
                                                                                                     }
  before_action :set_messaging_service, only: %i[show edit update destroy]

  def index
    @messaging_services = MessagingService.all
  end

  def show; end

  def new
    @messaging_service = MessagingService.new
  end

  def edit; end

  def create
    @messaging_service = MessagingService.new(messaging_service_params)

    if @messaging_service.save
      redirect_to messaging_service_url(@messaging_service), notice: "Messaging service was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @messaging_service.update(messaging_service_params)
      redirect_to messaging_service_url(@messaging_service), notice: "Messaging service was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @messaging_service.destroy

    redirect_to messaging_services_url, notice: "Messaging service was successfully destroyed."
  end

  private

  def set_messaging_service
    @messaging_service = MessagingService.find(params[:id])
  end

  def messaging_service_params
    params.require(:messaging_service).permit(:alias_name, :provider, :webhook_url, :client_id, :client_secret)
  end
end
