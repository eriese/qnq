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
  def get_familiarity(user)
    login_user = user
    graph = Koala::Facebook::API.new(login_user.oauth_token)
    the_flagger = User.find(self.flagger)
    mutual = graph.get_connection("me", "mutualfriends/#{the_flagger.uid}").count
  end
  def encode_familiarity(user)
    if user.id != self.flagged_user || user.id == self.flagger
      mutual = self.get_familiarity(user)
    else
      mutual = self.familiarity
    end
    case
    when mutual < 5
      return "< 5"
    when mutual < 10
      return "5+"
    when mutual < 25
      return "10+"
    when mutual < 50
      return "25+"
    when mutual < 100
      return "50+"
    when mutual < 250
      return "100+"
    when mutual < 500
      return "250+"
    when mutual < 750
      return "500+"
    when mutual < 1000
      return "750+"
    else
      return "1000+"
    end
  end
end
