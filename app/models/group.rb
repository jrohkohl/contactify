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
class Group < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :members

  has_many :contacts, through: :members

  validates :name, presence: true

  scope :by_created_date, -> { order(created_at: :desc )}

  scope :by_member_count, -> { order(members_count: :desc )}
end
