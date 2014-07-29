class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title
    	t.string :rating
    	t.integer :runtime
    	t.integer :metascore
    	t.text :description
    	t.string :director
    	t.string :image_url
      t.timestamps
    end
  end
end
