class Fact
    attr_accessor :question, :answer, :metric, :repeat_count, :last_displayed
    def initialize(question_answer)
        @question = question_answer[0]
        @answer = question_answer[1]
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

    def random_question_mode()
        for i in 0..@facts.length-1
            facts[i].metric = 1
        end

        prompt = TTY::Prompt.new
        @user_score = 0
        puts 
        questionLimit = prompt.ask("  How many questions would you like to answer?  ")
        # checks if input is an integer
        isNumber = /\A[+-]?\d+(\.[\d]+)?\z/
        questionLimit = questionLimit.to_s unless questionLimit.is_a? String
        if isNumber.match "questionLimit"
            puts "  Invalid input; limit set to 15"
            questionLimit = 15
        else
            questionLimit = questionLimit.to_i
        end
        question_count = 0
        puts `clear`
        
        while question_count < questionLimit
            # sort facts by learning metric, checking to see if they were last displayed
            i = 0
            @facts = sort_by_metric(@facts)
            if @facts[i].last_displayed
                i = rand(0..@facts.length-1)
            end
            
            userAnswer = prompt.ask(" #{@facts[i].question}  ")
            puts check_answer(userAnswer, i)
            @facts[i].last_displayed = !@facts[i].last_displayed
            question_count += 1
        end
        font = TTY::Font.new(:doom)
        print TTY::Box.frame font.write("You got     #{@user_score}/#{questionLimit}").colorize(:red)
        sleep(2)
        @user_score = 0
        menu_choice()
    end 


    def check_answer(userAnswer, i)
        if @facts[i].answer.downcase == userAnswer.to_s.downcase
            @facts[i].metric *= 1.2
            @user_score += 1
            return "  Nice Work! \n  ------- "
        else
            @facts[i].metric *= 0.8
            wrongAnswer =  "  Nup, the answer is:  " +"#{@facts[i].answer}".colorize(:red) + "  \n -------"
            return wrongAnswer
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


    def choose_q()
        # list facts and allow you to choose using tty-prompt 
        prompt = TTY::Prompt.new
        questions = []
        @facts.each  do |fact|
            questions.push(fact.question)
        end

        choice = prompt.select("  Choose a question", questions)
        for i in 0..@facts.length-1
            if  choice == @facts[i].question
                userAnswer = prompt.ask(" #{choice}")
                puts check_answer(userAnswer, i)
            end
        end
        sleep(2)
        menu_choice()
        
    end

    def add_fact
        prompt = TTY::Prompt.new
        q_prompt = prompt.ask("  What is your question?")
        q = " " + q_prompt if q_prompt != nil
        a_prompt = prompt.ask("  What is the answer?")
        a = " " + a_prompt if a_prompt != nil
        @facts.push(Fact.new([q, a]))
        puts "  Question successfully added to deck."
        sleep(2)
        menu_choice()
    end
end


def menu_choice
    puts`clear`
    choices =  [
        " Choose Questions Mode",
        " Random Question Mode",
        " Add new question", 
        " Exit"
    ]

    prompt = TTY::Prompt.new
    choice = prompt.select("  What do you you want to do?\n", choices)
    
    case choice
    when choices[0]
        $deck.choose_q()
    when choices[1]
        $deck.random_question_mode()
    when choices[2]
        $deck.add_fact()
    else 
        puts
        exit
    end
end


