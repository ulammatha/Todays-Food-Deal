module DealExpiryHelper
  def deal_expiry(deal)
    days_left = (deal.expiry.to_date - Date.today).to_i
    return content_tag(:p, "#{days_left} Days Left", id: "remaning_coupons") if days_left >=0
    content_tag(:p, "Deal is expired", id: "sold_coupons")
  end
end