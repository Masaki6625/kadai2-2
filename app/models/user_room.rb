class UserRoom < ApplicationRecord
  belongs_to :user_params
  belongs_to :room
end
