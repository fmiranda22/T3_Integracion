require "rubygems"
require "httparty"

class PeliculaController < ApplicationController
  include HTTParty
  def index
    self.params = params.permit!
    @episodio =  params[:informacion]
    id = @episodio["episodeID"].to_i
    response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{film(filmID: #{id}){title,releaseDate,episodeID,openingCrawl,director,producers,
                    starshipConnection{starships{name,id}},characterConnection{characters{name,id}},
                    planetConnection{planets{name,id}},
                    }}"}.to_json)


  @respuesta = JSON.parse(response1.body)["data"]["film"]

	@episodio = @respuesta["episodeID"]
	@año = @respuesta["releaseDate"]
	@director = @respuesta["director"]
	@titulo = @respuesta["title"]
	@inicio = @respuesta["openingCrawl"]
	@productores = @respuesta["producers"]

  @personajes = @respuesta["characterConnection"]["characters"]
  @planetas = @respuesta["planetConnection"]["planets"]
  @naves = @respuesta["starshipConnection"]["starships"]
  end
end
