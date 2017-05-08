class CreateGroupMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :group_movies do |t|
      t.belongs_to :group
      t.belongs_to :user
    end
  end
end
