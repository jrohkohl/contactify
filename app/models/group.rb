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
class Group < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :members

  has_many :contacts, through: :members

  scope :by_created_date, -> { order(created_at: :desc )}

  scope :by_member_count, -> { order(members_count: :desc )}
end
