class Province < ApplicationRecord
  has_many :addresses, dependent: :destroy

  validates :name, :gst, :pst, presence: true
end
