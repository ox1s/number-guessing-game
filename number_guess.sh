#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:"
read USERNAME

while [[ -z $USERNAME ]] 
  do
  read USERNAME
done
#trim input
USERNAME=$(echo $USERNAME | sed 's/ //g')
#get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
#if don't exist
if [[ -z $USER_ID ]]
  then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #add user
  INSERT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi