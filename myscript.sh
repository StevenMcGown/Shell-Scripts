#! /bin/bash

# ECHO COMMAND
echo Hello World!

# Variables
# UPPERCASE by convention
# Letters, numbers, underscores
NAME="Steven"
echo "My name is ${NAME}."

# USER INPUT
read -p "What is your name? " NAME
echo "Hello $NAME, nice to meet you!"

# SIMPLE IF STATMENT
if [ "$NAME" == "Steven" ]
then
  echo "We have the same name!"
elif [ "$NAME" == "Jack" ]
then
  echo "My brother's name is Jack!"
else
  echo "I like your name."
fi

# COMPARISON
OLD=25
YOUNG=16
read -p "How old are you?" AGE
if [ "$AGE" -gt "$OLD" ]
then
  echo "You're getting old!"
elif [ "$AGE" -lt "$YOUNG" ]
  then
  echo "You're very young!"
else
  echo "You're on your way to becoming an adult!"
fi

# FILE CONDITIONS
FILE="$NAME.txt"
if [ -e "$FILE" ]
then
  echo "$FILE already exists."
else
  echo "$FILE doesn't exist."
  echo "Creating new file for $NAME..."
  touch "$FILE"
  echo "Name: $NAME Age: $AGE" >> $FILE
  echo "Done!"
fi

# CASE STATEMENT
read -p "Do you like waffles? (Y/N)" ANSWER
case "$ANSWER" in
  [yY] | [yY][eE][sS]) # Note the close parenthesis
    echo "$NAME likes waffles." >> $FILE
    echo "Me too!"
    ;; # End with double semicolon
  [nN] | [nN][oO])
    echo "$NAME doesn't like waffles." >> $FILE
    echo "Everyone is entitled to wrong opinions."
    ;;
  *) # Default if they do not enter a valid answer
    echo "Please answer y/yes or n/no"
    ;;
esac

# SIMPLE FOR LOOP
NAMES="Brad Kevin Alice Bob"
echo "Here are some of my friends."
for NAME in $NAMES
  do
    echo "$NAME"
done

# LOOP TO RENAME TEXT FILES
FILES=$(ls *.txt)
NEW="Robert"
for FILE in $FILES
  do
    if [ -e "Bob.txt" ]
    then
      echo "Renaming Bob to Robert"
      mv $FILE "$NEW.txt"
    fi
done

# READ FILE LINE BY LINE
LINE=1
while read -r CURRENT_LINE
  do
    echo "$LINE: $CURRENT_LINE" 
    ((LINE++))
done < "./read-me.txt"
echo "$LINE lines read."

# FUNCTION
function sayHello() {
  echo "Hello again, world"
}

sayHello

function analyze() {
  echo "That text had $1 lines"
}

analyze "$LINE"