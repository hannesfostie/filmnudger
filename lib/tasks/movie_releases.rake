namespace :movie_releases do
  desc "Sends an email for movies being released today to whoever added a reminder for it"
  task :released_today => :environment do
    logger.info 'Started released_today:released_today rake task'
    Release.where(date: Date.today).each do |release|
      movie = release.movie
      users = movie.reminders.collect{|r| r.user}
      users.each do |user|
        ReleaseMailer.movie_release(user, movie).deliver
      end
    end
  end
end
