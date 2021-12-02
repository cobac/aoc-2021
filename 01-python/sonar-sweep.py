data = [int(line) for line in open("input")]

def solve(stride, data):
    return sum([next > prev for (prev, next) in zip(data, data[stride: ])])

solve(1, data)
solve(3, data)
