# == Schema Information
#
# Table name: players
#
#  id            :bigint           not null, primary key
#  dob           :date
#  first_name    :string
#  jersey_number :integer
#  last_name     :string
#  position      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  team_id       :integer
#
class Player < ApplicationRecord
end

