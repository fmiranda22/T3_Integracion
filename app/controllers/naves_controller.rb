class NavesController < ApplicationController

  def index
    self.params = params.permit!
    idp = params["content"]
    resp =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{starship(id: \"#{idp}\"){name,model,starshipClass,manufacturers,costInCredits
               ,length,crew,passengers,maxAtmospheringSpeed, hyperdriveRating,MGLT, cargoCapacity, consumables,
               pilotConnection{pilots{name,id}},
               filmConnection{films{title,episodeID}},}}"}.to_json)
    @respuesta = JSON.parse(resp.body)["data"]["starship"]
  end
  def all
      resp1 = HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
                   headers: {'content-type': 'application/json'},
                   body:{"query": "query{allStarships{edges{node{id, name}}}}"}.to_json)

    @respuesta1 = JSON.parse(resp1.body)["data"]["allStarships"]["edges"]
  end

end
