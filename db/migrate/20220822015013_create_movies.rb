class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id
      t.string :title
      t.date :release_date
      t.integer :runtime
      t.jsonb :raw_data

      t.timestamps
    end
  end
end
