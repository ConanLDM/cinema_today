class AddImdbIdToFilms < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :imdb_id, :string
  end
end
