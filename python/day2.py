input = """RRLUDDLDUDUDUDRDDDRDDRLUUUDRUDURURURLRDDULLLDRRRRULDDRDDURDLURLURRUULRURDDDDLDDRRLDUDUUDURURDLDRRURDLLLDLLRUDRLDDRUULLLLLRRLDUDLUUDRUULLRLLLRLUURDLDLLDDRULDLUURRURLUUURLLDDULRDULULRULDDLRDDUUDLRRURLLURURLDDLURRLUURRRRLDRDLDUDRUDDRULLDUDDLRRLUUUUUDDLLDRLURDDRLLUDULDRDDLLUURUUUURDRLRLLULUULULLRRDLULRUDURDLRLRDDDRULLUULRURULLLUDUURUUUURUULDURDRRRULRLULDLRRULULUUDDDRDURLLURLLDUUUUDULRDLRDUUDDLDUDRLLRLRRRLULUDDDURLRRURUDDDRDRDRLLRDRDLDDRRDRDLLRLLLRRULRDDURRDUDRURDLDULLRRLURLRLLDURRRLLDRRURRRUULDRLDUULRDLDLURUDLLDLLUUDDDUUUDRL
DLRRDRRDDRRDURLUDDDDDULDDLLDRLURDDDDDDRDDDRDDDLLRRULLLRUDULLDURULRRDLURURUDRUURDRLUURRUDRUULUURULULDDLLDDRLDUDDRDRDDUULDULDDLUDUDDUDLULLUDLLLLLRRRUURLUUUULRURULUDDULLLRLRDRUUULULRUUUULRDLLDLDRDRDRDRRUUURULDUUDLDRDRURRUDDRLDULDDRULRRRLRDDUUDRUDLDULDURRDUDDLULULLDULLLRRRDULLLRRURDUURULDRDURRURRRRDLDRRUDDLLLDRDRDRURLUURURRUUURRUDLDDULDRDRRURDLUULDDUUUURLRUULRUURLUUUDLUDRLURUDLDLDLURUURLDURDDDDRURULLULLDRDLLRRLDLRRRDURDULLLDLRLDR
URURLLDRDLULULRDRRDDUUUDDRDUURULLULDRLUDLRUDDDLDRRLURLURUUDRLDUULDRDURRLLUDLDURRRRLURLDDRULRLDULDDRRLURDDRLUDDULUDULRLDULDLDUDRLLDDRRRDULLDLRRLDRLURLUULDDDDURULLDLLLDRRLRRLLRDDRDLDRURRUURLLDDDLRRRRRDLRRDRLDDDLULULRLUURULURUUDRULRLLRDLDULDRLLLDLRRRUDURLUURRUDURLDDDRDRURURRLRRLDDRURULDRUURRLULDLUDUULDLUULUDURRDDRLLLRLRRLUUURRDRUULLLRUUURLLDDRDRULDULURRDRURLRRLRDURRURRDLDUDRURUULULDDUDUULDRDURRRDLURRLRLDUDRDULLURLRRUDLUDRRRULRURDUDDDURLRULRRUDUUDDLLLURLLRLLDRDUURDDLUDLURDRRDLLRLURRUURRLDUUUUDUD
DRRDRRRLDDLDUDRDLRUUDRDUDRRDUDRDURRDDRLLURUUDRLRDDULLUULRUUDDRLDLRULDLRLDUDULUULLLRDLURDRDURURDUDUDDDRRLRRLLRULLLLRDRDLRRDDDLULDLLUUULRDURRULDDUDDDURRDRDRDRULRRRDRUDLLDDDRULRRLUDRDLDLDDDLRLRLRLDULRLLRLRDUUULLRRDLLRDULURRLDUDDULDDRLUDLULLRLDUDLULRDURLRULLRRDRDDLUULUUUULDRLLDRDLUDURRLLDURLLDDLLUULLDURULULDLUUDLRURRRULUDRLDRDURLDUDDULRDRRDDRLRRDDRUDRURULDRRLUURUDULDDDLRRRRDRRRLLURUURLRLULUULLRLRDLRRLLUULLDURDLULURDLRUUDUUURURUURDDRLULUUULRDRDRUUDDDRDRL
RLRUDDUUDDDDRRLRUUDLLDRUUUDRRDLDRLRLLDRLUDDURDLDUDRRUURULLRRLUULLUDRDRUDDULRLLUDLULRLRRUUDLDLRDDDRDDDUDLULDLRRLUDUDDRRRRDRDRUUDDURLRDLLDLDLRRDURULDRLRRURULRDDLLLRULLRUUUDLDUURDUUDDRRRDDRLDDRULRRRDRRLUDDDRUURRDRRDURDRUDRRDLUDDURRLUDUDLLRUURLRLLLDDURUDLDRLRLLDLLULLDRULUURLDDULDDRDDDURULLDRDDLURRDDRRRLDLRLRRLLDLLLRDUDDULRLUDDUULUDLDDDULULDLRDDLDLLLDUUDLRRLRDRRUUUURLDLRRLDULURLDRDURDDRURLDLDULURRRLRUDLDURDLLUDULDDU"""

