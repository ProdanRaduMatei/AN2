#!/bin/bash

# Check if the number of arguments is less than 2
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <short_month_name> <day_number>"
    exit 1
fi

# Extract the short month name and day number from arguments
short_month_name="$1"
day_number="$2"

# Get the full month name based on the short month name
case $short_month_name in
    Jan) month_name="January" ;;
    Feb) month_name="February" ;;
    Mar) month_name="March" ;;
    Apr) month_name="April" ;;
    May) month_name="May" ;;
    Jun) month_name="June" ;;
    Jul) month_name="July" ;;
    Aug) month_name="August" ;;
    Sep) month_name="September" ;;
    Oct) month_name="October" ;;
    Nov) month_name="November" ;;
    Dec) month_name="December" ;;
    *) echo "Invalid short month name. Please use the format: Jan, Feb, ..., Dec."
       exit 1
       ;;
esac

# Get the list of user accounts that were connected to the server on the specified date
who | grep -E "$month_name\s+$day_number\b"
