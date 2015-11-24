require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters

  random_letters = []
  while random_letters.size < grid_size
    letter = ("A".."Z").to_a.sample
    random_letters << letter
  end
  p random_letters
end

# p generate_grid(9)

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result

final_time = (end_time - start_time)
score = attempt.size / final_time
message = "well done"

  attempt.upcase.chars.each do |letter|
    index = grid.index(letter)
    if index
      grid.delete_at(index)
    else
      score = 0
      message = "not in the grid"
    end
  end

  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  translation = ""
  open(api_url) do |stream|
  quote = JSON.parse(stream.read)
    if quote["term0"]
      attempt = quote["term0"]["PrincipalTranslations"]["0"]["OriginalTerm"]["term"]
      translation = quote["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
    else
      score = 0
      translation = nil
      message = "not an english word"
    end
  end
  attempt

  result = {
    time: final_time,
    translation: translation,
    score: score,
    message: message
  }

end
