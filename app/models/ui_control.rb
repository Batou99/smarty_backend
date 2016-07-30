class UiControl < ActiveRecord::Base
  has_many :controls

  validates :kind, presence: true
end
