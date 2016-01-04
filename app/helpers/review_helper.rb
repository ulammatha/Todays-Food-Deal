module ReviewHelper
  def review_percentage(deal)
    percentages = {
      5 => 0,
      4 => 0,
      3 => 0,
      2 => 0,
      1 => 0
    }
    total_reviews = deal.reviews.count
    review_group = deal.reviews.group(:rating).count
    review_group.each do |rating, review_count|
      percentages[rating] = review_count * 100 / total_reviews
    end
    str = '';
    percentages.each do |key, value|
      str += tags(key, value)
    end
    content_tag(:dl, str.html_safe)
  end

  def tags(key, value)
    content_tag(:dd, class: "percentage percentage-#{value}") do
        content_tag(:span, "#{key} star:  #{value}%", class: "text strong")
      end
  end
end
