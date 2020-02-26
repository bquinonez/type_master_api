class PlayersController < ApplicationController

    def index 
        @players = Player.all
        render json: @players
    end

    def create
        @player = Player.create(player_params)
        if @player.valid?
            render json: @player
        else
            render json: {errors: @player.errors.full_messages}
        end
    end

    def update
        @player = Player.find(params[:id])
        @player.update(player_params)
        render json: @player
    end

    private

    def player_params
        params.permit(:name)
    end

end
