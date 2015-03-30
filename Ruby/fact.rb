# Factorial



def fact(n)
  if n < 1
    return 0
  end
  if n == 1
    return 1
  end
  return fact(n - 1) * n
end

fact(0) # 0
fact(1) # 1
fact(2) # 1 * 2 = 2
fact(3) # 1 * 2 * 3 = 6

