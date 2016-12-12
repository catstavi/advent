from collections import defaultdict
import string
import re

def valid_room(room_code, checksum):
    counts = count_letters(room_code)
    ordered_letters = sorted(
        counts,
        key=lambda x: (-counts[x], string.lowercase.index(x))
    )
    return ordered_letters[0:5] == list(checksum)


def count_letters(input_string):
    counts = defaultdict(lambda: 0)
    cleaned_input = re.sub(r"(\d|-)", "", input_string)
    for letter in list(cleaned_input):
        counts[letter] += 1
    return counts


def decrypt(room, sector_id):
    decrypted_room = ""
    for char in re.sub("-", " ", room):
        if char == " ":
            decrypted_room += char
        else:
            next_letter_idx = (string.lowercase.index(char) + sector_id) % 26
            decrypted_room += string.lowercase[next_letter_idx]
    return decrypted_room


def parse_input(filename):
    sum = 0
    with open(filename) as f:
        for line in f:
            matches = re.match(r'(.+)-(\d+)\[(\D+)\]', line)
            room = matches.group(1)
            sector_id = int(matches.group(2))
            checksum = matches.group(3)
            if valid_room(room, checksum):
                real_room = decrypt(room, sector_id)
                if "north" in real_room or "pole" in real_room or "santa" in real_room:
                    print real_room
                    print sector_id
                # sum += sector_id
    # print sum


parse_input("day4_input.txt")
