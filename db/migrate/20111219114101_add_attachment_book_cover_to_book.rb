class AddAttachmentBookCoverToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :book_cover_file_name, :string
    add_column :books, :book_cover_content_type, :string
    add_column :books, :book_cover_file_size, :integer
    add_column :books, :book_cover_updated_at, :datetime
  end

  def self.down
    remove_column :books, :book_cover_file_name
    remove_column :books, :book_cover_content_type
    remove_column :books, :book_cover_file_size
    remove_column :books, :book_cover_updated_at
  end
end
