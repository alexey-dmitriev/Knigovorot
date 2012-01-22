class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :info
      t.string :link_to_img

      t.timestamps
    end
  end
end
