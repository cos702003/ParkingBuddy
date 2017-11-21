require 'mysql2' 

class AdminController < ApplicationController
  def configuration

    _database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")

    @camera_list = _database.query("select * from CamList;")
    @lot_list = _database.query("select * from LotList;")
    lot_list = _database.query("select * from LotList;")

    @camera_list.each do |cam|
      lot_list.each do |lot|
        if cam["L_ID"] == lot["Lot_ID"]
          cam["L_ID"] = lot["Lot_Name"]
        end
      end
    end

    

  end
end
