# == Schema Information
#
# Table name: contacts
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  image            :string
#  organization     :string
#  preferred_method :string
#  personal_number  :string
#  work_number      :string
#  email            :string
#  instagram_url    :string
#  facebook_url     :string
#  owner_id         :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
