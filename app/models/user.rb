class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  iso_country :country
end
