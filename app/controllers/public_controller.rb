require 'mysql2' 
class PublicController < ApplicationController
  
  def home
    #merges counts into one hash
    @results = Hash.new
    counts = get_counts
    counts.each do |i|
      i.each do |j|
        if @results.key?("#{j["Lot_ID"]}")
          @results["#{j["Lot_ID"]}"] = @results["#{j["Lot_ID"]}"] + j["Count"]
        else
          @results["#{j["Lot_ID"]}"] = j["Count"]
        end
      end
    end
    
    database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")
    lot_names = database.query("select DISTINCT(Lot_ID), Lot_Name, Capacity from LotList;")
    @results.keys.each do |key|
      lot_names.each do |name|
        if key.to_i == name["Lot_ID"]
          @results["#{name["Lot_Name"]}"] = name["Capacity"] - @results[key]
          @results.delete(key)
        end
      end
    end

  end

  #get counts is kinda of difficult so it get its own function
  #basically Mysql makes it difficult to get the latest recored by some id so we have to do two queries to prep for it
  def get_counts
    database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")
    cameras = database.query("select DISTINCT(Cam_ID) from CamList;")
    latest_count_times = database.query("select MAX(TimeStamp) as time from Count_Log group by cam_id;")
    counts = Array.new

    cameras.each do |cam|
      latest_count_times.each do |time|
        counts.push(database.query( "select * from Count_Log where timestamp = \'#{time["time"]}\' and Cam_ID = #{cam["Cam_ID"]};"))
      end
    end

    return counts
  end

end
