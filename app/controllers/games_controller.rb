class GamesController < ApplicationController

    def index 
        @games = Game.all
        render json: @games, except: [:created_at, :updated_at], include: {player: {only: [:name]}}
    end

    def create
        @game = Game.create(game_params)
        render json: @game, except: [:created_at, :updated_at], include: {player: {only: [:name]}}
    end


    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        render json: @game
    end





    private

    def game_params
        params.permit(:player_id, :score)
    end


end
