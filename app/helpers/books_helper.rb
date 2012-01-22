module BooksHelper
def book_img
 image_tag(@book.book_cover.url(:medium), :alt => "Sample Book", :class => "round")
end


end
