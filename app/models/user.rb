# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  contacts_count         :integer          default(0)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  groups_count           :integer          default(0)
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: :owner_id
  has_many :contacts, foreign_key: :owner_id
  

  validates :username, uniqueness: true     #add presence: true after fixing devise create forms
  validates :phone_number, phone: { possible: true, allow_blank: true }
end
