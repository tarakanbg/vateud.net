def page_children(page)
  children = ""
  for child in page.children
    title = child.title
    children += "<a class=\"tree\" href=\"/admin/pages/#{child.slug}\"><span class=\"status_tag ok\">#{title}</span></a>, "
  end
  return children.chomp(", ")
end

def page_siblings(page)
  siblings = ""
  for sibling in page.self_and_siblings
    title = sibling.title
    if title == page.title
      siblings += "<span class=\"status_tag warn\">#{title}</span>, "
    else
      siblings += "<a class=\"tree\" href=\"/admin/pages/#{sibling.slug}\"><span class=\"status_tag ok\">#{title}</span></a>, "
    end
  end
  return siblings.chomp(", ")
end