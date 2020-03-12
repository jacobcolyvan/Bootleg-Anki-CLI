Not much to read here.

### Purpose and Scope
The application is as a flashcard app, very similar to the popular notetaking app *anki*. It allows the user to add, view, and test themselves with questions. It has a few different modes, the most important being a random question testing mode, which scores the users correct responses out of 15. Each question/answer pair has a built in learning metric.

If used correctly this terminal app should help the user learn new content through testing. It aims to implement a model of spaced reptition, where those questions that are less well known are shown more frequently. The target audience is for students, to help content be learned more efficiently.

The program utilises gems such as tty-prompt and tty-font to make the program more appealing and engaging. 

Whne the CLI is launched it will request the user to choose a deck. To which it will proceed to a menu screen, where they can choose between three options. 


### Features
##### Ability to add a question/answer
Users are given an option in the menu to add a fact to the deck they've chosen. They're prompted for a question, followed by an answer. This calls a function to create a fact object and add it to the deck. 
##### Ability to choose a fact to answer
This menu choice allows the user to choose a fact out of the deck, answer said fact, and return whether the answer was correct.
##### Test questions
This is a menu choice that first prompts the user as to how many questions they want to answer, and then asks

### Flow Diagram
![Flow diagram of terminal app control flow](./terminal_app.jpeg)



