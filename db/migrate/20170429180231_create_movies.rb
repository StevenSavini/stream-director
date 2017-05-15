class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string   "title",                                                                                                 null: false
      t.string   "image_url",      default: "http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg", null: false
      t.string   "description",    default: "",                                                                           null: false
      t.string   "premiere_date",  default: ""
    end
  end
end
