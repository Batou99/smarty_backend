class Control < ActiveRecord::Base

  belongs_to :ui_control

  validates :display_name, uniqueness: true, presence: true
  validates :ui_control, presence: true
end
