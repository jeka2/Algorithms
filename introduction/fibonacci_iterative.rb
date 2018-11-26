class Fibonacci

  def fib(n)

    fib_0 = 0
    fib_1 = 1 
    holder = [0,1]
    1.upto(n) do |i|
      temp = fib_1
      fib_1 = fib_1 + fib_0
      fib_0 = temp
      holder << fib_1
    end
    holder
  end

end
