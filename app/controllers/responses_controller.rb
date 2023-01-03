class ResponsesController < ApplicationController
  before_action :set_response, only: %i[ show update destroy approve_response decline_response]
  before_action :authorize_request

  # GET /responses
  def index
    @responses = Response.all

    render json: @responses
  end

  def index_for_my_request
    @responses = Response.where(request_id: params[:request_id])

    render json: @responses
  end

  # GET /responses/1
  def show
    render json: @response
  end

  # POST /responses
  def create
    @response = Response.new(response_params)
    @response.user_id = @current_user.id
    @response.request_id = params[:request_id]

    if @response.save
      render json: @response, status: :created, location: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /responses/1
  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
  end

  def approve_response
    @response.is_approve = true

    approve_user = User.find_by(id: @response.user_id)
    approve_user.karma = approve_user.karma + 1

    request = Request.find_by(id: @response.request_id)
    request.is_confirm = true


    Response.where(request_id: request.id, is_approve: false).each do |response|
      response.is_approve = false
      response.save
    end

    @response.save
    approve_user.save
    request.save
  end

  def decline_response
    @response.is_approve = false

    @response.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.permit(:description)
    end
end
