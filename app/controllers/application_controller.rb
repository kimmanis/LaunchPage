class ApplicationController < ActionController::Base
  protect_from_forgery

  lock :actions=>["users#index"]
end
