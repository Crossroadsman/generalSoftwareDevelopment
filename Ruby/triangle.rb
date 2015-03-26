# triangle

def triangle(n, start=1)
  
  # computes triangle numbers, takes n and, optionally, a startpoint for sequences that start not at 1.

  t      = (n * (n + 1)) / 2
  x      = start - 1 
  tstart = (x * (x + 1)) / 2
  return t - tstart

end

