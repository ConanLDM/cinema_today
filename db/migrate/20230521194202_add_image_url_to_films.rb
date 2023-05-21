class AddImageUrlToFilms < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :image_url, :string
  end
end
