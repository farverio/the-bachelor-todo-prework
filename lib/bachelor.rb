def get_first_name_of_season_winner(data, season)
  season_array = data.fetch(season)
  
  get_first_name(
    find_participant_obj(season_array, "status", "Winner")["name"])
end

def get_contestant_name(data, occupation)
  contestant = ""
  
  data.each do |season, particpants|
    particpants.each do |participant|
      if participant["occupation"] == occupation
        contestant = participant["name"]
      end
    end
  end
  
  contestant
end

def count_contestants_by_hometown(data, hometown)
  count = 0 
  
  data.each do |season, particpants|
    particpants.each do |participant|
      if participant["hometown"] == hometown
        count += 1
      end
    end
  end
  
  count
end

def get_occupation(data, hometown)
  occupation = ""
  
  data.each do |season, particpants|
    particpants.each do |participant|
      if participant["hometown"] == hometown
        occupation = participant["occupation"]
        return occupation
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  participant_count = 0 
  
  data[season].each do |participant|
    total_age += participant["age"].to_i
    participant_count += 1 
  end
  
  (total_age.to_f / participant_count.to_f).round
end

# HELPER METHODS
def get_first_name(name)
  name.split(" ")[0]
end

def find_participant_obj(season, key_name, key_value)
  season.select do |participant_obj| 
    if participant_obj.fetch(key_name) == key_value
      return participant_obj
    end
  end
end
