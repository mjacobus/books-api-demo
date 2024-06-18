class ApplicationController < ActionController::API
  private

  def current_user
    return @current_user if defined?(@current_user)

    access_token = request.headers['Authorization'].to_s.split('Bearer ').last.to_s.strip

    @current_user = User.find_by(access_token:)
  end

  def handle_request(request)
    klass = request.class.name.gsub('Request', 'RequestHandler').constantize
    handler = klass.new(current_user:)
    response = handler.handle(request)
    render json: response.data, status: response.status, headers: response.headers
  end
end
