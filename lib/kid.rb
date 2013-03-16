
class Kid
  attr_accessor :name, :program, :session

  def initialize(name, program, session)
    @name = name
    @program = program
    @session = session
  end	
  
  def pro_slice
    # "Swim Lessons, Preschool 1 - Pike" => "P1 Pike"
    @program.slice(@program.index(/,/) + 2).to_s + @program.slice(@program.index(/\d/), @program.length).to_s
  end

  def pro_session
    if @program.nil? or @session.nil?
      return ""
    else 
       @session.to_s + " " + self.pro_slice
    end

  end

  def max_class_size
    5.0
  end

end