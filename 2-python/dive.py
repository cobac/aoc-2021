instructions = [line.rstrip().split(" ") for line in open("input").readlines()]

# How to code abstractions in Python? I guess with classes?
# I have no idea I just have an exam tomorrow where I need to hack a bit of Python. 
# If you are thinking about hiring me this is a joke, my Python skills are "intermediate" (:

def solve_1(movements):
    pos = 0
    depth = 0
    for move in movements:
        step = int(move[1])
        if move[0] == "forward":
            pos += step
        elif move[0] == "down":
            depth += step
        elif move[0] == "up":
            depth -= step
        else:
            raise ValueError(f"Unrecognized direction name: {move}.")
    return pos*depth

print(solve_1(instructions))

def solve_2(movements):
    pos = 0
    depth = 0
    aim = 0
    for move in movements:
        step = int(move[1])
        if move[0] == "forward":
            pos += step
            depth += step*aim
        elif move[0] == "down":
            aim += step
        elif move[0] == "up":
            aim -= step
        else:
            raise ValueError(f"Unrecognized direction name: {move}.")
    return pos*depth

print(solve_2(instructions))            
