PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  INSERT_WINNER_RESULT=$($PSQL "INSERT INTO games(winner_goals) VALUES('$WINNER')")
done