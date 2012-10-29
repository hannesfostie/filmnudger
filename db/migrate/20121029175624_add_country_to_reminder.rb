class AddCountryToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :country, :string
  end
end
