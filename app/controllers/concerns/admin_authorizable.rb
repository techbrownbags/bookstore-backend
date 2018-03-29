class NotPermittedException < StandardError; end

module AdminAuthorizable
  extend ActiveSupport::Concern

  included do
    rescue_from NotPermittedException, with: -> { render json: { error: 'Not Permitted' }, status: :forbidden }
  end

  def authorize!(action)
    raise NotPermittedException if action != :read && !current_user.admin?
    raise NotPermittedException if false
    true
  end
end