# frozen_string_literal: true

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all.order(:created_at)
  end

  def show
    @product = Product.find(params[:id])
  end
end
