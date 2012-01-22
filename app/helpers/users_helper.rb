module UsersHelper
def user_avatar
 image_tag(@user.avatar.url(:medium), :alt => @user.name, :class => "round")
end
end
