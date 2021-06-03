# == Schema Information
#
# Table name: groups
#
#  id            :bigint           not null, primary key
#  description   :text
#  members_count :integer          default(0)
#  name          :string           not null
#  notes         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :bigint           not null
#
# Indexes
#
#  index_groups_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
