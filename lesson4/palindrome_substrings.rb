# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Input: String
# Output: an Array of substrings
# Questions:
# -Ignore whitespace and puntuation?
# -In examples 'dd' is returned but not 'll'?
# -Can I consider all inputs strings?
# -Will array elements be copies or originals
# Rules:
#   -Explicit:
#     -Return palindrome substrings from input String
#     -Consider palindrome words case sensitive
#   -Implicit:
#     -substrings are not sepereated by spaces or other characters
#     -for empty string return empty array 
#     -for if no substrings match return empty array

# Algorithm: 
#   - initialize a result variable to an empty array
#   - create an array named substring_arr that contains all of the
#     substrings of the input string that are at least 2 characters long.
#   - loop through the words in the substring_arr array.
#   - if the word is a palindrome append it to the result array
#   - return result array
