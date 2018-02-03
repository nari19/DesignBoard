class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :color1
      t.string :color2
      t.string :color3

      t.timestamps
    end
  end
end
