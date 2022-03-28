class District < ApplicationRecord
    belongs_to :state, optional: true
end
