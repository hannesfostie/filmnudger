class CreateReleaseModel < ActiveRecord::Migration
  def up
    create_table :releases do |t|
      t.string   :country,         :null => false
      t.integer  :movie_id,        :null => false
      t.date     :date,            :null => false

      t.timestamps
    end
  end

  def down
    drop_table :releases
  end

end
