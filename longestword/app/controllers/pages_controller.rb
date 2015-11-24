require 'open-uri'
require 'json'
require 'longestword'

class PagesController < ApplicationController
  def game
    @grid = generate_grid(10)
    @start = Time.now
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid].split(",")
    @start = params[:start].to_datetime
    @result = run_game(@attempt, @grid, @start, Time.now)
  end

end
