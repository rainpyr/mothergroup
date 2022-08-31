class KindsController < ApplicationController
  def index
    @kinds = Kind.all
  end

  def show
    @kind = Kind.find params[:id]
  end
end
