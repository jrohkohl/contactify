# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  group_id   :bigint           not null
#  contact_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
