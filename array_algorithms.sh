#!/bin/bash

# Create a array of 20 elements of random odd and even numbers
numbers=(7 2 5 7 9 2 4 6 8 10 11 11 13 11 15 17 18 20 19 16)

function smallest_largest() {
  sorted_array=($(for number in ${numbers[@]};do echo $number;done | sort -g))

  echo "The number with the highest value is: ${sorted_array[-1]}"
  echo "The number with the lowest value is: ${sorted_array[0]}"
}

function print_sum() {
    for number in ${numbers[@]}
    do
      if [ $(expr $number % 2) == "0" ]
      then
        let even_sum+=$number
      else
        let odd_sum+=$number
      fi
    done

    echo "The sum of even numbers is: $even_sum"
    echo "The sum of odd numbers is: $odd_sum"
}

smallest_largest
print_sum