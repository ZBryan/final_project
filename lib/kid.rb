require 'roo'
require 'from_excel'

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
end

program_size = {
                "Swim Lessons, Youth 1 - Polliwog" => 4,
               }

File.open("roster_test.xls") do |f|
  kids = Kid.from_excel(f)

  kids.reject! { |kid| kid.program.nil? or kid.program.empty? }

  kids.each do |kid|
    # do any extra sanity checking here
  end

  groups = kids.group_by { |kid| kid.program }

  groups.each do |program, group|
    size = program_size[program]
    group.each_slice(size).each do |subgroup|
      p subgroup.size
    end
  end
end
