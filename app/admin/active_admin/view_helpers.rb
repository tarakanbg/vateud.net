def page_children(page)
  children = ""
  for child in page.children
    title = child.title
    children += "<a href=\"/admin/pages/#{child.slug}\">#{title}</a>, "
  end
  return children.chomp(", ")
end

def page_siblings(page)
  siblings = ""
  for sibling in page.self_and_siblings
    title = sibling.title
    if title == page.title
      siblings += "<span class=\"rself\">#{title}</span>, "
    else
      siblings += "<a href=\"/admin/pages/#{sibling.slug}\">#{title}</a>, "
    end
  end
  return siblings.chomp(", ")
end