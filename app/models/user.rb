class User < ApplicationRecord
    has_many :phones
    validates :first, presence: true
    validates :last, presence: true
    validates :email, presence: true, uniqueness: true
end
