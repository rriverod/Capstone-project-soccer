# == Schema Information
#
# Table name: teams
#
#  id                :bigint           not null, primary key
#  number_of_players :integer
#  position          :integer
#  team_name         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  league_id         :integer
#
class Team < ApplicationRecord
end
