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
*[c1] -> DEMO_MEDIC_1
->DONE


//Demo Medic

==DEMO_MEDIC_1==
~state = 1
I’m sorry, but you need to go. There’s still wounded in the lower docks.
*[next]->DEMO_MEDIC_2 
==DEMO_MEDIC_2==
~state = 2
*[Shouldn't you take them to a real hospital?]->DEMO_MEDIC_4
*[Are you a nurse?]->DEMO_MEDIC_5
==DEMO_MEDIC_3==
Test->DEMO_MEDIC_2
==DEMO_MEDIC_4==
~state = 1
No. They’re sick, they’re hurt, and they shouldn’t be moved. You have to leave.
*[next]->DEMO_MEDIC_6
==DEMO_MEDIC_5==
~state = 1
I’m a war medic. We’re at war, you know.
*[next]->DEMO_MEDIC_8
==DEMO_MEDIC_6==
~state = 2
*[Did you serve on the Front with them?]->DEMO_MEDIC_9
*[But why does it need to be you? There’s plenty of hospitals in town. You can rest.]->DEMO_MEDIC_10
==DEMO_MEDIC_7==
test->DEMO_MEDIC_8
==DEMO_MEDIC_8==
~state = 2
*[But why does it need to be you? There’s plenty of hospitals in town. You can rest.]->DEMO_MEDIC_10
*[Not anymore. It’s V-Day. The parade in town is for you.]->DEMO_MEDIC_11
==DEMO_MEDIC_9==
~state = 1
Hah. Nah. They served in the front, I served in the back. 
*[next]->DEMO_MEDIC_15
==DEMO_MEDIC_10==
~state = 1
None who know these girls as well as I do. I served in the back for seven years. My position was shelled three times. 
*[next]->DEMO_MEDIC_16
==DEMO_MEDIC_11==
~state = 1
The Parade is for the veterans. It’s for the killers and the dead. It’s not for me.
*[next]->DEMO_MEDIC_12
==DEMO_MEDIC_12==
~state = 2
*[But surely you were also in danger.]->DEMO_MEDIC_13
*[It’s to celebrate the living.]->DEMO_MEDIC_14
==DEMO_MEDIC_13==
~state = 1
Barely. I could hear the shells, but I didn’t have to feel them.
*[next]->DEMO_MEDIC_15
==DEMO_MEDIC_14==
~state = 1
Who’s living? I have a dozen girls in these tents who still don’t know if they’ll ever walk again. We’re back on our side of the world, but their war isn’t over.
*[next]->DEMO_MEDIC_15
==DEMO_MEDIC_15==
~state = 1
My sisters-in-arms faced the machine guns and mortar shells. They ran into hell and kept the enemy barbarians from the gates of Rome. And they died. Every day, every hour, more dead and dying.
*[next]->DEMO_MEDIC_15_2
==DEMO_MEDIC_15_2==
~state = 1
I watched them pile up faster than we could treat them. I saw the looks in their eyes, old man. They looked at me and saw a life-well lived. They saw my clean hands and wished they were me. I got out very, very easily. 
*[next]->DEMO_MEDIC_17
==DEMO_MEDIC_16==
~state = 1
I’m the one who knows them. I’m the only one who can handle this. I’ve looked into their eyes and seen them at their lowest. I know how to care for them. Anyone else wouldn’t know how much it actually matters.
*[next]->DEMO_MEDIC_20
==DEMO_MEDIC_17==
~state = 2
*[I’m sorry. It sounds like hell.]->DEMO_MEDIC_18
*[You don’t sound proud.]->DEMO_MEDIC_19
==DEMO_MEDIC_18==
~state = 1
Don’t say that. It’s not your fault and I don’t want your sympathy. 
*[next]->DEMO_MEDIC_21
==DEMO_MEDIC_19==
~state = 1
What is there to be proud of? I survived. 
*[next]->DEMO_MEDIC_21
==DEMO_MEDIC_20==
~state = 2
*[Do you think you’re the only one who can do this?]->DEMO_MEDIC_22
*[Don’t put the weight of them all on your shoulders. It’s not fair to you.]->DEMO_MEDIC_23
==DEMO_MEDIC_21==
~state = 1
Sure, I had my problems. Sometimes I feel bad for myself. But then I look at rows upon rows of crosses. I see piles of corpses being thrown onto a cart. I count all my limbs, just in case, and I feel like a coward. What right do I have to say I had it bad? What nerve?
*[next]->DEMO_MEDIC_25
==DEMO_MEDIC_22==
~state = 1
Why wouldn’t I be? Who else could have been better?
*[next]->DEMO_MEDIC_24
==DEMO_MEDIC_23==
~state = 1
//BAD END
Hey, I’m not the one who put it there, alright?
*[next]->DEMO_MEDIC_49
==DEMO_MEDIC_24==
~state = 2
*[We have nurses here. Nurses who have known peace.]->DEMO_MEDIC_34
*[What about your fellow nurses? Don’t you trust them?]->DEMO_MEDIC_35
==DEMO_MEDIC_25==
~state = 2
*[You can’t feel guilty for being alive.]->DEMO_MEDIC_26
*[You’re right. You’re a coward. So what? You’re alive. That’s what matters.]->DEMO_MEDIC_27
==DEMO_MEDIC_26==
~state = 1
Watch me.
//BAD END
*[next]->DEMO_MEDIC_49
==DEMO_MEDIC_27==
~state = 1
To who? The crowd in town wants to hear stories of honor and valor and bravery. I just did my job.
*[next]->DEMO_MEDIC_28
==DEMO_MEDIC_28==
~state = 2
*[It matters to your sisters-in-arms. ]->DEMO_MEDIC_29
*[It matters to me.]->DEMO_MEDIC_30
==DEMO_MEDIC_29==
~state = 1
What do you mean?
*[next]->DEMO_MEDIC_31
==DEMO_MEDIC_30==
~state = 1
Look, I’m touched, but you don’t know me yet. Are you sure you aren’t just happy that someone survived?
//GOOD END
*[next]->DEMO_MEDIC_39
==DEMO_MEDIC_31==
~state = 2
*[They would have wanted you to live. You can honor their memory by staying alive.]->DEMO_MEDIC_32
*[Go and ask them.]->DEMO_MEDIC_33
==DEMO_MEDIC_32==
~state = 1
Hmm. Yeah. They would have.
//GOOD END
*[next]->DEMO_MEDIC_39
==DEMO_MEDIC_33==
~state = 1
I’ll ask them in Hell, when I see them again.
//BAD END
*[next]->DEMO_MEDIC_49
==DEMO_MEDIC_34==
~state = 1
Yeah, they’ve only known peace. That’s the problem.
//BAD END
*[next]->DEMO_MEDIC_49
==DEMO_MEDIC_35==
~state = 1
Well... yeah, I do. Yeah. They’ve saved me a few times. 
*[next]->DEMO_MEDIC_36
==DEMO_MEDIC_36==
~state = 2
*[Where did they go?]->DEMO_MEDIC_37
*[Of course they did. They’re just like you.]->DEMO_MEDIC_38
==DEMO_MEDIC_37==
~state = 1
...they left for home.
//GOOD END 
*[next]->DEMO_MEDIC_39
==DEMO_MEDIC_38==
~state = 1
Hmm. Yeah. They are.
//GOOD END
*[next]->DEMO_MEDIC_39
==DEMO_MEDIC_39==
~state = 1
What were you here for, anyways? I assume you don’t need an amputation.
*[next]->DEMO_MEDIC_40
==DEMO_MEDIC_40==
~state = 2
*[I’m looking for someone.]->DEMO_MEDIC_41
*[I don’t know.]->DEMO_MEDIC_42
==DEMO_MEDIC_41==
~state = 1
You came a little late. The boat just emptied, all the other vets are probably in town by now. Who is it?
*[next]->DEMO_MEDIC_43
==DEMO_MEDIC_42==
~state = 1
Hmm. I guess we’re causing a lot of commotion.
*[next]->DEMO_MEDIC_45
==DEMO_MEDIC_43==
~state = 2
*[My daughter.]->DEMO_MEDIC_44
*[A girl with red hair.]->DEMO_MEDIC_44
==DEMO_MEDIC_44==
~state = 1
Oh. Well, I do know a few vets who might fit that description. I can point you in that direction.
*[next]->DEMO_MEDIC_45
==DEMO_MEDIC_45==
~state = 1
But... would you want to come back and talk tomorrow? I’ll be here. Not like the tents are going anywhere.
*[next]->DEMO_MEDIC_46
==DEMO_MEDIC_46==
~state = 2
*[Of course.]->DEMO_MEDIC_47
*[The tents aren’t going anywhere, but you might.]->DEMO_MEDIC_48
==DEMO_MEDIC_47==
~state = 1
Sure. See you.
*[next]->CONTROL
==DEMO_MEDIC_48==
~state = 1
Yeah. Maybe you’re right.
*[next]->CONTROL
==DEMO_MEDIC_49==
~state = 1
Sorry, did you need something?
*[next]->DEMO_MEDIC_50
==DEMO_MEDIC_50==
~state = 2
*[I’m looking for someone.]->DEMO_MEDIC_52
*[I don’t know.]->DEMO_MEDIC_51
==DEMO_MEDIC_51==
~state = 1
Great. Thanks. Good talk.
*[next]->CONTROL
==DEMO_MEDIC_52==
~state = 1
I’m a nurse, not a detective. Who was it?
*[next]->DEMO_MEDIC_53
==DEMO_MEDIC_53==
~state = 2
*[My daughter.]->DEMO_MEDIC_54
*[A girl with red hair.]->DEMO_MEDIC_54
==DEMO_MEDIC_54==
~state = 1
Look, there’s other vets in town. I can point you that way if it’ll help. But I have a job to do here. I can’t afford to be friendly. See you around.
*[next]->CONTROL




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