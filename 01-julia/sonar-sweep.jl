const input = parse.(Int, readlines("input"))

function solve(data, stride)
    return sum(next > prev for (prev, next) in zip(data, input[(stride+1):end]))
end 

answ_1 = solve(input, 1)
# The difference between two measurement windows
# is the difference between the dropped element and the new element 
answ_2 = solve(input, 3)
