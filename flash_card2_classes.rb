

# standard fact class
class Fact
    attr_accessor :question, :answer, :metric, :repeat_count
    def initialize(question, answer)
        @question = question
        @answer = answer
        # learning metric 
        @metric = 1.0
        # a user display count
        @repeat_count = 0
    end
end
# mutlipl-choice fact class
class MultChoiceFact < Fact
    def initialize(question, answer)
        super
        @answer = answer.split(", ")
    end
end



# card class
class Cards 
    attr_accessor :question, :answer, :metric, :facts
    def initialize()
        @facts = []
        @answer = nil
    end 