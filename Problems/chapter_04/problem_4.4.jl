function my_it_fib(k)
    if k == 0
        return k
    elseif typeof(k) != Int
        print("ERROR: Integer Required")
        return 0
    end
    # Hence k must be a positive integer
       
    i  = 1
    n1 = 1
    n2 = 1

    # if k <=2:
    #     return 1
    while i < k
       no = n1
       n1 = n2
       n2 = no + n2
       i = i + 1
    end
    return (n1)
end

# start = time.time()
my_it_fib(6000)
# print(str(round(time.time() - start, 9)) + "seconds")
   
@time my_it_fib(10^6)


typeof(9) == Int
