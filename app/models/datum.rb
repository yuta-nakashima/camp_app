class Datum < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

end
