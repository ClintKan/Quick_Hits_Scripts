#!/bin/bash

#THIS IS AN ADVENTURE STORY SCRIPT - TRAVELING AROUND THE WORLD

#Introduction
echo "AN ADVENTURE STORY - TRAVELING AROUND THE WORLD"
echo "==============================================="

# Prompt for user's name.
echo "Before we begin, who's on this journey with us?! Please type in your name..."
read traveler_name

echo "Okay, $traveler_name, Welcome once again."

# Main loop to select continents until user wants to go home
while true
do
  # Continent selection prompt
  echo "The world awaits... So, which continent do you want to go to?"
  echo "Let's do this!!!"
  echo "1 - Africa"
  echo "2 - Asia - excluding Arab countries"
  echo "3 - Asia - Only Arab countries"
  echo "4 - Europe"
  echo "5 - Americas - excluding USA"
  echo "6 - Oceania"
  echo "7 - Return Home"
  echo "**"

  read continent_selection

  # Checking for valid input
  if [[ $continent_selection =~ ^[1-7]$ ]]; then
    if [ $continent_selection -eq 0 ]; then
      echo "So," $traveler_name "ain't a travel person, huh?! It's a'ight."
      echo "Bummer but do you!!"
      exit 0
    fi

    echo "Glad you're in, and more so that you made it. Off we go $traveler_name."
    
    echo "\e[31m ** To return home at any point, just press 0 anytime **"

    # If user selects Africa
    if [ $continent_selection -eq 1 ]; then
      echo "Which country in Africa would want to go to? Take a pick"
      echo "1 - Uganda"
      echo "2 - Nigeria"
      echo "3 - South Africa"
      read country_selection
      if [[ $country_selection =~ ^[0-3]$ ]]; then
        if [ $country_selection -eq 1 ]; then
          echo "Boom! "$traveler_name" arrives in Uganda."
          echo "Excited for the journey, but clueless about Uganda. Hunger sets in and making" $traveler_name "for the best snack around."
          echo "Only to be given a Rolex (western Omelette with raw cabbage andraw tomatoes). And it was a hit"
          echo "And just like that, gets to check out the source of the Nile."
        elif [ $country_selection -eq 2 ]; then
          echo "Nigeria is a dud."
          echo "Only highlight is a visit to Timbuktu city that had street festival playing Nigerian tunes".
          echo "At least there is food festival and gets to test the famous Joloff rice. It was banging for real. Oof!"
        elif [ $country_selection -eq 3 ]; then
          echo "South Africa! Visiting Mandela's museum and soak in the culture"
          echo "Chill at 2 beaches in just a single day, in Jo'burg. ANd then, spend the night in a lavish hotel"
        elif [ $country_selection -eq 0 ]; then
          echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
          ecit 0
        fi
      else
        echo "Invalid country selection. Try again."
      fi

    # If user selects Asia (excluding Arab countries)
    elif [ $continent_selection -eq 2 ]; then
      echo "Which non-Arabic country in Asia do you fancy?" $traveler_name
      echo "1 - Japan"
      echo "2 - Singapore"
      echo "3 - India"
      read country_selection
      if [[ $country_selection =~ ^[0-3]$ ]]; then
        if [ $country_selection -eq 1 ]; then
            echo "Go-karting in Japan it is!!"
            echo "Ends the trip in Japan with a day at Okinawa World cave escapade."
        elif [ $country_selection -eq 2 ]; then
            echo "No place like Singapore."
            echo "Sleep all day and spend all night soaking in the nightlife of Singapore".
            echo "Mouth watering street food. Next day highlights how life in Singapore is better than New York!"
        elif [ $country_selection -eq 3 ]; then
            echo "In India - straight to where the movie Slamdog Millionaire was shot."
            echo "The following day is an all-day cricket match - normal in India. OMG!!"
            echo "White Elephants watching and petting. Very calming!"
        elif [ $country_selection -eq 0 ]; then
            echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
            exit 0
        fi
      else
        echo "Invalid country selection. Try again."
      fi


    # If user selects Asia (excluding Arab countries)
    elif [ $continent_selection -eq 3 ]; then
      echo "Now, it's time to travel some Arabic countries in Asia. Which would you want to visit," $traveler_name "?"
      echo "1 - Jordan"
      echo "2 - Qatar"
      echo "3 - UAE"
      read country_selection
      if [[ $country_selection =~ ^[0-3]$ ]]; then
        if [ $country_selection -eq 1 ]; then
            echo "Off to Jordan"
            echo "On landing" $traveler_name "gets to check out 2 movie sets live in action!!"
            echo "And then, off to desert trucking in Quad-bikes."
        elif [ $country_selection -eq 2 ]; then
            echo "Heading to Qatar"
            echo "The marvelous architecture in Qatar - like the National Museum - leave" $traveler_name "astounded"
            echo "But then the plan to go beaching falls flat - as one has to be fully clothed. It's forbidden to show your skin".
            echo "In shock" $traveler_name "runs to the next continent. LOL!!"
            echo "But then changes mind to then just return home. Peace."
            exit 0
        elif [ $country_selection -eq 3 ]; then
            echo "The Emirates empire awaits"
            echo "On arrival, it's sky diving - to have an ariel view like Tom Cruise"
            echo "Spend a night with rich billionaires on a dazzling yatch".
            echo "The heat is crazy but," $traveler_name "doesn't wanna leave. LOL!!"
        elif [ $country_selection -eq 0 ]; then
            echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
            exit 0
        fi
      else
        echo "Invalid country selection. Try again."
      fi

    elif [ $continent_selection -eq 4 ]; then
      echo "Which country would you prefer?"
      echo "1 - Finland"
      echo "2 - England"
      echo "3 - Spain"
      read country_selection
      if [[ $country_selection =~ ^[0-3]$ ]]; then
        if [ $country_selection -eq 1 ]; then
            echo "Arrive in Finland tired. Therefore sleeps all day."
            echo "While out camping, you catch the famous nothern lights of the skies. Incredible"
            echo "The weather is superb. and people are friendly even though there is a bit language barrier."
        elif [ $country_selection -eq 2 ]; then
            echo "Arrive in the UK, Manchester to be specific. But it's raining - and can't do a thing".
            echo "Next day is all about a visiting the famous Royal Palace, and all through London on the double-deck buses."
            echo "It's still raining but the fish and chips at one random restaurant keep you wanting for more!!"
        elif [ $country_selection -eq 3 ]; then
            echo "Spain is undescribable"
            echo "Straight to Barcelona - just to see Barcelona FC play. Barcelona wins a very fun but tight match"
            echo "Eat out after a day touring the famous Camp Nou".
        elif [ $country_selection -eq 0 ]; then
            echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
            exit 0
        fi
      else
        echo "Invalid country selection. Try again."
      fi

    elif [ $continent_selection -eq 5 ]; then
      echo "Which country would you prefer?"
      echo "1 - Jamaica"
      echo "2 - Argentina"
      read country_selection
      if [[ $country_selection =~ ^[0-2]$ ]]; then
        if [ $country_selection -eq 1 ]; then
            echo "Jamaican craziness it is!! Straight into a party."
            echo "Party after party - eating spicy jerk chicken like there is no other meal."
            echo "The whole day is spent at the beach to wind down. Even play beach volley."
        elif [ $country_selection -eq 2 ]; then
            echo "On arrival in Argentina, everyone is talking about football or politics"
            echo "Never knew how football-soccer was this big. Then discovers this Messi's country, huh!".
            echo "Everyone is happy and still celebrating the World Cup win. You go to Messi's birth-town."
            echo "That's all you do. But all worth it at the end of it!!"
        elif [ $country_selection -eq 0 ]; then
            echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
            exit 0        
        fi
      else
        echo "Invalid country selection. Try again."
      fi

    elif [ $continent_selection -eq 6 ]; then
      echo "Which country would you prefer?"
      echo "1 - Australia"
      echo "2 - Hawaii"
      read country_selection
      if [[ $country_selection =~ ^[1-2]$ ]]; then
        if [ $country_selection -eq 1 ]; then
            echo "OMG. Australia. You fall head over heels about the accents. You just want to hear them talk forever LOL!!"
            echo "You get a guide to go to the Kakadu National Park. You admit the guide was to hear the person speak. LOL!!"
            echo "You spend time at the beaches of Sydney."
        elif [ $country_selection -eq 2 ]; then
            echo "Hawaii here comes," $traveler_name 
            echo "But quickly realizes how expensive it is out there"
            echo $traveler_name "spends most all of the 2 days chilling at the beaches."
            echo "Eats only fries and fresh fish - variety of fish - but it's still worth it!!"
            echo "At this point, contmplates going home or another country - or continent altogether"
        elif [ $country_selection -eq 0 ]; then
            echo $traveler_name "feels exhausted and returns home. Needed the comfort of bed. Adios!"
            exit 0
        fi
      else
        echo "Invalid country selection. Try again."
      fi

    elif [ $continent_selection -eq 7 ]; then
      echo "So you've decided to return home. All good!"
      exit 0
    fi

  else
    echo "Not a valid input. Try again."
  fi

done
