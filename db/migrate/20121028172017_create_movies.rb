class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string  :title,          :default => nil
      t.string  :releases,       :default => nil
      t.integer :tmdb_id,        :null => false

      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
