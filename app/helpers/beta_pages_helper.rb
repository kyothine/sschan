module BetaPagesHelper
	def renderThankYou(string = 'signup.html.erb')
	
		if string == 'signup.html.erb'
			@title = 'Thank You'
		elsif string == 'open.html.erb'
			@title = 'Join SSC'
		else
			@title = 'Sorry'
		end
		
		render string
	end
end