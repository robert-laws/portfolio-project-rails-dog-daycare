module ApplicationHelper
  def full_page_title(page_title = '')
    base_title = "Dog Daycare"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
