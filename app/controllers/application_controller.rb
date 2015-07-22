class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options
    env_prefix = 'APP_URL_OPTIONS_'
    ENV.select { |k, v| (k.start_with? env_prefix) && (not v.empty?) }.
      reduce({}) do |options, (k, v)|
      options.store(k.split(env_prefix)[1].downcase.to_sym, v)
      options
    end
  end
end
