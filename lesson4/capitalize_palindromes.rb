# PROBLEM:

# Given a string write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


# input: string
# ouput: new string

# rules:
#      Explict requirements:
#       - every palindrome in the string must be converted to
#         uppercase. (Reminder: a palindrome is a word that reads
#         the same forwards and backwards).
#       - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

#     Implicit requirements:
#      - the returned string shouldn't be the same string object.
#      - can assume inputs are strings
#      - for empty string return empty string
#      - capitalized words can remain capitalized
#      - palindrome check is case sensetive e.g. palindrome?("Mom") == false

