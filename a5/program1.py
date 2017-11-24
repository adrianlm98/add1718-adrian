import sys


def num_vowels(text):
    vowels = "aeiou"
    number = 0
    for i in text:
        if i.lower() in vowels:
            number += 1
    return number


def num_whitespaces(text):
    space = 0
    for i in text:
        if i in " ":
            space += 1
    return space


def num_digits(text):
    numbers = "0123456789"
    digits = 0
    for i in text:
        if i in numbers:
            digits += 1
    return digits


def num_words(text):
    words = "abcdefghijklmnñopqrstuvwxyz"
    add = 0
    for i in text:
        if i in words:
            add += 1
    return add


def reverse(text):
    # ...
    return


def length(text):
    # ...
    return


def halfs(text):
    # ...
    return


def upper_vowels(text):
    return


def sorted_by_words(text):
    # ...
    return


def length_of_words(text):
    # ...
    return


text = sys.argv[1]
print("Number of vowels: ", num_vowels(text))
print("Number of whitespaces: ", num_whitespaces(text))
print("Number of digits: ", num_digits(text))
print("Number of words: ", num_words(text))
print("Reverse of text: ", reverse(text))
print("Length of text: ", length(text))
print("Halfs of text: ", halfs(text))
print("Text with uppercased vowels: ", upper_vowels(text))
print("Sorted by words: ", sorted_by_words(text))
print("Length of words: ", length_of_words(text))
