# == Schema Information
#
# Table name: matches
#
#  id           :bigint           not null, primary key
#  away_score   :integer
#  home_score   :integer
#  match_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  away_team_id :integer
#  home_team_id :integer
#  league_id    :integer
#
class Match < ApplicationRecord

  validates :league_id, presence: true
  validates :match_date, presence: true


end
