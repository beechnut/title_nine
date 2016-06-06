class Case < ActiveRecord::Base

  validates :opened_on,   presence: true
  validates :institution, presence: true, length: { maximum: 255 }

  extend Enumerize
  enumerize :status, in: [:open, :closed], default: :open

  def self.closable
    where 'updated_at < ?', CLOSABLE_DURATION
  end

  def closable?
    updated_at < CLOSABLE_DURATION
  end

  def closed!
    return false unless closable?
    update_attributes status: :closed, closed_at: Time.current
  end

  private

  CLOSABLE_DURATION = 23.hours.ago

end