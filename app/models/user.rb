class User < ApplicationRecord
  has_many :books
  has_many :genres
  has_many :authors
  has_many :publishers
end
