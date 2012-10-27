# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  who             :string(255)
#  what            :string(255)
#  start_date      :date
#  end_date        :date
#  where           :string(255)
#  why             :text
#  how             :text
#  user_id         :integer
#  type_of_project :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
