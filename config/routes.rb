Rails.application.routes.draw do
 
  get("/", { :controller => "leagues" , :action => "index" })

  #------------------------------

  # Routes for the League resource:

  # CREATE
  post("/insert_league", { :controller => "leagues", :action => "create" })

  # READ
  get("/leagues", { :controller => "leagues", :action => "index" })

  
  get("/leagues/backdoor", { :controller => "leagues", :action => "backdoor" })

  get("/leagues/:path_id", { :controller => "leagues", :action => "show" })


  # UPDATE

  post("/modify_league/:path_id", { :controller => "leagues", :action => "update" })

  # DELETE
  get("/delete_league/:path_id", { :controller => "leagues", :action => "destroy" })

  #------------------------------

  # Routes for the Team resource:

  # CREATE
  post("/insert_team", { :controller => "teams", :action => "create" })

  # READ
  get("/teams", { :controller => "teams", :action => "index" })
  
  get("/teams/backdoor", { :controller => "teams", :action => "backdoor" })

  get("/teams/:path_id", { :controller => "teams", :action => "show" })

  # UPDATE

  post("/modify_team/:path_id", { :controller => "teams", :action => "update" })

  # DELETE
  get("/delete_team/:path_id", { :controller => "teams", :action => "destroy" })

  #------------------------------

  # Routes for the Player resource:

  # CREATE
  post("/insert_player", { :controller => "players", :action => "create" })

  # READ
  get("/players", { :controller => "players", :action => "index" })

  get("/players/backdoor", { :controller => "players", :action => "backdoor" })


  get("/players/:path_id", { :controller => "players", :action => "show" })

  # UPDATE

  post("/modify_player/:path_id", { :controller => "players", :action => "update" })

  # DELETE
  get("/delete_player/:path_id", { :controller => "players", :action => "destroy" })

  #------------------------------

  # Routes for the Match resource:

  # CREATE
  post("/insert_match", { :controller => "matches", :action => "create" })

  # READ
  get("/matches", { :controller => "matches", :action => "index" })

  get("/matches/backdoor", { :controller => "matches", :action => "backdoor" })


  get("/matches/:path_id", { :controller => "matches", :action => "show" })

  # UPDATE

  post("/modify_match/:path_id", { :controller => "matches", :action => "update" })

  # DELETE
  get("/delete_match/:path_id", { :controller => "matches", :action => "destroy" })

end
