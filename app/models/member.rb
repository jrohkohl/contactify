# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint           not null
#  group_id   :bigint           not null
#
# Indexes
#
#  index_members_on_contact_id  (contact_id)
#  index_members_on_group_id    (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#  fk_rails_...  (group_id => groups.id)
#
class Member < ApplicationRecord
  belongs_to :group, counter_cache: true

  belongs_to :contact
  

  validates :group_id, uniqueness: { scope: :contact_id }
  
end