# to get a single code, take a starting button, the keypad, and the directions
# the keypad is a list of lists
# a starting_button is an index tuple (x, y)
# directions is a list of single letter, R, L, D or U

KEYPAD_WIDTH = 5
KEYPAD_HEIGHT = 5
STARTING_POS = (0, 2)

# KEYPAD = [[1,2,3], [4,5,6], [7,8,9]]
KEYPAD = [
    ["*", "*",  1,  "*", "*"],
    ["*",  2,   3,   4,  "*"],
    [ 5,   6,   7,   8,   9 ],
    ["*", "A", "B", "C", "*"],
    ["*", "*", "D", "*", "*"]
]

def run(input):
    for direction_line in parse_input(input):
        # print "following directions: {}".format(direction_line)
        (x, y) = move_buttons(STARTING_POS, direction_line)
        print KEYPAD[y][x]

def parse_input(input):
    lines = input.split('\n')
    return [list(l) for l in lines]

def move_buttons(starting_pos, directions):
    if directions == []:
        # print "FINAL POSITION: {}".format(starting_pos)
        return starting_pos
    else:
        # print "dir: {}".format(directions[0])
        next_pos = handle_direction(starting_pos, directions[0])
        # print "valid move? {}".format(valid_position(next_pos))
        next_pos = next_pos if valid_position(next_pos) else starting_pos
        (x, y) = next_pos
        # print "new pos: ({},{})".format(x, y)
        # print "now on button: {}".format(KEYPAD[y][x])
        return move_buttons(next_pos, directions[1:])



#
# def parse_direction(direction):
#     if direction == 'R':
#         return (x, lambda: increase)
#     elif direction == 'L':
#         return (x, lambda: decrease)
#     elif direction == 'U':
#         return (y, lambda: decrease)
#     elif direction == 'D':
#         return (y, lambda: increase)
#     else:
#         print "Unrecognized direction: {}".format(direction)
#         exit(1)
#
# def increase_x(pos):
#     return pos + 1
#
# def decrease(pos):
#     return pos - 1

def valid_position(new_position):
    (x, y) = new_position
    return x < KEYPAD_WIDTH and y < KEYPAD_HEIGHT and x >= 0 and y >= 0 and KEYPAD[y][x] != "*"


def handle_direction(current_position, direction):
    (x, y) = current_position
    if direction == 'R':
        return (x+1, y)
    elif direction == 'L':
        return (x-1, y)
    elif direction == 'U':
        return (x, y-1)
    elif direction == 'D':
        return (x, y+1)
    else:
        print "Unrecognized direction: {}".format(direction)
        exit(1)

#
# def correct_position(pos):
#     (x, y) = pos
#     if KEYPAD[y][x] == "*":
#
#     if x < 0:
#         return (0, y)
#     elif x >= KEYPAD_WIDTH:
#         return (KEYPAD_WIDTH-1, y)
#     elif y < 0:
#          return (x, 0)
#     elif y >= KEYPAD_HEIGHT:
#         return (x, KEYPAD_HEIGHT-1)
#     else:
#         return (x, y)

run(input)
#
