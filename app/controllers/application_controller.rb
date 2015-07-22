class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options
    options = {}
    if ENV['APP_HOST'].present?
      options.merge!(host: ENV['APP_HOST'])
    end
    if ENV['APP_PORT'].present?
      options.merge!(port: ENV['APP_PORT'])
    end
    if ENV['APP_PROTOCOL'].present?
      options.merge!(protocol: ENV['APP_PROTOCOL'])
    end
    options
  end
end
