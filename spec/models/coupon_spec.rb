require 'rails_helper'

RSpec.describe Coupon, type: :model do

  describe "coupon db structure" do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:deal_id).of_type(:integer) }
  end


  describe "validations" do
    it { should belong_to(:deal)}
    it { should belong_to(:user)}
  end

end