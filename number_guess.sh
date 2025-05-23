#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read USERNAME

# trim input
USERNAME=$(echo $USERNAME | tr -d '[:space:]')

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
  #USERNAME=$($PSQL "SELECT name FROM users WHERE name='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
  BEST_GAME=$(echo $BEST_GAME | xargs)
  if [[ -z "$BEST_GAME" ]] 
  then
  BEST_GAME=0  
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + RANDOM % 1000))
TRIES=0

echo "Guess the secret number between 1 and 1000:"

# game loop
while true 
do
read GUESS
((TRIES++))

if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
  echo "That is not an integer, guess again:"
  else
  if [[ $GUESS -eq $RANDOM_NUMBER ]]
  then
    break
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
    echo "It's higher than that, guess again:"
  else 
    echo "It's lower than that, guess again:"
  fi
fi
done
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($TRIES, $USER_ID)")
echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
