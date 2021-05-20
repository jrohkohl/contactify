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
class Member < ApplicationRecord
  belongs_to :group, counter_cache: true

  belongs_to :contact
  
end
