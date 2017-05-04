class AddColumnsToMovies < ActiveRecord::Migration[5.0]
  def up
    add_column :movies, :source, :string
    add_column :movies, :display_name, :string
    add_column :movies, :link, :string
  end

  def down
    remove_column :movies, :source, default: ""
    remove_column :movies, :display_name
    remove_column :movies, :link
  end
end
