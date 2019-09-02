# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index terms privacy]

  def index
    @products = Product.limit(3).order(:created_at)
  end

  def terms; end

  def privacy; end
end
