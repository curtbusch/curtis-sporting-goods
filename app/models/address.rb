class Address < ApplicationRecord
  belongs_to :user
  belongs_to :province

  validates :address_name, :postal_code, :city, :userid, :provinceid, presence: true
  validates :postal_code, format:
      { with: /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/ }
end
