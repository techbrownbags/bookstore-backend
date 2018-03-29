class ApplicationController < ActionController::API
  include AdminAuthorizable
  include TokenAuthenticatable

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ArgumentError, :with => :wrong_arguments
  # rescue_from Exception, :with => :last_stop


  def not_found(exception)
    respond_to do |format|
      format.json { render :json => {:error => exception.message}, :status => :not_found }
      format.any { render :text => "Error: #{exception.message}", :status => :not_found }
    end
  end
  def wrong_arguments(exception)
    render :json => {:error => "#{exception.message}"}, :status => :unprocessable_entity
  end
  # def last_stop(exception)
  #   render :json => {:error => "#{exception.class.name} - #{exception.message}"}, :status => :internal_server_error
  # end
end
