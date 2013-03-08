require 'roo'
require 'from_excel'
require 'date'

require 'pp'

Excel = Roo::Excel

class Kid
  include ExcelImport

  attr_accessor :data

  def initialize(h)
    self.data = h
  end

  def program
    data[:program]
  end

  def full_name
    "#{data[:first_name]}" + " #{data[:last_name]}" 
  end
  
  def seg_start
    data[:first_segment_starts]
  end

  def seg_end
    data[:last_segment_ends]
  end
    
  def time
    data[:session_time]
  end
  
  def day_time
    data[:session]
  end

  def date_range
    #range = Array.new
    date = seg_start
    p date.to_s
    x = date + 2
    p x.to_s
    while x < seg_end-1 do
      x = x + 5
      p x.to_s
      x = x + 2
      p x.to_s
    end 
  end  

end

program_size = {
                "Swim Lessons, Preschool 1 - Pike"     => 5,
                "Swim Lessons, Preschool 2 - Eel"      => 5,
                "Swim Lessons, Preschool 3 - Ray"      => 5,
                "Swim Lessons, Preschool 4 - Starfish" => 5,
                "Swim Lessons, Youth 1 - Polliwog"     => 5,
                "Swim Lessons, Youth 2 - Guppy"        => 5,
                "Swim Lessons, Youth 3 - Minnow"       => 6,
                "Swim Lessons, Youth 4 - Fish"         => 6,
                "Swim Lessons, Youth 5 - Flying Fish"  => 6,
                "Swim Lessons, Youth 6 - Shark"        => 6,
               }

File.open("roster_test(2).xls") do |f|
  kids = Kid.from_excel(f)

  kids.reject! { |kid| kid.program.nil? or kid.program.empty? }

  kids.each do |kid|
    # do any extra sanity checking here
    #p kid.full_name
    #p kid.seg_start.to_s
    #p kid.time
    #p kid.date_range
    #p kid.day_time
  end

  groups = kids.group_by do |kid| 
    #kid.day_time
    kid.program
  end

pp groups
  #groups.each do |day_time, group|
  #  #time =
  #  group.each_slice(day_time).uniq? do |subgroup|
  #    p subgroup
  #  end  
  #end

  groups.each do |program, group|
    size = program_size[program]
    group.each_slice(size).each do |subgroup|
      #p subgroup.size
    end
  end


end
