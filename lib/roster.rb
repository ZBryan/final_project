require_relative '../lib/classlist'
require_relative '../lib/kid'

path = ARGV.shift || "/Users/zarchary2/mystuff/RubyClass/final_project/lib/roster_test(2).csv"
roster = ClassList.new path

io = $stdout
IO.popen("pbcopy", "w") { |io|
  roster.sessions.each do |session|
    kids = roster.kids.select { |kid| kid.pro_session == session }

    max  = kids.first.max_class_size

    bucket_count = (kids.size / max).ceil
    avg = kids.size.to_f / bucket_count
    classes = kids.each_slice(avg.ceil).to_a

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
