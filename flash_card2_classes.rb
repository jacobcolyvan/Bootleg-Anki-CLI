
# Repeats facts a maximum of 5 five times (or two for those above a
# learning metric of 1), and displaying those less well known first. 

# standard fact class
class Fact
    attr_accessor :question, :answer, :metric, :repeat_count, :last_displayed
    def initialize(question, answer)
        @question = question
        @answer = answer
        # learning metric 
        @metric = 1.0
        @repeat_count = 0
        @last_displayed = false
    end
end

class MultChoiceFact < Fact
    def initialize(question, answer)
        super
        @answer = answer.split(", ")
    end
end



# card class
class Cards 
    attr_accessor :facts, :userAnswer
    def initialize()
        @facts = []
        @userAnswer = nil
    end


    # def ask_q()
    def random_question_mode()
        question_count = 0
        while userAnswer != "" && question_count < 15
            # sort facts by learning metric, checking to see if they were last displayed
            i = 0
            @facts = sort_by_metric(@facts)
            if @facts[i].last_displayed
                i = rand(0..@facts.length-1)
            end
            
            # print questions within boxes
            # print TTY::Box.frame @facts[i].question
            puts @facts[i].question
            userAnswer = gets.chomp
            
            if @facts[i].answer == userAnswer
                # print TTY::Box.frame "Nice work!"
                puts "Nice Work! \n------- "
                @facts[i].metric *= 1.2
                # @facts[i].repeat_count += 1
            else
                wrongAnswer =  "Nup, the answer is:  #{@facts[i].answer} \n-------"
                # print TTY::Box.frame wrongAnswer
                puts wrongAnswer
                @facts[i].metric *= 0.8
                # @facts[i].repeat_count += 1
            end

            @facts[i].last_displayed = !@facts[i].last_displayed
            question_count += 1
        end
        menu_choice()
    end 

    #change sorting algorithm
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

    def choose_q
        # list facts and allow you to choose using tty-prompt 
        prompt = TTY::Prompt.new
        questions = []
        @facts.each  do |fact|
            questions.push(fact.question)
        end

        # while userAnswer != ""
        choice = prompt.select("Choose a question", questions)
        @facts.each  do |fact|
            if choice == fact.question
                puts fact.answer
            end
        end
        menu_choice()
    end

    def add_fact
        puts "What is your question?"
        q = gets.chomp
        puts "What is the answer?"
        a = gets.chomp
        facts.push(Fact.new(q, a))
        puts facts[-1].question

        menu_choice()
    end

    # def check_fact
end



