class PlanetaController < ApplicationController
  def index
    self.params = params.permit!
    idp = params["content"]
    resp =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{planet(id: \"#{idp}\"){name,diameter,rotationPeriod, orbitalPeriod, gravity, population, climates
               ,terrains,surfaceWater,residentConnection{residents{name,id}},filmConnection{films{title,episodeID}},}}"}.to_json)
    @respuesta = JSON.parse(resp.body)["data"]["planet"]
  end
  def all
      resp1 = HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
                   headers: {'content-type': 'application/json'},
                   body:{"query": "query{allPlanets{edges{node{id, name}}}}"}.to_json)

    @respuesta1 = JSON.parse(resp1.body)["data"]["allPlanets"]["edges"]
  end
end
