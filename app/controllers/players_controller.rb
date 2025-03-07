class PlayersController < ApplicationController
  def index
    matching_players = Player.all

    @list_of_players = matching_players.order({ :created_at => :desc })

    render({ :template => "players/index" })
  end

  def backdoor
    render({:template => "players/backdoor"})

  end

  def show
    the_id = params.fetch("path_id")

    matching_players = Player.where({ :id => the_id })

    @the_player = matching_players.at(0)

    render({ :template => "players/show" })
  end

  def create
    the_player = Player.new
    the_player.first_name = params.fetch("query_first_name")
    the_player.last_name = params.fetch("query_last_name")
    the_player.position = params.fetch("query_position")
    the_player.jersey_number = params.fetch("query_jersey_number")
    the_player.dob = params.fetch("query_dob")
      
    this_team_name = params.fetch("query_team_name")
    team= Team.where({:team_name => this_team_name}).at(0)
    if team==nil
    the_player.team_id = Team.all.sample.id
    else
    the_player.team_id = team.id
    end


    the_player.avatar = params.fetch("query_avatar")

    if the_player.valid?
      the_player.save
      redirect_to("/players", { :notice => "Player created successfully." })
    else
      redirect_to("/players", { :alert => the_player.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.player_id = params.fetch("query_player_id")
    the_player.first_name = params.fetch("query_first_name")
    the_player.last_name = params.fetch("query_last_name")
    the_player.position = params.fetch("query_position")
    the_player.jersey_number = params.fetch("query_jersey_number")
    the_player.dob = params.fetch("query_dob")
    the_player.team_id = params.fetch("query_team_id")

    if the_player.valid?
      the_player.save
      redirect_to("/players/#{the_player.id}", { :notice => "Player updated successfully."} )
    else
      redirect_to("/players/#{the_player.id}", { :alert => the_player.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.destroy

    redirect_to("/players", { :notice => "Player deleted successfully."} )
  end
end
