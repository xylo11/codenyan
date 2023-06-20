class ParksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)

    if @park.save
      redirect_to @park, notice: "パークが作成されました。"
    else
      render :new
    end
  end


  private

  def park_params
    params.require(:park).permit(:name, :info)
  end
end