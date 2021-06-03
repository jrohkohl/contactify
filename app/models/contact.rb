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
class Contact < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true
  
  has_many :members

  has_many :groups, through: :members

  validates :preferred_method, presence: true

  validates :personal_number, phone: true

  validates :work_number, phone: true

  scope :by_created_date, -> { order(created_at: :desc )}

  scope :by_method, -> { order(preferred_method: :desc) }

  #add enum here for preferred_method


end
