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
    if params[:Lot_ID] != -1 && params[:Lot_ID] != nil
      @lot_id= params[:Lot_ID]
    end

    @from_Month = 0
    if params[:from_Month] != 0 && params[:from_Month] != nil
      @from_Month= params[:from_Month]
    end

    @from_Day = 0
    if params[:from_Day] != 0 && params[:from_Day] != nil
      @from_Day= params[:from_Day]
    end

    @from_Year = 0
    if params[:from_Year] != 0 && params[:from_Year] != nil
      @from_Year= params[:from_Year]
    end

    @from_Time = 0
    if params[:from_Time] != 0 && params[:from_Time] != nil
      @from_Time= params[:from_Time]
    end

    @to_Month = 0
    if params[:to_Month] != 0 && params[:to_Month] != nil
      @to_Month= params[:to_Month]
    end

    @to_Day = 0
    if params[:to_Day] != 0 && params[:to_Day] != nil
      @to_Day= params[:to_Day]
    end

    @to_Year = 0
    if params[:to_Year] != 0 && params[:to_Year] != nil
      @to_Year= params[:to_Year]
    end

    @to_Time = 0
    if params[:to_Time] != 0 && params[:to_Time] != nil
      @to_Time= params[:to_Time]
    end

    @resultes = _database.query("select * from Count_Log where Lot_ID = #{@lot_id} and unix_timestamp(TimeStamp) between unix_timestamp(\'#{@from_Year}-#{@from_Month}-#{@from_Day} #{@from_Time}:00:00\') and unix_timestamp(\'#{@to_Year}-#{@to_Month}-#{@to_Day} #{@to_Time}:00:00\');")
  end

  def login
  end

  def admin_count_query

    _database = Mysql2::Client.new(:host => "localhost", :username => "ror", :password => "123", :database => "parkingbuddy")
    @lot_list = _database.query("select * from LotList;")

    @lot_id = -1
    if params[:Lot_ID] != -1 && params[:Lot_ID] != nil
      @lot_id= params[:Lot_ID]
    end

    @from_Month = 0
    if params[:from_Month] != 0 && params[:from_Month] != nil
      @from_Month= params[:from_Month]
    end

    @from_Day = 0
    if params[:from_Day] != 0 && params[:from_Day] != nil
      @from_Day= params[:from_Day]
    end

    @from_Year = 0
    if params[:from_Year] != 0 && params[:from_Year] != nil
      @from_Year= params[:from_Year]
    end

    @from_Time = 0
    if params[:from_Time] != 0 && params[:from_Time] != nil
      @from_Time= params[:from_Time]
    end

    @to_Month = 0
    if params[:to_Month] != 0 && params[:to_Month] != nil
      @to_Month= params[:to_Month]
    end

    @to_Day = 0
    if params[:to_Day] != 0 && params[:to_Day] != nil
      @to_Day= params[:to_Day]
    end

    @to_Year = 0
    if params[:to_Year] != 0 && params[:to_Year] != nil
      @to_Year= params[:to_Year]
    end

    @to_Time = 0
    if params[:to_Time] != 0 && params[:to_Time] != nil
      @to_Time= params[:to_Time]
    end

    @gl_than = ">"
    if params[:gl_than] != nil
      @gl_than= params[:gl_than]
    end

    @count = 0
    if params[:count] != 0 && params[:count] != nil
      @count= params[:count]
    end

    puts "select * from Count_Log where Count #{@gl_than} #{@count} and unix_timestamp(TimeStamp) between unix_timestamp(\'#{@from_Year}-#{@from_Month}-#{@from_Day} #{@from_Time}:00:00\') and unix_timestamp(\'#{@to_Year}-#{@to_Month}-#{@to_Day} #{@to_Time}:00:00\');"
    @resultes = _database.query("select * from Count_Log where Count #{@gl_than} #{@count} and unix_timestamp(TimeStamp) between unix_timestamp(\'#{@from_Year}-#{@from_Month}-#{@from_Day} #{@from_Time}:00:00\') and unix_timestamp(\'#{@to_Year}-#{@to_Month}-#{@to_Day} #{@to_Time}:00:00\');")
  
  end

  def main_menu
  end



end
