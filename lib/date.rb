require 'date'

def seg_start
  (2013,2,25)
end

def seg_end
  Date.new(3/21/13)
end

def date_range
  range = Array.new
  date = Date.new.seg_start
  range << date
  p date
  until x = [seg_end] do
    
    # advance date by 2 days
    #x = range[-1] + 2*60**2*24
    #range << x
    #break if 
    #  x = seg_end
    #end
    # advance date 4 days
    #y = range[-1] + 4*60**2*24
    #range << y
  end
  p range
end   

  