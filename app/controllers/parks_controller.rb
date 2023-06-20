class ParksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @parks = Park.all
  end

  def new
    @park = current_user.created_parks.build
  end

  def create
    @park = current_user.created_parks.build(park_params)
    if @park.save
      redirect_to @park, notice: 'Park was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to @park, notice: 'Park was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @park.destroy
    redirect_to parks_url, notice: 'Park was successfully destroyed.'
  end

  def join
    @park = Park.find(params[:id])
    if @park.users.include?(current_user)
      render json: { error: 'Already joined' }, status: :unprocessable_entity
    else
      @park.users << current_user
      render json: { success: 'Joined the park' }
    end
  end

  def leave
    @park = Park.find(params[:id])
    if @park.users.include?(current_user)
      @park.users.delete(current_user)
      render json: { success: 'Left the park' }
    else
      render json: { error: 'Not a member' }, status: :unprocessable_entity
    end
  end

  private

  def set_park
    @park = Park.find(params[:id])
  end

  def ensure_correct_user
    if @park.user != current_user
      redirect_to parks_path, alert: 'You are not authorized.'
    end
  end

  def park_params
    params.require(:park).permit(:name, :info)
  end
end