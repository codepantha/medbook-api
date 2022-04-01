class SwaggersController < ActionController::API
  def index
    redirect_to '/api-docs'
  end
end
