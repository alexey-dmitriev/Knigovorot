module ApplicationHelper
def title
    base_title = "Knigovorot"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.bmp", :alt => "Knigovorot", :class => "round")
  end
end
