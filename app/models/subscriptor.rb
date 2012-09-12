class Subscriptor < ActiveRecord::Base
  validates_presence_of :token
  validates_presence_of :email

  before_validation :set_token

  after_create :subscribe
  before_destroy :unsubscribe


  def subscribe
    return unless Rails.env.production?
    h = Hominid::API.new(MAILCHIMP_API_KEY, :secure => true)
    # Get the first list in the account
    list_id = h.lists['data'].first['id']
    h.list_subscribe(list_id, email)
  end

  def unsubscribe
    return unless Rails.env.production?
    h = Hominid::API.new(MAILCHIMP_API_KEY, :secure => true)
    # Get the first list in the account
    list_id = h.lists['data'].first['id']
    h.list_unsubscribe(list_id, email)
  end

private
  def set_token
    self.token = Digest::SHA1.hexdigest("#{email}#{APP_CONFIG['seed']}")
  end
end
