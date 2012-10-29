class Release < ActiveRecord::Base
  attr_accessible :country, :movie_id, :date

  belongs_to :movie
end
