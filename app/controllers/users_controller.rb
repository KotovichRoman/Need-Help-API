class UsersController < ApplicationController
  before_action :set_user, only: %i[ update destroy ]

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.valid?
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user.errors
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:login, :email, :password)
    end
end
