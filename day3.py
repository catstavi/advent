def run():
    with open('day3_input.txt') as f:
        triangles = [line.strip().split() for line in f]
        valid_triangles = [t for t in triangles if valid_triangle(t)]
        print valid_triangles
        print len(valid_triangles)
        # print "checking on possible triangle: {}".format(tri_sides)
        # if not valid_triangle(tri_sides):

def valid_triangle(sides):
    [s1, s2, s3] = [ int(s) for s in sides ]
    if s1 + s2 > s3 and s1 + s3 > s2 and s2 + s3 > s1:
        return True
    else:
        return False

run()
