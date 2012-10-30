namespace :movie_releases do
  desc "Sends an email for movies being released today to whoever added a reminder for it"
  task :released_today => :environment do
    Release.where(date: Date.today).each do |release|
      movie = release.movie
      users = movie.reminders.collect{|r| r.user}
      users.each do |user|
        ReleaseMailer.delay.movie_release(user, movie)
      end
    end
  end
end
