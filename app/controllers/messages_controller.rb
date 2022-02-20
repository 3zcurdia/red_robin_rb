# frozen_string_literal: true

class MessagesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], unless: lambda {
                                                                                                       Rails.env.test?
                                                                                                     }
  before_action :set_message, only: %i[show edit update destroy]

  def index
    @messages = Message.includes(:messaging_service).all
  end

  def show; end

  def new
    @message = Message.new
  end

  def edit; end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to message_url(@message), notice: "Message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      redirect_to message_url(@message), notice: "Message was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy

    redirect_to messages_url, notice: "Message was successfully destroyed."
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:recipient, :content, :messaging_service_id)
  end
end
