# == Schema Information
#
# Table name: leagues
#
#  id              :bigint           not null, primary key
#  end_date        :date
#  league_name     :string
#  location        :string
#  number_of_teams :integer
#  start_date      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class League < ApplicationRecord
end
