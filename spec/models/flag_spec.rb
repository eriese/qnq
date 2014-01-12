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

require 'spec_helper'

describe Flag do
  pending "add some examples to (or delete) #{__FILE__}"
end
