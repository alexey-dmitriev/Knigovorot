module AuthorsHelper
def author_img
 image_tag(@author.author_img.url(:medium), :alt => @author.name)
end
end
