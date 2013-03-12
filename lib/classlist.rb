require_relative './kid'
require 'csv'

class ClassList

  attr_accessor :kids

  def initialize(file)
    @kids = []
    CSV.foreach(file, :headers => true) do |row|
      full_name = row["First Name"].to_s + " " + row["Last Name"].to_s
      @kids << Kid.new(full_name, row["Program"], row["Session"])
    end
  end

  def list
    @kids
  end

  def sort
    @kids.sort { |x,y| x.pro_session <=> y.pro_session }   
  end

  def session_array
    @kids.uniq { |x| x.pro_session }
  end

end