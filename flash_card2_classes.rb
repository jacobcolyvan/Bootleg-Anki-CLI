
# Repeats facts a maximum of 5 five times (or two for those above a
# learning metric of 1), and displaying those less well known first. 

class Fact
    attr_accessor :question, :answer, :metric, :repeat_count, :last_displayed
    def initialize(question, answer)
        @question = question
        @answer = answer
        # learning metric 
        @metric = 1.0
        @last_displayed = false
    end
end

# card class
class Cards 
    attr_accessor :facts, :userAnswer
    def initialize()
        @facts = []
        @userAnswer = nil
        @user_score = 0
    end

    # def ask_q()
    def random_question_mode()
        puts 
        question_count = 0
        prompt = TTY::Prompt.new
        while userAnswer != "" && question_count < 15
                # sort facts by learning metric, checking to see if they were last displayed
                i = 0
                @facts = sort_by_metric(@facts)
                if @facts[i].last_displayed
                    i = rand(0..@facts.length-1)
                end
                
                userAnswer = prompt.ask(" #{@facts[i].question}  ")
                # print TTY::Box.frame @facts[i].question
                check_answer(userAnswer, i)

                @facts[i].last_displayed = !@facts[i].last_displayed
                question_count += 1
            
        end
        # puts "You got #{@user_score}/15 \n \n \n"
        font = TTY::Font.new(:doom)
        puts font.write("You got     #{@user_score}/15").colorize(:red)
        sleep(2)
        @user_score = 0
        menu_choice()
    end 

    def check_answer(userAnswer, i)
        if @facts[i].answer == userAnswer
            puts "  Nice Work! \n  ------- "
            @facts[i].metric *= 1.2
            @user_score += 1
        else
            wrongAnswer =  "  Nup, the answer is:  " +"#{@facts[i].answer}".colorize(:red) + "  \n -------"
            # print TTY::Box.frame wrongAnswer
            puts wrongAnswer
            @facts[i].metric *= 0.8
        end
    end

    def sort_by_metric(array)
        #bubble sort
        return array if array.size <= 1
        swap = true
        while swap
            swap = false
            (array.length - 1).times do |x|
            if array[x].metric > array[x+1].metric 
                array[x], array[x+1] = array[x+1], array[x]
                swap = true
            end
            end
        end
        return array  
    end

    

    def choose_q(with_answer)
        # list facts and allow you to choose using tty-prompt 
        prompt = TTY::Prompt.new
        questions = []
        @facts.each  do |fact|
            questions.push(fact.question)
        end

        choice = prompt.select("  Choose a question", questions)
        for i in 0..@facts.length-1
            if choice == @facts[i].question && !with_answer
                userAnswer = prompt.ask(" #{choice}")
                check_answer(userAnswer, i)
            elsif choice == @facts[i].question && with_answer
                puts " #{@facts[i].answer}"
            end
        end
        sleep(1)
        menu_choice()
        
    end

    def add_fact
        prompt = TTY::Prompt.new
        q = prompt.ask(" What is your question?")
        a = prompt.ask(" What is the answer?")
        @facts.push(Fact.new(q, a))
        puts @facts[-1].question
        
        sleep(1)
        menu_choice()
    end
end


def menu_choice
    puts`clear`
    choices =  [
        " Choose Questions Mode (you see the answers)", 
        " Choose Questions Mode (you pick the answers)",
        " Random Question Mode",
        " Add new question", 
        " Exit"
    ]

    prompt = TTY::Prompt.new
    choice = prompt.select("  What do you you want to do?\n", choices)
    
    case choice
    when choices[0]
        $mathQuestions.choose_q(true)
    when choices[1]
        $mathQuestions.choose_q(false)
    when choices[2]
        $mathQuestions.random_question_mode()
    when choices[3]
        $mathQuestions.add_fact()
    else 
        puts
        exit
    end
end


