#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo -e "\nEnter your username:"
read USERNAME

# trim input
USERNAME=$(echo $USERNAME | tr -d '[:space:]')

# get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

# if don't exist
if [[ -z $USER_ID ]]
  then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  # add user
  INSERT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  # get new user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
else
  #USERNAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
  BEST_GAME=$(echo $BEST_GAME | xargs)
  if [[ -z "$BEST_GAME" ]] 
  then
  BEST_GAME=0  
  fi

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + RANDOM % 1000))
TRIES=0

echo -e "\nGuess the secret number between 1 and 1000:\n"

# game loop
while true 
do
read GUESS

if echo "$GUESS" | grep -qE '^[0-9]+$'
  then
  ((TRIES++))
  if [[ $GUESS -eq $RANDOM_NUMBER ]]
  then
    break
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
    echo -e "\nIt's higher than that, guess again:\n"
  else 
    echo -e "\nIt's lower than that, guess again:\n"
  fi
else
  echo -e "\nThat is not an integer, guess again:\n"
fi
done
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses,user_id) VALUES($TRIES, $USER_ID)")
echo -e "\nYou guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
