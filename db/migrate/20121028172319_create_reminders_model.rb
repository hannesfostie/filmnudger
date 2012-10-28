class CreateRemindersModel < ActiveRecord::Migration
  def up
    create_table :reminders do |t|
      t.integer  :user_id,         :null => false # if you use this field as a username, you might want to make it :null => false.
      t.integer  :movie_id,        :null => false

      t.timestamps
    end
  end

  def down
    drop_table :reminders
  end
end
