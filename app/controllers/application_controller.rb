class ApplicationController < ActionController::API
  rescue_from ArgumentError do |error|
    argument_error(error)
  end

  rescue_from StandardError do |error|
    application_error(error)
  end

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

  def argument_error(error)
    render json: { error: 'Invalid request', backtrace: backtrace(error) }.compact, status: :bad_request
  end

  def application_error(error)
    render json: { error: 'Applicaiton request', backtrace: backtrace(error) }.compact, status: :application_error
  end

  def backtrace(error)
    return unless Rails.env.development?

    error.backtrace.map do |line|
      line = line.gsub("#{Rails.root}/", '')
      # replace ommit gem path
      line = line.gsub(%r{.*/gems/[0-9.]+/}, '{GEM_PATH}/') if line.include?('/gems/')

      line if line.start_with?('app/')
      # line
    end.compact
  end
end
