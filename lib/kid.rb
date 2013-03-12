
class Kid
  attr_accessor :name, :program, :session

  def initialize(name, program, session)
    @name = name
    @program = program
    @session = session
  end	
  
  def pro_session
    if @program.nil? or @session.nil?
      return ""
    else 
       @session.to_s + " " + @program.slice(@program.index(/\d/), @program.length).to_s
    end

  end

end