class BootStrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def to_html
    html = pagination.map do |item|
      item.is_a?(Fixnum) ?
          page_number(item) : send(item)
    end.join

    html = tag(:ul, html)
    tag(:div, html, :class => "pagination")
  end

  protected

    def page_number(page)
      res = link(page, page, :rel => rel_value(page))
      unless page == current_page
         res = tag(:li, res)
      else
        res = tag(:li, res, :class => "active")
      end

      res
    end

    def previous_or_next_page(page, text, classname)
      res = link(text, page ? page : current_page)
      if page
        res = tag(:li, res)
      else
        res = tag(:li, res, :class => "disabled")
      end

      res
  end
end