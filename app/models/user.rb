class User < ActiveRecord::Base
  attr_accessible :email, :password, :country

  iso_country :country
end
