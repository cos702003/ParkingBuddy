require 'mysql2' 

class AdminController < ApplicationController
  def cam_configuration

    _database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")

    @camera_list = _database.query("select * from CamList;")
    lot_list = _database.query("select * from LotList;")

    @camera_list.each do |cam|
      lot_list.each do |lot|
        if cam["L_ID"] == lot["Lot_ID"]
          cam["L_ID"] = lot["Lot_Name"]
        end
      end
    end

  end

  def lot_configuration
    _database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")
    @lot_list = _database.query("select * from LotList;")

  end

  def admin_query
    _database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")
    @lot_list = _database.query("select * from LotList;")

    @lot_id = -1
    if params[:Lot_ID] != -1
      @lot_id= params[:Lot_ID]
    end

    @from_Month = 0
    if params[:from_Month] != 0
      @from_Month= params[:from_Month]
    end

    @from_Day = 0
    if params[:from_Day] != 0
      @from_Day= params[:from_Day]
    end

    @from_Year = 0
    if params[:from_Year] != 0
      @from_Year= params[:from_Year]
    end

    @from_Time = 0
    if params[:from_Time] != 0
      @from_Time= params[:from_Time]
    end

    @to_Month = 0
    if params[:to_Month] != 0
      @to_Month= params[:to_Month]
    end

    @to_Day = 0
    if params[:to_Day] != 0
      @to_Day= params[:to_Day]
    end

    @to_Year = 0
    if params[:to_Year] != 0
      @to_Year= params[:to_Year]
    end

    @to_Time = 0
    if params[:to_Time] != 0
      @to_Time= params[:to_Time]
    end

    puts "select * from Count_Log where Lot_ID = #{@lot_id} and unix_timestamp(TimeStamp) between unix_timestamp(\'#{@from_Year}-#{@from_Month}-#{@from_Day} #{@from_Time}:00:00\') and unix_timestamp(\'#{@to_Year}-#{@to_Month}-#{@to_Day} #{@to_Time}:00:00\');"
    @resultes = _database.query("select * from Count_Log where Lot_ID = #{@lot_id} and unix_timestamp(TimeStamp) between unix_timestamp(\'#{@from_Year}-#{@from_Month}-#{@from_Day} #{@from_Time}:00:00\') and unix_timestamp(\'#{@to_Year}-#{@to_Month}-#{@to_Day} #{@to_Time}:00:00\');")
    
    @resultes.each do |row|
      puts row
    end
  end

  def login
  end


end
