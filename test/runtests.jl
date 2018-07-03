using DiffTests
using Test

n = rand()
x, y = rand(5, 5), rand(26)
A, B = rand(5, 5), rand(5, 5)

# f returns Number

for f in DiffTests.NUMBER_TO_NUMBER_FUNCS
    @test isa(f(n), Number)
end

for f in DiffTests.VECTOR_TO_NUMBER_FUNCS
    @test isa(f(y), Number)
end

for f in DiffTests.MATRIX_TO_NUMBER_FUNCS
    @test isa(f(x), Number)
end

for f in DiffTests.TERNARY_MATRIX_TO_NUMBER_FUNCS
    @test isa(f(A, B, x), Number)
end

# f returns Array

for f in DiffTests.NUMBER_TO_ARRAY_FUNCS
    @test isa(f(n), Array)
end

for f in DiffTests.ARRAY_TO_ARRAY_FUNCS
    @test isa(f(A), Array)
    @test isa(f(y), Array)
end

for f in DiffTests.MATRIX_TO_MATRIX_FUNCS
    @test isa(f(A), Array)
end

for f in DiffTests.BINARY_MATRIX_TO_MATRIX_FUNCS
    @test isa(f(A, B), Array)
end

# f! returns Nothing

for f! in DiffTests.INPLACE_ARRAY_TO_ARRAY_FUNCS
    @test isa(f!(y, x), Nothing)
end

for f! in DiffTests.INPLACE_NUMBER_TO_ARRAY_FUNCS
    @test isa(f!(y, n), Nothing)
end
