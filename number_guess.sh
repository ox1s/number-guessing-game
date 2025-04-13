#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:"
read USERNAME

while [[ -z $USERNAME ]] 
  do
  read USERNAME
done
# trim input
USERNAME=$(echo $USERNAME | sed 's/ //g')

# get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

# if don't exist
if [[ -z $USER_ID ]]
  then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # add user
  INSERT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  # get new user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + RANDOM % 1000))
TRIES=0
GUES=0

echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $( echo $GUESS | sed 's/ //g') -ne $RANDOM_NUMBER ]]
do
  read GUESS
  if echo $GUESS | grep -qE '^[0-9]+$' 
    then
    TRIES=$((TRIES + 1))
    if [[ $GUESS -gt $RANDOM_NUMBER ]]
      then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $GUESS -lt $RANDOM_NUMBER ]]
      then
      echo -e "\nIt's lower than that, guess again:"
    fi
  else
  echo -e "\nThat is not an integer, guess again:"
  fi
done

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses,user_id) VALUES($TRIES, $USER_ID)")
echo -e "\nYou guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
