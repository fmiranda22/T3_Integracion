class PersonajesController < ApplicationController
  def index
    self.params = params.permit!
    idp = params["content"]
    resp =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{person(id: \"#{idp}\"){name,birthYear,eyeColor,gender,hairColor,height,mass,skinColor,homeworld{name, id},
                       filmConnection{films{title,episodeID}},
                       starshipConnection{starships{name,id}},
                       }}"}.to_json)
    @respuesta = JSON.parse(resp.body)["data"]["person"]
  end
  def all
      resp1 = HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
                   headers: {'content-type': 'application/json'},
                   body:{"query": "query{allPeople{edges{node{id, name}}}}"}.to_json)

    @respuesta1 = JSON.parse(resp1.body)["data"]["allPeople"]["edges"]
  end
end
