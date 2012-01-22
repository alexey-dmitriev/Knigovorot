class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :name
      t.date :date_of_pub
      t.integer :copies
      t.string :format
      t.text :info
      t.string :link_to_img
      t.references :publisher

      t.timestamps
    end
    add_index :publications, :publisher_id
  end
end
