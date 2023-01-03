class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show update destroy ]
  before_action :authorize_request

  def index_active_requests
    @requests = Request.where(is_confirm: false).where.not(user_id: @current_user.id)

    render json: @requests
  end

  def index_my_requests
    @requests = Request.where(is_confirm: false, user_id: @current_user.id)

    render json: @requests
  end

  # GET /requests/1
  def show
    render json: @request
  end

  # POST /requests
  def create
    if @current_user.karma == 0
      render json: { error: "You don't have karma" }
    else
      @request = Request.new(request_params)
      @request.user_id = @current_user.id
      #@current_user.karma = @current_user.karma - 1

      if @request.save
        #@current_user.save
        render json: @request, status: :created, location: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.permit(:title, :description)
    end
end
