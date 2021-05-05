class PolicyUser < ApplicationRecord
  belongs_to :policy
  belongs_to :user
end
