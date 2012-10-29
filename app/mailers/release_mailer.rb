class ReleaseMailer < ActionMailer::Base
  default from: "hannes@maloik.co"

  def movie_release user, movie
    @user = user
    @movie = movie
    mail :subject => "A movie you wanted to see was released!",
         :to      => user.email,
         :from    => "hannes@maloik.co"
  end
end
