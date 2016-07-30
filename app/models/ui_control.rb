class UiControl < ActiveRecord::Base
  has_many :controls

  validates :kind, presence: true

  after_update :notify

  def notify
    controls.map(&:notify)
  end
end
