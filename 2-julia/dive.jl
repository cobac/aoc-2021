abstract type Direction end

struct Forward <: Direction end
struct Up <: Direction end
struct Down <: Direction end

function direction(name)
    if name == "forward"
        return Forward
    elseif name == "up"
        return Up
    elseif name == "down"
        return Down
    else 
        @error "Unrecognized direction name"
    end
end 

struct Movement{T}
    n::Int
end 

movement(mov) = Movement{direction(mov[1])}(parse(Int, mov[2]))

const input = movement.(split.(readlines("input"), " "))

mutable struct Pos
    x::Int
    y::Int
end 

Pos() = Pos(0, 0)

apply!(pos::Pos, mov::Movement{Forward}) = pos.x += mov.n
apply!(pos::Pos, mov::Movement{Up})      = pos.y -= mov.n
apply!(pos::Pos, mov::Movement{Down})    = pos.y += mov.n

function solve(input, pos)
    map(mov -> apply!(pos, mov), input)
    return pos.x * pos.y
end 

answ_1 = solve(input, Pos())

# Part 2
mutable struct PosAim
    x::Int
    y::Int
    aim::Int
end 

PosAim() = PosAim(0, 0, 0)

function apply!(pos::PosAim, mov::Movement{Forward})
    pos.x += mov.n
    pos.y += mov.n * pos.aim
    return nothing
end 
apply!(pos::PosAim, mov::Movement{Up})   = pos.aim -= mov.n
apply!(pos::PosAim, mov::Movement{Down}) = pos.aim += mov.n

answ_2 = solve(input, PosAim())
