module ApplicationHelper
  def rating_stars(rating, max = 5)
    content_tag(:div, class: "flex inline-block") do
      svg_icon("star", false) * (max - rating) + svg_icon("star") * rating
    end
  end

  def svg_icon(file_name, highlighted=true)
    styles = class_names("h-6", "w-6", { "text-slate-200": !highlighted })

    file = File.read(Rails.root.join("app", "assets", "icons", "#{file_name}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css "svg"

    svg["class"] = styles

    doc.to_html.html_safe
  end
end
