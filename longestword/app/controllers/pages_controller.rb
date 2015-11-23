require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def game
    # TODO: generate random grid of letters

    @grid = []
    while @grid.size < 9
      letter = ("A".."Z").to_a.sample
      @grid << letter
    end
    @grid
  end

  def score
    grid = params[:grid].split(" ")
    start_time = params["start_time"].to_i
    shot = params[:shot]
    end_time = Time.now.to_i
    run_game(shot, grid, start_time, end_time)
  end

  def run_game(shot, grid, start_time, end_time)
    final_time = (end_time - start_time)
    shot = shot.upcase
    p shot
    p "shot"
    shot = shot.split("")
    p shot
    p "shoooooooooooooot"
    grid.each do |letter|
      p letter
      p "letter"
      if shot.include?(letter)
        shot.delete_at(shot.index(letter))
      else
        not_in_the_grid = "Not in the grid"
        score = 0
      end
    end
    p score
    p "score"
    @result = {
      grid: grid,
      score: score,
      final_time: final_time,
    }
  end
end
