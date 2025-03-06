task(:sample_data => :environment) do
  if Rails.env.development?
    Player.destroy_all
    Team.destroy_all
    League.destroy_all
  end

  300.times do
    x = Player.new

    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.dob = Faker::Date.birthday(min_age: 0, max_age: 35)
    x.position = Faker::Sports::Football.position
    x.jersey_number = rand(1..30)
    x.team_id =rand(1..24)

    x.save
  end

  24.times do
    y = Team.new

    y.team_name = Faker::Sports::Football.team
    y.league_id = rand(1..3)
    y.save
  end

  3.times do
    z = League.new

    z.league_name = Faker::Address.community
    z.start_date = Faker::Date.between(from: '2025-03-5', to: '2025-04-30')
    z.end_date = Faker::Date.between(from: '2025-05-1', to: '2025-07-30')
    z.location = Faker::Address.street_address
    
    z.save
  end


end
