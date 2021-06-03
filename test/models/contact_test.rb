# == Schema Information
#
# Table name: contacts
#
#  id               :bigint           not null, primary key
#  email            :string
#  facebook_url     :string
#  image            :string
#  instagram_url    :string
#  name             :string           not null
#  organization     :string
#  personal_number  :string
#  preferred_method :string
#  work_number      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  owner_id         :bigint           not null
#
# Indexes
#
#  index_contacts_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
