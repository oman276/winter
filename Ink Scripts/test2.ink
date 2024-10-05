VAR test_int = 1
VAR test_bool = false

//GAME STATE
// 0 == None state, ready to enter new branch at any time
// 1 == NPC Dialogue, use the dialogue box of the current NPC
// 2 == Player Dialogue, use the player's dialogue
VAR state = 0

->CONTROL

==CONTROL==
~state = 0
*[c0] -> TEST_NPC_1 


==TEST_NPC_1==
~state = 1
Hello!
*[next]->TEST_PLAYER_1 


==TEST_PLAYER_1==
~state = 2
*[Affirmative option!]->TEST_NPC_2_YES
*[Negative option...]->TEST_NPC_2_NO

==TEST_NPC_2_YES==
~state = 1
Yeah!
*[next]->CONTROL 

==TEST_NPC_2_NO==
~state = 1
Damn...
*[next]->CONTROL 



//Old content

==TEST_OLD==
What did you get done this week?

 *[I got Ink working!]->FINISHED_INK
 *[I didn't get it working.]->DIDNT_FINISH
    
==FINISHED_INK==
~test_int = 2
I managed to finish the integration with Ink! ->END

==DIDNT_FINISH==
~test_int = 3
I didn't manage to finish...->END