class Transaction < ActiveRecord::Base
  belongs_to :entry
end
