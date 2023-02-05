#!/bin/bash


###############
## VARIABLES ##
###############

#Declare 4 arrays, each holding 5 articles of clothing
 
tops=("T-shirt" "blouse" "polo" "sweatshirt" "hoodie")
bottoms=("jeans" "shorts" "trousers" "bermuda" "chino")
shoes=("sneakers" "loafers" "hiking boots" "boots" "sandals")
accessories=("leather belt" "tie" "handkerchief" "cap" "socks")
days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")


#########################
## FUNCTION DEFINITION ##
#########################

# YOUR CODE HERE[]

# define ID
 id () {
  ID=$(($RANDOM % 5))
  return ID
}
selectWardrobe () {
  echo "Now selecting weekly wardrobe"
  
  for day in ${days[@]}
  
  do
    id
    TOP=${tops[$ID]}
    id
    BOTTOM=${bottoms[$ID]}
    id
    SHOE=${shoes[$ID]}
    id
    ACC1=${accessories[$ID]}
    id
    ACC2=${accessories[$ID]}

    echo -n "On $day, you shoud wear: "
    echo "$TOP, $BOTTOM, and $SHOE"
    id
    echo -n "Pair with: $ACC1 and $ACC2"
    echo ""
  done
}

outfitSelection () {
  ARG1=$1
  [[ $ARG1 -gt 0 && $ARG1 -lt 53 ]] && echo "Generating outfit selection for $ARG1 weeks"
  workWeek=0
  while [[ workWeek -lt $ARG1 ]]
  do
    echo "Week $(($workWeek +1)) Wardrobe:"
    selectWardrobe
    workWeek=$((workWeek+1))
    
  done

  echo "Enjoy $ARG1 weeks of outfit selections"
}

#######################
## CALLING FUNCTIONS ##
#######################


# YOUR CODE HERE
# selectWardrobe
outfitSelection 4 >> monthlyOutfits.txt

while read textline
do
    echo $textline
done < monthlyOutfits.txt