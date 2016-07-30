class UiControl < ActiveRecord::Base
  has_many :controls

  validates :kind, :values, :default_value, presence: true

  validate :proper_default_value

  def proper_default_value
    error_msg = "Invalid value, value must one of those: " + values.to_s
    errors.add(:default_value, error_msg) unless values.include? default_value
  end

  after_update :notify

  def notify
    controls.map(&:notify)
  end

  def values
    ActiveSupport::JSON.decode read_attribute(:values)
  end

  def values=(list)
    write_attribute(:values, ActiveSupport::JSON.encode(list))
  end

  def default_value
    data = read_attribute(:default_value)
    data.present? ? ActiveSupport::JSON.decode(data) : nil
  end

  def default_value=(val)
    write_attribute(:default_value, ActiveSupport::JSON.encode(val))
  end
end
