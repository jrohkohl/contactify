# == Schema Information
#
# Table name: groups
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  description   :text
#  notes         :text
#  members_count :integer          default(0)
#  owner_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
