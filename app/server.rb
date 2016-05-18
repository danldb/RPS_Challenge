require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/weapon'
require './app/presenters/player'
require './app/presenters/game'
require './app/presenters/weapon'

class RPS < Sinatra::Base
  enable :sessions

  get '/players/new' do
    erb :'players/new'
  end

  post '/players' do
    session[:player_name] = params[:player_name]
    redirect '/game/new'
  end

  get '/game/new' do
    build_game(session[:player_name])
    erb :'game/new'
  end

  post '/game' do
    @game = Game.current
    @game.play(player_one_weapon: params[:weapon])
    redirect '/game/result'
  end

  get '/game/result' do
    @game = Game.current
    @player = @game.player_one
    @opponent = @game.player_two
    erb :'game/result'
  end

  helpers do
   def build_game(player_name)
    game = Game.build
    game.add(Player.new(name: player_name))
    game.add(Player.new)
    @player_name = player_name
   end
  end

end
