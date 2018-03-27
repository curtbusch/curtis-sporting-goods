class User < ApplicationRecord
  include Clearance::User

  has_many :addresses
  has_many :orders
end
