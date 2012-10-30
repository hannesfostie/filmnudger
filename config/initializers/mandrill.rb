ENV['MANDRILL_USERNAME'] = "hannes+mandrill@fostie.be"
ENV['MANDRILL_PASSWORD'] = "ea76c44c-0574-4793-bb09-10b8c6016b6a"

ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :user_name => ENV["MANDRILL_USERNAME"],
  :password  => ENV["MANDRILL_PASSWORD"]
}
