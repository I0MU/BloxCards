



return {
	Owner = "",
	NPCFunc = { "PostMageStart" },
	Start_R1_1 = {
		Owner = "Ren",
		Text = "YOU AIN'T HALF-BAD, LOSER.",
		Question = { { Text = "yeah", Destination = "Start_R1_2" } }
	},
	Start_R1_2 = {
		Text = "'ERE. TAKE THESE STUDY TICKETS. THEY'LL OPEN A RIFT IN THE FABRIC OF TIME, MUCH LIKE HOW YOU'VE OPENED A HOLE IN THAT GIT'S FACE. GOOD WAY TO GET STRONGER AND COOLER.",
		EndPoint = true,
		NPCFunc = { "PostMageR1" }
	},
	Start_R2_1 = {
		Owner = "Ren",
		Text = "TCH. YOU'RE GETTING GOOD, LOSER.",
		Question = { { Text = "?", Destination = "Start_R2_2" } }
	},
	Start_R2_2 = {
		Text = "I REALLY SHOULD USE THESE PACK TICKETS ON MYSELF, BUT THE BIGWIGS IN THE CULTURE INDUSTRY WILL GROUND ME FOR A WEEK IF I DON'T GIVE THEM TO YOU, LOSER.",
		EndPoint = true,
		NPCFunc = { "PostMageR2" }
	},
	Start_R3_1 = {
		Owner = "Ren",
		Text = " TCH. WELL DONE, LOSER.",
		Question = { { Text = "?", Destination = "Start_R3_2" } }
	},
	Start_R3_2 = {
		Text = "YOU'VE PROVEN YOURSELF. HEAD INTO THE HQ TO TAKE ON YOUR FIRST TRUE CHALLENGE. YOU'VE GOT A LOT A HEAD OF YOU, LOSER.",
		EndPoint = true,
		NPCFunc = { "PostMageR3" }
	},
	Start_G1_1 = {
		Owner = "Gaius",
		Text = "And that's the first of my coworkers dealt with. I hope that was an enlightening experience.",
		Question = { { Text = "...", Destination = "Start_G1_2" } }
	},
	Start_G1_2 = {
		Text = "Take these pack tickets. They'll help you study the history I lectured you on, improving your deck.",
		Destination = "Start_G1_3"
	},
	Start_G1_3 = {
		Text = "I used a hypnotic voice to beam the information directly into your brain. Time spent doing nothing is time not studying, after all!",
		EndPoint = true,
		NPCFunc = { "PostMageG1" }
	},
	Start_G2_1 = {
		Owner = "Gaius",
		Text = "Two demons, two games, two experiences gained. Are you feeling more comfortable in your archaeological duelling? Back in my day, one minute of spell slinging was enough to train a soldier for battle.",
		Question = { { Text = "...", Destination = "Start_G2_2" } }
	},
	Start_G2_2 = {
		Text = "Take these pack tickets and gear up. Your third opponent has 400,000 years of training; You'll need all of nature's gifts to advance.",
		EndPoint = true,
		NPCFunc = { "PostMageG2" }
	},
	Start_G3_1 = {
		Owner = "Gaius",
		Text = "Well done! It's been fascinating to watch you grow. Come to headquarters and allow me to be a part of that development, to plant a seed in you that will blossom into a well trained duelist.",
		Question = { { Text = "?", Destination = "Start_G3_2" } }
	},
	Start_G3_2 = {
		Text = "... That can be literal if you so wish. The cherry tree implanted in my brain gives me magic powers.",
		Destination = "Start_G3_3"
	},
	Start_G3_3 = {
		Text = "But enough idle banter! Take these pack tickets, study hard, and achieve your destiny.",
		EndPoint = true,
		NPCFunc = { "PostMageG3" }
	},
	Start_B1_1 = {
		Owner = "Braxton",
		Text = "Ah, you've defeated one of my coworkers. Well done! You've exceeded my expectations.",
		Question = { { Text = "...", Destination = "Start_B1_2" } }
	},
	Start_B1_2 = {
		Text = "Seeing as there is a thimble of intellect in you, take these pack tickets. They will open a rift in time and allow you to study an important moment in our history. Due to forces far beyond your comprehension, this will make you better at a children's card game.",
		EndPoint = true,
		NPCFunc = { "PostMageB1" }
	},
	Start_B2_1 = {
		Owner = "Braxton",
		Text = "Another coworker down, another fistful of pack tickets.",
		Question = { { Text = "...", Destination = "Start_B2_2" } }
	},
	Start_B2_2 = {
		Text = "By the way, there is an important Duelshire custom you may be unaware of. It's called 'bathing,' where you use water to remove unpleasant odours from your body. You should try it in the fountain. I'm sure you'll master it in no time.",
		EndPoint = true,
		NPCFunc = { "PostMageB2" }
	},
	Start_B3_1 = {
		Owner = "Braxton",
		Text = "And that's all three! Hm. You might be the first to equal me in my 400,000 years of being here.",
		Question = { { Text = "?", Destination = "Start_B3_2" } }
	},
	Start_B3_2 = {
		Text = "You've proven yourself to have a modicum of potential, so I will grant you access through the Headquarters. Go forth and prove your worth, my apprentice.",
		EndPoint = true,
		NPCFunc = { "PostMageB3" }
	},
	Start_Y1_1 = {
		Owner = "Yuki",
		Text = " Yay! Socialising! Take these study tickets. c:",
		Question = { { Text = "...", Destination = "Start_Y1_2" } }
	},
	Start_Y1_2 = {
		Text = "You can open card packs with these, and they only contain awesum yellow cards! None of those STUPID, UGLY, RED, GREEN, OR BLUE CARDS... I bet they don't even have cute dogs on theirs...",
		EndPoint = true,
		NPCFunc = { "PostMageY1" }
	},
	Start_Y2_1 = {
		Owner = "Yuki",
		Text = "That's two new friends you've made! And here's how you make more: Go take these pack tickets and use them to acquire more friends from the past!",
		Question = { { Text = "...", Destination = "Start_Y2_2" } }
	},
	Start_Y2_2 = {
		Text = "Here's some important info: It's fun when you play cards, but if your opponent plays them they are oppressive and evil and should be BEATEN TO DEATH WITH STICKS.",
		EndPoint = true,
		NPCFunc = { "PostMageY2" }
	},
	Start_Y3_1 = {
		Owner = "Yuki",
		Text = " Wow! You're pretty good! You've channelled all your emotions into that duel. He never stood a chance!",
		Question = { { Text = "...", Destination = "Start_Y3_2" } }
	},
	Start_Y3_2 = {
		Text = "That's why yellow is the best colour! You can do anything if you're angry enough; That's why I bottle all my emotions until they're ready to be used!",
		Destination = "Start_Y3_3"
	},
	Start_Y3_3 = {
		Text = "NOW GO ON AND TAKE WHAT'S YOURS. ENTER THE HQ AND SHOW EM' WHOSE THE TOP DOG (YOU).",
		EndPoint = true,
		NPCFunc = { "PostMageY3" }
	}
}
