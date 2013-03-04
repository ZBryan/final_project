class Project

  def max
  	{
  		"pike" => 5,
  		"eel" => 5,
  		"ray" => 5,
  		"starfish" => 5,
  		"polliwog" => 5,
  		"guppy" => 5,
  		"minnow" => 6,
  		"fish" => 6,
  		"flying fish" => 6,
  		"shark" => 6
  	}
 end 	


  def lower_lvl name
  	if name.count <= 5
  	  puts "#{full_names}"
  	elsif name.count >5 & <= 10
  	  name.count/2
  	  puts "#{full_names}"
  	elsif name.count >10 & <= 15
  	  name.count/3
  	  puts "#{full_names}"
  	else name.count/4   
  	  puts "#{full_names}" 	
  end




