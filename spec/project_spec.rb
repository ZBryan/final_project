$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'roo'
require 'from_excel'
require 'kid'

Excel = Roo::Excel

descibe Roster do
  include ExcelImport	
  subject = File.open("../lib/roster_test.xls") do |f|
  	kids = from_excel(f)
  end
    
    it 'take an excel file and make an array of hash'
  
    it '#program, returns level' do 
	
    end

    it 'should return an array with esential information'

    it 'should put the class time and day once'

    it 'populates course levels with students first and last name'

    it 'populates name of level ie (pike, or p1)'

    it 'builds a second class of same name if larger than size limit'

    it 'if divided into two or more classes divides them equally'

    it 'exports to excel'

    it 'exports to pdf'

    it 'has class date range functionality'

end

