# #!/bin/bash

# Create a array of 20 elements of random odd and even numbers
NUMBERS=(7 2 2 2 2 2 4 6 8 10 11 11 13 11 15 17 18 20 19 16)

# Return number with highest and lowest value
function smallest_largest() {
  # Sort array in ascending order
  sorted_array=($(for NUMBER in ${NUMBERS[@]};do echo $NUMBER;done | sort -g))

  # Highest and lowest values are at both ends of a sorted array
  echo "The number with the highest value is: ${sorted_array[-1]}"
  echo "The number with the lowest value is: ${sorted_array[0]}"
}

# Print sum of all even and odd numbers
function print_sum() {
  # Iterate through the list
    for NUMBER in ${NUMBERS[@]}
    do
      # Find the even and odd numbers, and add them
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

# Return number with highest and lowest frequency
function lowest_highest_freq() {
  # Create an associative array - to serve the purpose of a hash map
  declare -A numbers_map
  COUNTER=1
  # Iterate through given array and populate the associative array
  # keys: items of given array; values: number of times items occur in array
  for NUMBER in ${NUMBERS[@]}
  do
    if [ !numbers_map[$NUMBER] ]
    then
      let numbers_map[$NUMBER]+=1
    else
      let numbers_map[$NUMBER]=1
    fi
  done
  
  # Find the highest frequency and update the counter
  for VALUE in ${numbers_map[@]}
  do
    # echo $VALUE
    if [ $VALUE -gt $COUNTER ]
    then
      COUNTER=$VALUE
    fi
  done
  
  # Match the counter value to the highest freq number(key)
  for KEY in ${!numbers_map[@]}
  do
    if [ ${numbers_map[$KEY]} -eq $COUNTER ]
    then
      echo "The number with the highest frequency is: $KEY"
    # Find numbers with the lowest freq and add them to an associative array
    elif [ ${numbers_map[$KEY]} == "1" ]          
    then
      declare -A lowest_freq
      lowest_freq[$KEY]=$KEY
    fi
  done
  
  echo "The number with the lowest frequency is: ${lowest_freq[@]}"
}

smallest_largest
print_sum
lowest_highest_freq