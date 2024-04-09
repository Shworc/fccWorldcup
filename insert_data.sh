#!/bin/bash


PSQL="psql -X --username=freecodecamp --dbname=worldcup -t --no-align -c"

#year,round,winner,opponent,winner_goals,opponent_goals
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # get team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    fi
    
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    fi
      
      
      
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
	  $($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

done
