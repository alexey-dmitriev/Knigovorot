class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :info
      t.string :link_to_logo

      t.timestamps
    end
  end
end
