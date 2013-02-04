class UserSessionsController < Devise::SessionsController
  layout 'login'

  def set_locale
    I18n.locale = :ca
  end
end
