# == Schema Information
#
# Table name: teams
#
#  id                :bigint           not null, primary key
#  draws             :integer
#  goal_difference   :integer
#  goals_against     :integer
#  goals_for         :integer
#  losses            :integer
#  number_of_players :integer
#  points            :integer
#  team_name         :string
#  wins              :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  league_id         :integer
#
class Team < ApplicationRecord
end
