### Purpose and Scope
The application is as a flashcard app, very similar to the notetaking app *anki*. It allows the user to add, view, and test themselves with questions (both user added and provided). It has a few different modes, the most important being a random question testing mode, which scores the users correct responses against a user defined amount of questiuons. Each question/answer pair has a built in learning metric, which determines the frequency a particular question is shown to the user; and the program aims to ensure that the same questions don't get shown too much. 

If used correctly this terminal app should help the user learn new content through testing. It aims to implement a very naive model of spaced reptition, where those questions that are less well known are asked more frequently, and those where the user scores correctly, are shown less frequently. The target audience is for students, as a learning aid to to help content be learned more efficiently and effectively. It differs from the main aleternatives in that it is completely run in the terminal, and is operated through the command line interface. However, the program utilises gems such as tty-prompt, tty-font, tty-box and colorize to make the program more appealing and engaging. It is still very barebones, and there is much that can be done to extend it in the future by any that want to get involved. 

In terms of operation and user experiencce, when the application is launched it will request the user to choose a deck. Two decks are included by default, however more can be added by including an array in the arrayOfFacts file, and assigning it a variable in the create_a_deck() method. From here it it will proceed to a menu screen, where three options are displayed. These options are to add a card, test a series of program order detrmined questions (combination of learning metric and calls to random), or they can opt to choose the questions to answer individually. The program will not exit unless the "exit" option is chosen in the menu. 

<br>

### Features
##### Ability to add a question/answer
Users are given an option in the menu to add a question/answer paur to the deck they've chosen. They're prompted for a question, followed by an answer. This calls a function to create a fact object out of the given inputs, which initialises other variables such as a learning metric, and add it to the deck with the given inputs. The question/answer pair can then be accessed throughout the rest of the program, and used like any of the other provided facts. It is however lost after the user exits the program.   
<br>

##### Answer specific facts
This menu choice allows the user to choose a fact out of the deck, answer said fact, and return whether the answer was correct. If the answer is incorrect, the correct answer is displayed. Through this the user can see the questions in the deck, and pick out individual ones that they want to practice and/or are interested in. Note that learning metrics are not effected by this mode, and that user added question/answer pairs can be viewed like any of the other questions. After viewing a card, the user is returned to the menu choice. This feature is good for learning specific content, rather than a semi-randomised flow of questions (which becomes more important as the decks get bigger, )
<br>

##### Test questions
This is a menu choice that first prompts the user as to how many questions they want to answer. It then proceeds to output a random question from the chosen deck. The deck is filled with Fact objects that each have an initialised variable called "learning metric". This metric is changed slightly according to whether their answer is correct or not. This influences subsequent question order, with those that the user gets correct being shown less freuqently. Once the user inputted question limit is reached, the users score is displayed and they're returned back to the menu screen.  

<br>


### Control Flow Diagram
![Flow diagram of terminal app control flow](./docs/terminal_app.jpg)

### Help/Installation
This program requires four gems to function as intended (refer to the docs of each for intsallation help), these are:

* TTY-box
* TTY-prompt
* TTY-font
* colorize
  

Source code needs to be downloaded (including all three critical files: flash_card2_classes.rb, flash_card2_control.rb, and arrayOfFacts,rb). Ensure all of these files are in the same folder
Run the ruby file "flash_card2_control.rb", to start the program.

The program comes with two very limited preprogrammed decks; question/answeer pairs can be added to existing deks or entire decks can be added (as arrays) in the "arrayOfFacts.rb file.
NOTE: any questions added whilst in the program itself will only be saved for use in that session, not permanently to the "arrayOfFacts.rb" file. 


### Implementation plan
For my implementation plan I decided to use the project feature on github, utilising the kanban organisation method. This method splits the planning process into three tabs: to do; in progress; and done. Screenshots have been included below to show this planning process in progress. 



![Terminal app code plan kaban](./docs/Terminal_app_code_plan.png)
<br>
![Terminal app documentation plan kaban](./docs/Terminal_app_documentation.png)


### User interaction and experience
Upon successful launch of the program within the command line, the user will be prompted to select a deck (out of the two available to choose, which are assortedFacts and mathFacts). This option is chosen through use of the up and down key. When chosen it will take the user to a menu choice screen. This presents four options (also accesible through up and down arrow keys) are: random question mode, choose a question mode, add a question, and exit. The exit option exits the program and the others are described below

Random question mode asks for a number to use as a question limit. It then presents the user with an initially random question from the deck, prompts for keyboard input. If then checks whether the user answer is correct it and prints a message appraising the user if correct or printing the correct answer. Those questions that are less well known are repeated more frequently. It repeats this until the question limit is reached. It then prints what the user score against the question limti and takes them back to the menu selection.

If add a question mode is chosen, the user is prompted to input a question through the keyboard, followed by an answer. It then prints if successful, and adds this to the deck as a fact object.

Choose a question mode, allows the user to choose a question using the up/down arrows. It then prompts the user for keyboard input as an asnwer. It checks this answer and prints whether it was successful, if its not it prints the answer. Any questions added in the add a question mode are accessible here.


### Error testing
I followed through my control flow diagram, checking that code executed without errors at each decision points. This process can be seen in the screenshot below. 
Multiple input types were checked at each control structure that required user input. All worked as expected. 

![Terminal app documentation plan kaban](./docs/error_testing.png)




