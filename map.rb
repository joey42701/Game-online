module Map 

  class Room
  
    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end
  
    attr_reader :name
    attr_reader :paths
    attr_reader :description
  
    def go(direction)
      return @paths[direction]
    end
  
    def add_paths(paths)
      @paths.update(paths)
    end
  
  end
  
  DETENTION = Room.new("Detention",
    """
    You never expected to be here. Well, you've been in detention before.
    It's not like you're one of those boring goody goodies who never do anything wrong.
    Those times were different though. Now you were facing expulsion.
    And for what? Something you didn't even do.
    You can't just sit like this can you?
    The headmaster will be here any second. Now is your chance to run!
    The door out is unlocked, and the window is open.
    
    Your options are:
    - leave the room
    - jump out the window
    
    Enter below:
    """)

  ESCAPE = Room.new("Escape",
    """
  You look around for clues on who stole all those phones
  A person wearing a hoodie is hiding behind some bushes
  This is my chance, you think to yourself.
  Just then, you see two teachers approaching the person's direction
  You can't get caught now, but you can't let that guy get away!
  There's a shed near you and some bushes leading to the suspect.
  
    You can:
    - hide in shed
    - hide in bushes
    
    Enter below:
    """)

  DOORS = Room.new("Doors",
    """
  You approach the double doors on the side of the school
  as if waiting for a monster to come out
  These doors are only meant to be used
  by janitors and the like.
  You'd be breaking the rules, but you have to go inside.
    
    Your options are:
    - go in
    - look for another way in
    
    Enter below:
    """)

  HALLWAY1 = Room.new("Hallway1",
    """
  There are two doors to the left and three doors to the right
  A door straight shead leads to the cafeteria, but that's a stupid move.
  
  You can enter:
  - left door 1
  - left door 2
  - right door 1
  - right door 2
  - right door 3
  
  Enter below:
    """)
    
    LOCKED_ROOM = Room.new("Locked_room",
    """
  You stumble in and are shocked at what you find
  The forbidden chamber students can never access.
  The place where dreams go to die....
  The teacher's lounge
  
  You look around the room at the:
  - desk
  - trash
  - cabinet
    
    Enter below:
    """)
    
    ALAC = Room.new("Alac",
    """
  Alright! You yell out. I know you took'em
  Alac looks at you like he doesn't know what
  you're talking about.
  
  Do you:
  - bluff
  - show him proof
    
    Enter below:
    """)
    
    
    CHASE = Room.new("Chase",
    """
  You chase him all the way to the gym
  You reach the gym only to get hit by a ball.
  Alac prepares to throw another one
  
  Do you:
  - rush him and dodge
  - try to catch the ball 
  - throw the ball that hit you
    
    Enter below:
    """)
    
    FIGHT = Room.new("Fight",
    """
  As you get close he prepares to throw a punch
  
  You respond by:
  
 
  - throwing a punch
  - ducking 
  - blocking
    
    Enter below:
    """)
    
    ALONSO = Room.new("Alonso",
    """
  Alfanso sits there painting and notices
  you once you get close enough.
  'Weren't you supposed to be suspended?'
  You tell him about everything that happened to you
  so far.
  So.... what do you want from me.'
  
  Do you:
  - interrogate him
  - intimidate him
    
    Enter below:
    """)
    
    INTER = Room.new("Inter",
    """
  Alright you got him on the ropes
  
  Do you ask about:
  
  - the person wearing the hood
  - the missing phone
    
    Enter below:
    """)
    
     HEADMASTER = Room.new("Headmaster",
    """
 'You just couldn't keep your nose out
  of my business. All you had to do was take the fall.'
  You look for a way out, but there are none.
  It's time to bs your way out.
  
  You decide to:
  
  - talk your way out
  - force your way out
    
    Enter below:
    """)
    
     OUTSMART = Room.new("Outsmart",
    """
  The window is shut with a lock
  he key is on a tabletop near the headmaster
  He's blocking the door, and a fire alarm is on the left
  Sitting on the desk, you see some matches, paper, and a pen
  
  You decide to:

  - light the match
  - throw the pen
  - lunge for the key
    
    Enter below:
    """)
    
    LIT = Room.new("Lit",
    """
  Now what
  
  Obviously, you:

  - yell
  - throw paper into fire
    
    Enter below:
    """)
    
  THE_END_WINNER = Room.new("The End",
    """
  Escaping from the room, you decide to inform everyone of the
  headmaster's nefarious plan. While he has a date with the authorities,
  you can't help but feel something's missing...
    """)

  THE_END_WINNER2 = Room.new("The End",
    """
    You aprehend the true culprit of the theft.
    The headmaster appologizes and congratulates you
    on your success. Everything feels resolved.... right?
    """
    )

  DEATH = Room.new("death", "You died.")
  
  DETENTION.add_paths({
    'leave the room' => DEATH,
    'jump out the window' => ESCAPE
  })
  
  ESCAPE.add_paths({
    'hide in shed' => DEATH,
    'hide in bushes' => DOORS
  })
  
  DOORS.add_paths({
    'go in' => HALLWAY1,
    'find another way in' => LOCKED_ROOM 
  })
    
  HALLWAY1.add_paths({
    'left door 1' => HALLWAY1,
    'left door 2' => ALONSO,
    'right door 1' => DEATH,
    'right door 2' => ALAC, 
    'right door 3' => HALLWAY1
  })
  
   ALAC.add_paths({
    'show him proof' => CHASE,
    'bluff' => DEATH
  })
  
   LOCKED_ROOM.add_paths({
    'trash' => LOCKED_ROOM,
    'desk' => ALAC,
    'cabinet' => LOCKED_ROOM
  })
  
   CHASE.add_paths({
    'rush him and dodge' => DEATH,
    'try to catch the ball' => FIGHT,
    'throw the ball that hit you' => DEATH
  })
  
   FIGHT.add_paths({
    'throwing a punch' => DEATH,
    'ducking' => DEATH,
    'blocking' => THE_END_WINNER2
  })
  
   ALONSO.add_paths({
    'interrogate him' => INTER,
    'intimidate him' => DEATH,
  })
  
   INTER.add_paths({
    'the person wearing the hood' => DEATH,
    'the missing phones' => HEADMASTER,
  })
  
   HEADMASTER.add_paths({
    'talk your way out' => OUTSMART,
    'force your way out' => DEATH
  })
  
   OUTSMART.add_paths({
    'light the match' => LIT,
    'throw the pen' => DEATH,
    'lunge for the key' => DEATH,
  })
  
   LIT.add_paths({
    'yell' => THE_END_WINNER,
    'throw paper into fire' => DEATH,
  })
  
  START = DETENTION
    
  ROOM_NAMES = {
    'DETENTION' => DETENTION,
    'ESCAPE' => ESCAPE,
    'DOORS' => DOORS,
    'HALLWAY1' => HALLWAY1,
    'LOCKED_ROOM' => LOCKED_ROOM,
    'ALAC' => ALAC,
    'CHASE' => CHASE,
    'FIGHT' => FIGHT,
    'ALONSO' => ALONSO,
    'INTER' => INTER,
    'HEADMASTER' => HEADMASTER,
    'OUTSMART' => OUTSMART,
    'LIT' => LIT,
    'THE_END_WINNER' => THE_END_WINNER,
    'THE_END_WINNER2' => THE_END_WINNER2,
    'START' => START,
  }

  def Map::load_room(session)
    return ROOM_NAMES[session[:room]]
  end

  def Map::save_room(session, room)
    session[:room] = ROOM_NAMES.key(room)
  end

end
