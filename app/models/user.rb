# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  gender           :string(255)
#  sexuality        :string(255)
#  photo_url        :string(255)
#  provider         :string(255)
#  uid              :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fb_photo_large   :string(255)
#  niche            :text
#  name_downcase    :text
#

class User < ActiveRecord::Base
  # has_secure_password
  attr_accessible :name, :gender, :sexuality, :photo_url, :fb_photo_large, :niche, :name_downcase
  has_many :flags, foreign_key: "flagged_user"
  has_many :flags, foreign_key: "flagger"
  # validates :fb_email, :presence => true, :uniqueness => true
  # validates :password, :password_confirmation, :presence => true
  # validates :password, :password_confirmation, :length => {in: 6..20}
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name ||= auth.info.name
      user.name_downcase = user.name.downcase
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  def flags
    flags = Flag.where(flagged_user: self.id)
    mapped_flags = flags.map do |flag|
        {message: flag.message, stack: flag.familiarity, familiarity: flag.encode_familiarity(self), positive: flag.positive}
      end
    mapped_flags.sort_by! { |flag| flag[:stack] }
    mapped_flags.reverse!
  end
  def groups
    graph = Koala::Facebook::API.new(self.oauth_token)
    groups = graph.get_connections("me", "groups")
    groups.reject! {|group| group["bookmark_order"] == 999999999}
    groups.sort_by! {|group| group["bookmark_order"]}
  end
  def mutual_groups(user)
    user.groups & self.groups
  end
end
