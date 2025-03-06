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
    z.avatar = Faker::LoremFlickr.image(size: "50x60", search_terms: ['soccer'])

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

  80.times do
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
  end
end
