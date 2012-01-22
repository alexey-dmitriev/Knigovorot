class BookPublicationJoinTable < ActiveRecord::Migration
def change
    create_table :books_publications, :id => false do |t|
      t.integer :book_id
      t.integer :publication_id
    end
  end
end
