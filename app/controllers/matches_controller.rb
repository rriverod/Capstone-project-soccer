class MatchesController < ApplicationController
  def index
    matching_matches = Match.all

    @list_of_matches = matching_matches.order({ :created_at => :desc })

    render({ :template => "matches/index" })
  end


  def backdoor
    render({:template => "matches/backdoor"})

  end

  def show
    the_id = params.fetch("path_id")

    matching_matches = Match.where({ :id => the_id })

    @the_match = matching_matches.at(0)

    render({ :template => "matches/show" })
  end

  def create
    the_match = Match.new
    this_league_name = params.fetch("query_league_name")
    league= League.where({:league_name => this_league_name}).at(0)
    the_match.league_id = league.id
   
    home_team_name = params.fetch("query_home_team_name")
    teamh= Team.where({:team_name => home_team_name}).at(0)
    the_match.home_team_id = teamh.id
    
    
    away_team_name = params.fetch("query_away_team_name")
    teama= Team.where({:team_name => away_team_name}).at(0)
    the_match.away_team_id = teama.id
    
    
    the_match.match_date = params.fetch("query_match_date")
    the_match.home_score = params.fetch("query_home_score")
    the_match.away_score = params.fetch("query_away_score")

    if the_match.valid?
      the_match.save
      redirect_to("/matches", { :notice => "Match created successfully." })
    else
      redirect_to("/matches", { :alert => the_match.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_match = Match.where({ :id => the_id }).at(0)

    the_match.league_id = params.fetch("query_league_id")
    the_match.home_team_id = params.fetch("query_home_team_id")
    the_match.away_team_id = params.fetch("query_away_team_id")
    the_match.match_date = params.fetch("query_match_date")
    the_match.home_score = params.fetch("query_home_score")
    the_match.away_score = params.fetch("query_away_score")

    if the_match.valid?
      the_match.save
      redirect_to("/matches/#{the_match.id}", { :notice => "Match updated successfully."} )
    else
      redirect_to("/matches/#{the_match.id}", { :alert => the_match.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_match = Match.where({ :id => the_id }).at(0)

    the_match.destroy

    redirect_to("/matches", { :notice => "Match deleted successfully."} )
  end
end
