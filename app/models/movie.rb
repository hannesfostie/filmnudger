class Movie < ActiveRecord::Base
  attr_accessible :title, :tmdb_id, :releases

  has_many :reminders

  serialize :releases, Hash
end
