require_relative './classlist'

test = ClassList.new "roster_test(2).csv"
test.sort.each do |x|
	#puts x.name + "////" + x.pro_session
end

test.session_array.each do |x|
  sbux = test.kids.select { |y| y.pro_session == x.pro_session }
    a = 0
    b = 0

    class_array = Array.new

    while a < sbux.count
      if class_array.at(b) == nil
        class_array[b] = Array.new
      end
      if b <= (sbux.count/5.0).ceil
        class_array[b] << sbux[a]
      b += 1
      else
        class_array[b] << sbux[a]
        b = 0
      end
      a += 1
    end
    puts "+++++++" + x.pro_session
    class_array.each do |ca|
      puts " ====New Class"
      ca.each { |p| puts p.name}
    end

end

