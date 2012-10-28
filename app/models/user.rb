class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  iso_country :country

  has_many :reminders
end
