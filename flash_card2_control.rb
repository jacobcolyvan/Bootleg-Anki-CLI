require_relative './flash_card2_classes.rb'
require_relative './arrayOfFacts.rb'
windowSize = fork{ exec 'printf', "\e[8;20;100t"}

require 'tty-box'
require 'tty-prompt'
require 'colorize'
require 'tty-font'


# create Fact objects out of array of facts
def makeFactObjects(arr)
    tempFacts = Cards.new()
    arr.each do |fact|
        tempFacts.facts.push(Fact.new([fact[0], fact[1]]))
    end
    return tempFacts
end

facts = makeFactObjects($assortedFacts)
mathQuestions = makeFactObjects($mathFacts)

puts `clear`
font = TTY::Font.new(:standard)
puts font.write("FLASHCARDS").colorize(:red)
prompt = TTY::Prompt.new
$deck = prompt.select("  What do you you want to do?\n", %w(Math Assorted))

case $deck
when "Math"
    $deck = mathQuestions
else 
    $deck = facts
end
puts `clear`

menu_choice()


