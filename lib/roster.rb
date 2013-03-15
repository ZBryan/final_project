require_relative './classlist'

path = ARGV.shift || "roster_test(2).csv"
roster = ClassList.new path

io = $stdout
IO.popen("pbcopy", "w") { |io|
  roster.sessions.each do |session|
    kids = roster.kids.select { |kid| kid.pro_session == session }
    # puts sbux.class_max

    # a = 0
    # b = 0

    # class_array = []

    max  = kids.first.max_class_size

    bucket_count = (kids.size / max).ceil
    avg = kids.size.to_f / bucket_count
    classes = kids.each_slice(avg.ceil).to_a

    # while a < sbux.count
    #   if class_array.at(b) == nil
    #     class_array[b] = []
    #   end
    #   if b + 1 < (sbux.count/5.0).ceil
    #     class_array[b] << sbux[a]
    #     b += 1
    #   else
    #     class_array[b] << sbux[a]
    #     b = 0
    #   end
    #   a += 1
    # end

    io.puts session
    io.puts
    classes.each do |klass|
      klass.each do |kid|
        io.puts kid.name
      end
      io.puts
    end

  end
}

