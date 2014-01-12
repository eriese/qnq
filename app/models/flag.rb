# == Schema Information
#
# Table name: flags
#
#  id           :integer          not null, primary key
#  message      :text
#  flagged_user :integer
#  flagger      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Flag < ActiveRecord::Base
  attr_accessible :flagged_user, :flagger, :message, :positive
  belongs_to :user, foreign_key: "flagged_user"
  belongs_to :user, foreign_key: "flagger"
end
