require_relative './flash_card2_classes.rb'

require 'tty-box'
require 'tty-prompt'

spaceFacts = Cards.new()
deepOceanFacts = Cards.new()
$mathQuestions = Cards.new()

$mathQuestions.facts.push(Fact.new("What is 7 + 2?", "9"))
$mathQuestions.facts.push(Fact.new("What is 6 x 6?", "36"))
$mathQuestions.facts.push(Fact.new("What is 3^3?", "27"))
$mathQuestions.facts.push(Fact.new("What is 3^2?", "9"))
$mathQuestions.facts.push(Fact.new("What is 3^3?", "27"))
$mathQuestions.facts.push(Fact.new("What is 90 x 0?", "27"))

# mathQuestions.ask_q()



def menu_choice
    puts
    choices =  ["Choose Questions Mode (you see the answers)", "Random Question Mode", "Add new question", "Exit"]
    prompt = TTY::Prompt.new
    choice = prompt.select("What do you you want to do?", choices)

    if choice == choices[0]
        $mathQuestions.choose_q()
    elsif choice == choices[1]
        $mathQuestions.random_question_mode()
    elsif choice == choices[2]
        $mathQuestions.add_fact()
    else 
        puts
        exit
    end
end

menu_choice()


