require 'csv'
require 'pp'
# class to manage list of contacts
#


class Data_File


  def initialize 
    @kids = []
    CSV.foreach("lib/roster_test(2).csv", :headers => true) do |row|
      @kids << row.to_hash
    end
  end

  def full_name
    "#{@kids[:"first_name"]} " + "#{@kids[:"last_name"]}"
  end

  def program
    @kids["Program"]
  end

  def sort_session
    @kids.reject! { |kid| kid["Session"].nil? or kid["Session"].empty? }
    sessions = {}
    @kids.each do |kid|
      unless sessions.has_key? kid["Session"]
        sessions[kid["Session"]] = []
      end
      sessions[kid["Session"]] << kid
    end
    sessions
  end
  
  def sort_program
    @kids.reject! { |kid| kid["Session"].nil? or kid["Session"].empty? }
    program = {}
    @kids.each do |kid|
      unless program.has_key? kid["Program"]
        program[kid["Program"]] = []
      end
      program[kid["Program"]] << kid
    end
    program
  end

  # def sort_all
  #   @kid.sort {|x,y| x[sort_session] <=> y[sort_session]}
  # end

end

test = Data_File.new
sessions = test.sort_session
# programs = test.sort_program
# sessions.sort {|x,y| x["Session"] <=> y["Session"]}
puts sessions.class
sessions.each_key do |key|
  puts key
  # programs.each_key do |key|
  # puts key
  # programs[key].each do |kid|
  #   puts "#{kid['First Name']} #{kid['Last Name']}"
  # end
  # sessions[key].each do |kid|
  #   puts "#{kid['First Name']} #{kid['Last Name']}"
  # end
# programs.each_key do |key|
#   puts key
#   programs[key].each do |kid|
#     puts "#{kid['First Name']} #{kid['Last Name']}"
#   end

end



