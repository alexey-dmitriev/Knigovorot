class AuthorPublicationJoinTable < ActiveRecord::Migration
def change
    create_table :authors_publications, :id => false do |t|
      t.integer :author_id
      t.integer :publication_id
    end
  end
end
