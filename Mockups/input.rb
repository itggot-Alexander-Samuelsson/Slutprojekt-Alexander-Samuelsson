def example_input_loop
  puts "Mata in ett värde åt gången"
  puts "Enter för nytt värde"
  puts "avrut inmatningen med 'x'"

  values = []

  value = gets.chomp

  while value != 'x'
    values << value
    value = gets.chomp
  end


  return values
end

def example_menu
  options = ['grilla korv', 'koka banan', 'ät gröt']

  puts "Vad vill du göra?"
  number = 1
  options.each do |option|
    puts "#{number}: #{option}"
    number += 1
  end
end

def pick_menu_option
  example_menu
  puts "Enter a number from the menu"
  number = gets.chomp

  if number == '1'
puts '    example_function_1()
'  elsif number == '2'
puts '    example_function_2()
'    #..
  else
    puts 'DU VALDE FEEEEEL'
    example_menu
    pick_menu_option
  end

end

pick_menu_option
