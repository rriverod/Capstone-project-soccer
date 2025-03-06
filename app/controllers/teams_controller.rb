class TeamsController < ApplicationController
  def index
    matching_teams = Team.all

    @list_of_teams = matching_teams.order({ :created_at => :desc })

    render({ :template => "teams/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_teams = Team.where({ :id => the_id })

    @the_team = matching_teams.at(0)

    render({ :template => "teams/show" })
  end

  def create
    the_team = Team.new
    the_team.team_id = params.fetch("query_team_id")
    the_team.team_name = params.fetch("query_team_name")
    the_team.number_of_players = params.fetch("query_number_of_players")
    the_team.position = params.fetch("query_position")

    if the_team.valid?
      the_team.save
      redirect_to("/teams", { :notice => "Team created successfully." })
    else
      redirect_to("/teams", { :alert => the_team.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_team = Team.where({ :id => the_id }).at(0)

    the_team.team_id = params.fetch("query_team_id")
    the_team.team_name = params.fetch("query_team_name")
    the_team.number_of_players = params.fetch("query_number_of_players")
    the_team.position = params.fetch("query_position")

    if the_team.valid?
      the_team.save
      redirect_to("/teams/#{the_team.id}", { :notice => "Team updated successfully."} )
    else
      redirect_to("/teams/#{the_team.id}", { :alert => the_team.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_team = Team.where({ :id => the_id }).at(0)

    the_team.destroy

    redirect_to("/teams", { :notice => "Team deleted successfully."} )
  end
end
