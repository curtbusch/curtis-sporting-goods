class Province < ApplicationRecord
  has_many :addresses

  validates :name, :gst, :pst, presence: true
end
