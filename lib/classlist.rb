require_relative './kid'
require 'csv'

class ClassList

  attr_accessor :kids

  def initialize(file)
    @kids = []
    CSV.foreach(file, :headers => true) do |row|
      full_name = "#{row["First Name"]} #{row["Last Name"]}"
      @kids << Kid.new(full_name, row["Program"], row["Session"])
    end
  end

  def sessions
    @kids.reject! { |kid| kid.pro_session.nil? or kid.pro_session.empty? }
    @kids.map { |kid| kid.pro_session }.uniq.sort
  end

  # def class_max level
  #   if level.count <= 5
  #     level.count
  #   elsif level.count >= 6 <= 10
  #     level.count/2
  #   else level.count >= 11 <= 15
  #     level.count/3
  #   end
  # end

end