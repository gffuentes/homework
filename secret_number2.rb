###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game. 
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
# 	-	Welcome the player to your game. Let them know who created the game. 
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

#####INTRODUCTION#########
puts "Welcome to the game!"
puts "What's your name?"
name = gets.chomp
puts "hi #{name}, here are the rules"
puts "You must guess a number between 1 and 10. You have 3 tries to guess what number I am thinking of. Let's play #{name}!"

#### CHEATING GLOBAL VARIABLE######
@secret_number = rand(1..10)

##### Win or Lose Method ######
def wl(guess)
	if @secret_number > guess
		return "Nope, lower"
	elsif @secret_number < guess
		return "Nope, higher"
	else
		return 1
	end
end

#####Verify guess is 1 through 10 and is a integer######
def verify(x)
	y = 1
	while y == 1
		if x.is_a?(Integer) && x > 0 && x < 10 #need to fix this. Still able to take non integers like 1.5
			return x
			y-=1
		else
			puts "Try again - number must be 1 through 10 and an integer"
			x = gets.chomp.to_i
		end
	end
end

#####GAME LOOP#######
3.downto(0) do |game|
	if game != 0
		puts "What is your guess?"
		unverified_number = gets.chomp.to_i
		guess = verify(unverified_number)
		if wl(guess) != 1
			puts wl(guess)
			puts "You have #{game-1} guesses left"
		else
			puts "You win!"
			break
		end
	else
		puts "Sorry, you lose!"
		puts "The number I was thinking of was #{@secret_number}"
	end
end


