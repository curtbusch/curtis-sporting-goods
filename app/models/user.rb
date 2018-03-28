class User < ApplicationRecord
  include Clearance::User

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
end
