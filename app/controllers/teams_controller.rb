class TeamsController < ApplicationController
  def index
    matching_teams = Team.all

    @list_of_teams = matching_teams.order({ :created_at => :desc })

    render({ :template => "teams/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_teams = Team.where({ :id => the_id })
    @list_of_players = Player.where({ :team_id => the_id })

    @the_team = matching_teams.at(0)

    

    render({ :template => "teams/show" })
  end

  def backdoor
    render({:template => "teams/backdoor"})

  end

  def create
    the_team = Team.new
    the_team.team_name = params.fetch("query_team_name")
    the_team.number_of_players = params.fetch("query_number_of_players")
    this_league_name = params.fetch("query_league_name")
    league= League.where({:league_name => this_league_name}).at(0)
    if league==nil
      flash[:alert] = "League '#{this_league_name}' not found."
      redirect_to("/teams") and return

    else
    the_team.league_id = league.id
    end


    
    the_team.goals_for = params.fetch("query_goals_for")
    the_team.goals_against = params.fetch("query_goals_against")
    the_team.goal_difference = params.fetch("query_goal_difference")
    the_team.wins = params.fetch("query_wins")
    the_team.draws = params.fetch("query_draws")
    the_team.losses = params.fetch("query_losses")
    the_team.points = params.fetch("query_points")


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

    the_team.team_name = params.fetch("query_team_name")
    this_league_name = params.fetch("query_league_name")
    league= League.where({:league_name => this_league_name}).at(0)
    if league==nil
      flash[:alert] = "League '#{this_league_name}' not found."
      redirect_to("/teams") and return

    else
    the_team.league_id = league.id
    end



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
