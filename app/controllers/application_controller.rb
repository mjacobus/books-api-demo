class ApplicationController < ActionController::API
  def current_user
    return @current_user if defined?(@current_user)

    access_token = request.headers['Authorization'].to_s.split('Bearer ').last.to_s.strip

    @current_user = User.find_by(access_token:)
  end
end
