class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :thumbnail_url
      t.datetime :date_posted

      t.timestamps
    end
  end
end
