require 'roo'
require 'from_excel'

Excel.new

class Student
include ExcelImport
end

File.open("roster_test.xls") do |f|
  data = Student.from_excel(f)

  p data
end
