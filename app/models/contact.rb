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
class Contact < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true
  
  has_many :members, dependent: :destroy

  has_many :groups, through: :members

  validates :preferred_method, presence: true

  validates :personal_number, phone: true


  validates :work_number, phone: { possible: true, allow_blank: true }

  validates :name, presence: true

  scope :by_created_date, -> { order(created_at: :desc )}

  scope :by_method, -> { order(preferred_method: :desc) }

  #enum preferred_method: { text: "text", text_work: "text (work)", phone_call: "phone call", phone_call_work: "phone call (work)",
                          #email: "email", facebook: "facebook", instagram: "instagram"
                          #}


end
