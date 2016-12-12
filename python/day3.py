def run_rows():
    with open('day3_input.txt') as f:
        triangles = [line.strip().split() for line in f]
        print count_valid_triangles(triangles)
        # print "checking on possible triangle: {}".format(tri_sides)
        # if not valid_triangle(tri_sides):

def run_columns():
    columns = [[], [], []]
    with open('day3_input.txt') as f:
        for line in f:
            sides = line.strip().split()
            for side, column in zip(sides, columns):
                add_side_to_col(side, column)
    triangles = [t for col in columns for t in col]
    print count_valid_triangles(triangles)

def count_valid_triangles(triangles):
     valid_triangles = [t for t in triangles if valid_triangle(t)]
     return len(valid_triangles)

def add_side_to_col(side, col):
    if len(col) > 0 and len(col[-1]) < 3:
        col[-1].append(side)
    else:
        col.append([side])

def valid_triangle(sides):
    [s1, s2, s3] = [ int(s) for s in sides ]
    if s1 + s2 > s3 and s1 + s3 > s2 and s2 + s3 > s1:
        return True
    else:
        return False

run_columns()
