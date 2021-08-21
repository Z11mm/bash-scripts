# #!/bin/bash

# Create a array of 20 elements of random odd and even numbers
NUMBERS=(7 2 2 2 2 2 4 6 8 10 11 11 13 11 15 17 18 20 19 16)

function smallest_largest() {
  sorted_array=($(for NUMBER in ${NUMBERS[@]};do echo $NUMBER;done | sort -g))

  echo "The number with the highest value is: ${sorted_array[-1]}"
  echo "The number with the lowest value is: ${sorted_array[0]}"
}

function print_sum() {
    for NUMBER in ${NUMBERS[@]}
    do
      if [ $(expr $NUMBER % 2) == "0" ]
      then
        let EVEN_SUM+=$NUMBER
      else
        let ODD_SUM+=$NUMBER
      fi
    done

    echo "The sum of even numbers is: $EVEN_SUM"
    echo "The sum of odd numbers is: $ODD_SUM"
}

function lowest_highest_freq() {
  declare -A numbers_map
COUNTER=1
for NUMBER in ${NUMBERS[@]}
do
  if [ !numbers_map[$NUMBER] ]
  then
    let numbers_map[$NUMBER]+=1
  else
    let numbers_map[$NUMBER]=1
  fi
done

for VALUE in ${numbers_map[@]}
do
  # echo $VALUE
  if [ $VALUE -gt $COUNTER ]
  then
    COUNTER=$VALUE
  fi
done

for KEY in ${!numbers_map[@]}
do
  if [ ${numbers_map[$KEY]} -eq $COUNTER ]
  then
    echo "The number with the highest frequency is: $KEY"
  elif [ ${numbers_map[$KEY]} == "1" ]
  then
    declare -A lowest_freq
    lowest_freq[$KEY]=$KEY
  fi
done

echo "The number with the lowest frequency is: ${lowest_freq[@]}"
}

# echo "$COUNTER"
# echo "${numbers_map[@]}"

smallest_largest
print_sum
lowest_highest_freq