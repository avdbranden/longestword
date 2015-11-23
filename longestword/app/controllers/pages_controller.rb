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


  end
end
