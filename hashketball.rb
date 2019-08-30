# Write your code here!
require "pry"

def game_hash
  teams = {
    :home => {:team_name => "Brooklyn Nets",
              :colors => ["Black", "White"], 
              :players => [:"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, :"Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, :"Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}, :"Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, :"Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]},
              
              
    :away => {:team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"], 
              :players => [:"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, :"Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10}, :"DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5}, :"Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}, :"Kemba Walker" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}]}
  }
  return teams
end


def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if name == player_name_in_hash.to_s
          return player_stats[:points]
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if name == player_name_in_hash.to_s
          return player_stats[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team == team_data[:team_name].to_s
      return team_data[:colors]
    end
  end
end

def team_names
  teams_arr = []
  game_hash.each do |location, team_data|
    teams_arr.push(team_data[:team_name].to_s)
  end
  return teams_arr
end

def player_numbers(team)
  nums = []
  game_hash.each do |location, team_data|
    if team == team_data[:team_name].to_s
      team_data[:players].each do |players_and_their_stats|
        players_and_their_stats.each do |player_name_in_hash, player_stats|
          nums.push(player_stats[:number].to_i)
        end
      end
    end
  end
  return nums
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if name == player_name_in_hash.to_s
          return player_stats
        end
      end
    end
  end
end

def big_shoe_rebounds
  size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if size < player_stats[:shoe]
          # everytime we reach a player with a shoe size bigger than the previous player, their rebounds will be recorded
          size = player_stats[:shoe]
          rebounds = player_stats[:rebounds]
        end
      end
    end
  end
  return rebounds
end

# Bonus questions below

def most_points_scored
  points = 0
  player_w_points = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
          if points < player_stats[:points]
            points = player_stats[:points]
            player_w_points = player_name_in_hash.to_s
          end
      end
    end
  end
  return player_w_points
end



def player_with_longest_name
  length = 0
  longest_player = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if length < player_name_in_hash.to_s.length
          length = player_name_in_hash.to_s.length
          longest_player = player_name_in_hash.to_s
        end
      end
    end
  end
  return longest_player
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name.to_s
  steals = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if player_name_in_hash.to_s == long_name
          steals = player_stats[:steals].to_i
        end
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data[:players].each do |players_and_their_stats|
      players_and_their_stats.each do |player_name_in_hash, player_stats|
        if steals < player_stats[:steals].to_i
          return false
        end
      end
    end
  end
  return true
end

