class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale].to_sym
    I18n.locale = I18n.default_locale unless LOCALES.include?(I18n.locale)
  end

  def default_url_options(options = {})
    options.merge({:locale => I18n.locale})
  end

  def toggle_edition_mode
    Interpret.live_edit = !Interpret.live_edit

    redirect_to request.env["HTTP_REFERER"]
  end
end
