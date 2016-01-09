module CommentHelper
  def user_reviewed?(deal)
    Review.exists?(deal_id: deal.id, user_id: current_user.id)
  end
end