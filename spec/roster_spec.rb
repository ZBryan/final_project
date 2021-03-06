require "rspec"
require "roster"
require "kid"

describe ClassList do

  path = ARGV.shift || "/Users/zarchary2/mystuff/RubyClass/final_project/spec/fixtures/roster_spec.csv"
  roster = ClassList.new path

  it 'File should open and run'  do
    input = roster.sessions.first
    expected = "Mon & Wed, 10:00 - 10:30am P1 - Pike"
    input.should eq expected
  end

  # "Swim Lessons, Preschool 1 - Pike" => "P1 Pike"
  it 'slice program name to shorter sorted names' do
    input = roster.sessions.first
    raw_data = "Mon & Wed, 10:00 - 10:30am Swim Lessons, Preschool 1 - Pike"
    input.should_not eq raw_data
  end

  it '#sessions should have no nil values' do
    input = roster.sessions.nil?
    expected = false
    input.should eq expected
  end

  it 'classes should be sorted by day, time, and level' do
    input = roster.sessions
    expected =  [ "Mon & Wed, 10:00 - 10:30am P1 - Pike" ,
                  "Mon & Wed, 10:30 - 11:00am P3 - Ray" , 
                  "Mon & Wed, 4:00 - 4:30pm P1 - Pike" ,
                  "Mon & Wed, 4:00 - 4:30pm Y2 - Guppy" , 
                  "Mon & Wed, 4:35 - 5:05pm P1 - Pike" , 
                  "Mon & Wed, 4:35 - 5:05pm P2 - Eel" , 
                  "Mon & Wed, 6:00 - 6:30pm P3 - Ray" , 
                  "Tues & Thurs, 4:00 - 4:30pm P1 - Pike" ]
    input.should eq expected          
  end

end  
