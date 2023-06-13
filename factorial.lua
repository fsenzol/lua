local function factorial(n)
    if n == 0 then
        return 1
    end
        if n < 0 then 
            return nil
     end
return n * factorial(n-1)
    end

    local function comb(m,n)
        return factorial(m)/((factorial(m-n))*factorial(n))
    end 
        
    local function shuffle(a)
        local n = factorial(#a)
    end
    math.randomseed(os.time())
   _G.arr = {}

   for i = 1, 10 do
    arr[i] = math.random(10)
    while arr[i] == math.random(10) do
        arr[i] = math.random(10)
    end
    
    print(arr[i])
   end