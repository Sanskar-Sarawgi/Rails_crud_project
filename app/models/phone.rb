class Phone < ApplicationRecord
    belongs_to :user
    VALID_PHONE_REGEX = /[1-9][0-9]{9}\z/
    validates :number, format: { with: VALID_PHONE_REGEX }
end
