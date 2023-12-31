N = 8

-- check whether position (n,c) is free from attacks
function isplaceok (a, n, c)
    for i = 1, n - 1 do -- for each queen already placed
        if (a[i] == c) or
           (a[i] - i == c - n) or
           (a[i] + i == c + n) then
            return false
        end
    end
    return true
end

function printsolution (a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

found = false

function addqueen (a, n)
    if n > N then
        printsolution(a)
        found = true
    else
        if found then
            return
        end
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                addqueen(a, n + 1)
            end
        end
    end
end

addqueen({}, 1)

