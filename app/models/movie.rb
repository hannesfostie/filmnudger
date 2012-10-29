class Movie < ActiveRecord::Base
  attr_accessible :title, :tmdb_id, :releases

  has_many :reminders
  has_many :releases

  serialize :releases, Hash

  def update_info
    headers  = {:accept => "application/json"}
    response = RestClient.get "http://private-2bdb-themoviedb.apiary.io/3/movie/#{tmdb_id}?api_key=762b2857e0272594885f20c826d2aacd&append_to_response=releases", headers
    info = JSON.parse(response, :symbolize_names => true)
    release_dates = Hash.new('unknown release date')
    info[:releases][:countries].map { |country| release_dates[country[:iso_3166_1].to_sym] = country[:release_date] }

    self.title = info[:title]
    save

    release_dates.each do |release_date|
      Release.create(country: release_date[0], date: Chronic.parse(release_date[1]), movie_id: id)
    end
  end
  # handle_asynchronously :update_info
end
