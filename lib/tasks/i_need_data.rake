task(:sample_data => :environment) do
  if Rails.env.development?
    Player.destroy_all
    Team.destroy_all
    League.destroy_all
    Match.destroy_all
  end

  3.times do
    z = League.new

    z.league_name = Faker::Address.community
    z.start_date = Faker::Date.between(from: "2025-03-5", to: "2025-04-30")
    z.end_date = Faker::Date.between(from: "2025-05-1", to: "2025-07-30")
    z.location = Faker::Address.street_address
    z.image = "/img/logo#{rand(1..8)}.jpg"
    z.save
  end

  24.times do
    leagues = League.all.sample

    y = Team.new

    y.team_name = Faker::Sports::Football.team
    y.league_id = leagues.id
    y.save
  end

  300.times do
    teams = Team.all.sample
    x = Player.new

    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.dob = Faker::Date.birthday(min_age: 0, max_age: 35)
    x.position = Faker::Sports::Football.position
    x.jersey_number = rand(1..30)
    x.team_id = teams.id
    x.avatar = Faker::Avatar.image

    x.save
  end

  120.times do
    leagues = League.all.sample
    w = Match.new

    w.home_score = rand(0..5)
    w.away_score = rand(0..5)
    w.match_date = Faker::Date.between(from: leagues.start_date, to: leagues.end_date)

    matching_teams = Team.where({ :league_id => leagues.id })
    w.home_team_id = matching_teams.sample.id
    w.away_team_id = matching_teams.sample.id
    if w.home_team_id == w.away_team_id
      w.away_team_id = matching_teams.sample.id
    end
    w.league_id = leagues.id
    w.save
  end

  teams = Team.all
  leagues = League.all

  leagues.each do |league|
    matching_teams = Team.where({ :league_id => league.id })
    league.update(number_of_teams: matching_teams.count)
  end

  teams.each do |team|
    matching_players = Player.where({ :team_id => team.id })
    team.update(number_of_players: matching_players.count)

    home_wins = Match.where({ :home_team_id => team.id }).where('home_score > away_score').count
    away_wins = Match.where({ :away_team_id => team.id }).where('away_score > home_score').count
    wins = home_wins + away_wins

    home_draws = Match.where({ :home_team_id => team.id }).where('home_score = away_score').count
    away_draws = Match.where({ :away_team_id => team.id }).where('away_score = home_score').count
    draws = home_draws + away_draws

    home_losses = Match.where({ :home_team_id => team.id }).where('home_score < away_score').count
    away_losses = Match.where({ :away_team_id => team.id }).where('away_score < home_score').count
    losses = home_losses + away_losses

    goals_for = Match.where({ :home_team_id => team.id }).sum(:home_score) + 
  Match.where({ :away_team_id => team.id }).sum(:away_score)
     goals_against = Match.where({ :home_team_id => team.id }).sum(:away_score) + 
  Match.where({ :away_team_id => team.id }).sum(:home_score)
     gd= goals_for - goals_against 
     points = (wins * 3) + (draws * 1)
  

     team.update!(
      goals_for: goals_for,
      goals_against: goals_against,
      goal_difference: gd,
      wins: wins,
      draws: draws,
      losses: losses,
      points: points
      )

  end
end
