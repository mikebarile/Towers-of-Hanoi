# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi

	attr_reader :towers, :won

	def initialize
		@won = false
		@towers = [[3, 2, 1], [], []]
	end

	def play
		p "Welcome player! Initiating the towers as follows: #{@towers}"
		while @won == false			
			p "Which tower would you like to move from?"
			from_tower = gets.chomp.to_i

			p "Which tower would you like to move to?"
			to_tower = gets.chomp.to_i

			render(from_tower, to_tower)
			p "The towers are now as follows: #{@towers}"
		end
		p "Congratulations, you've solved the puzzle!"
	end

	def render(from_tower, to_tower)
		if valid_move?(from_tower, to_tower)
			move(from_tower, to_tower)
		else
			p 'Invalid move, try again!'
		end
		won?
	end

	def won?
		@won = true if @towers[1].length == 3 || @towers[2].length == 3
	end

	def valid_move?(from_tower, to_tower)
		if ![0, 1, 2].include?(from_tower) || ![0, 1, 2].include?(to_tower)
		elsif @towers[from_tower].length == 0
			false
		elsif @towers[to_tower].length == 0
			true
		elsif @towers[from_tower][-1] < @towers[to_tower][-1]
			true
		else
			false
		end
	end

	def move(from_tower, to_tower)
		@towers[to_tower].push(@towers[from_tower].pop)
	end

end













