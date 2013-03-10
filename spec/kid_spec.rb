require 'rspec'
require 'roo'
require 'from_excel'
require 'kid'

Excel = Roo::Excel

describe Kid do
  include ExcelImport	
  
    
    it 'has a program' do
    	Kid.new({program: 'foo'}).program.should eq 'foo'
    end

end

