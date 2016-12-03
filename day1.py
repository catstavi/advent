# we'll keep track of how far I've moved in each cardinal direction
# then, for each pair n/s or e/w, get the difference, and add

# so, for each value, evaluate which direction I'm facing and then add to it
import sets

TURN_LEFT = {'N': 'W', 'W': 'S', 'S': 'E', 'E': 'N'}
TURN_RIGHT = {'N': 'E', 'E': 'S', 'S': 'W', 'W': 'N'}

def find_distance(initial_heading, directions):
    movements = {'N': 0, 'E': 0, 'S': 0, 'W': 0}
    heading = initial_heading
    dir_array = parse_directions(directions)
    for (turn, blocks) in dir_array:
        heading = rotate(heading, turn)
        print "turned to: {}, moveing {} blocks".format(heading, blocks)
        movements[heading] += int(blocks)
    print movements
    print distance_from_start(movements)

def track_locations(initial_heading, directions):
    location = {'N': 0, 'E': 0, 'S': 0, 'W': 0}
    visited = []
    heading = initial_heading
    dir_array = parse_directions(directions)
    for (turn, blocks) in dir_array:
        print "Turning {} and moving {} blocks".format(turn, blocks)
        heading = rotate(heading, turn)
        for block in range(0, int(blocks)):
            location[heading] += 1
            print "       location: {}".format(location)
            simple_location = position_relative_to_start(location)
            print "simple location: {}\n".format(simple_location)
            if simple_location in visited:
                print "it's not the first time we've been here."
                print distance_from_start(simple_location)
                return
            visited.append(position_relative_to_start(simple_location))

def move_with_tracking(current_location, heading, blocks, movements):
    visited = Set()
    for block in range(1, blocks):
        movements[heading] += 1

def parse_directions(directions):
    move_units = str.split(directions, ', ')
    return [(unit[0], unit[1:]) for unit in move_units]

def rotate(heading, turn):
    if turn == 'R':
        return TURN_RIGHT[heading]
    elif turn == 'L':
        return TURN_LEFT[heading]
    else:
        print "saw an unrecognized turn direction: {}".format(turn)
        exit(1)

def distance_from_start(movements):
    return abs(movements['N'] - movements['S']) + abs(movements['W'] - movements['E'])

def position_relative_to_start(movements):
    relative_position = {'N': 0, 'E': 0, 'S': 0, 'W': 0}
    north_south = movements['N'] - movements['S']
    east_west = movements['E'] - movements['W']
    if north_south > 0:
        relative_position['N'] = north_south
    else:
        relative_position['S'] = abs(north_south)
    if east_west > 0:
        relative_position['E'] = east_west
    else:
        relative_position['W'] = abs(east_west)
    return relative_position


track_locations('N', 'R4, R5, L5, L5, L3, R2, R1, R1, L5, R5, R2, L1, L3, L4, R3, L1, L1, R2, R3, R3, R1, L3, L5, R3, R1, L1, R1, R2, L1, L4, L5, R4, R2, L192, R5, L2, R53, R1, L5, R73, R5, L5, R186, L3, L2, R1, R3, L3, L3, R1, L4, L2, R3, L5, R4, R3, R1, L1, R5, R2, R1, R1, R1, R3, R2, L1, R5, R1, L5, R2, L2, L4, R3, L1, R4, L5, R4, R3, L5, L3, R4, R2, L5, L5, R2, R3, R5, R4, R2, R1, L1, L5, L2, L3, L4, L5, L4, L5, L1, R3, R4, R5, R3, L5, L4, L3, L1, L4, R2, R5, R5, R4, L2, L4, R3, R1, L2, R5, L5, R1, R1, L1, L5, L5, L2, L1, R5, R2, L4, L1, R4, R3, L3, R1, R5, L1, L4, R2, L3, R5, R3, R1, L3')
