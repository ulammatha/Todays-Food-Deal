module DealHelper
  def deal_expiry(deal)
    days_left = (deal.expiry.to_date - Date.today).to_i
    return content_tag(:p, "#{days_left} Days Left", id: "remaning_coupons") if days_left >=0
    content_tag(:p, "Deal is expired", id: "sold_coupons")
  end

  def modify(deal)
    if current_user &&
       current_user.is_vendor &&
       deal.eatery.user.id == current_user.id
      if deal.deleted_at.nil?
        link_to(
          image_tag("edit.png", title: "edit"),
          edit_vendor_deal_path(id: deal.id)
        ) +
          link_to(
            image_tag("delete.png", title: "delete"),
            vendor_deal_path(id: deal.id),
            method: :delete
          )
      else
        content_tag(
          :span,
          "Inactive",
          class: "help-inline text-highlight-small"
        )
      end
    end
  end
end

