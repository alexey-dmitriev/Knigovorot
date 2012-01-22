class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :info
      t.string :link_to_img

      t.timestamps
    end
  end
end
