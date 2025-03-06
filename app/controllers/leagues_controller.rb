class LeaguesController < ApplicationController
  def index
    matching_leagues = League.all

    @list_of_leagues = matching_leagues.order({ :created_at => :desc })

    render({ :template => "leagues/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_leagues = League.where({ :id => the_id })
    @matching_teams = Team.where({ :league_id => the_id })
    @matching_teams = @matching_teams.order(points: :desc)

    @the_league = matching_leagues.at(0)

    render({ :template => "leagues/show" })
  end

  def backdoor
    render({:template => "leagues/backdoor"})

  end

  def create
    the_league = League.new
    the_league.league_name = params.fetch("query_league_name")
    the_league.start_date = params.fetch("query_start_date")
    the_league.end_date = params.fetch("query_end_date")
    the_league.number_of_teams = params.fetch("query_number_of_teams")
    the_league.image = params.fetch("query_image")

    if the_league.valid?
      the_league.save
      redirect_to("/leagues", { :notice => "League created successfully." })
    else
      redirect_to("/leagues", { :alert => the_league.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_league = League.where({ :id => the_id }).at(0)

    the_league.league_id = params.fetch("query_league_id")
    the_league.league_name = params.fetch("query_league_name")
    the_league.start_date = params.fetch("query_start_date")
    the_league.end_date = params.fetch("query_end_date")
    the_league.number_of_teams = params.fetch("query_number_of_teams")

    if the_league.valid?
      the_league.save
      redirect_to("/leagues/#{the_league.id}", { :notice => "League updated successfully."} )
    else
      redirect_to("/leagues/#{the_league.id}", { :alert => the_league.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_league = League.where({ :id => the_id }).at(0)

    the_league.destroy

    redirect_to("/leagues", { :notice => "League deleted successfully."} )
  end
end
