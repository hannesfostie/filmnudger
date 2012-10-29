class DropReleasesFromMovies < ActiveRecord::Migration
  def up
    remove_column :movies, :releases
  end

  def down
    add_column :movies, :releases, :string
  end
end
