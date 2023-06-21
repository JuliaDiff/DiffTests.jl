using DiffTests
using Test

n = rand()
x, y = rand(4, 6), rand(26)
A, B = rand(5, 5), rand(5, 5)

# f returns Number

for f in DiffTests.NUMBER_TO_NUMBER_FUNCS
    @test isa(@inferred(f(n)), Number)
end

for f in DiffTests.VECTOR_TO_NUMBER_FUNCS
    @test isa(@inferred(f(y)), Number)
end

for f in DiffTests.MATRIX_TO_NUMBER_FUNCS
    @test isa(@inferred(f(A)), Number)
end

for f in DiffTests.TERNARY_MATRIX_TO_NUMBER_FUNCS
    @test isa(@inferred(f(A, B, x)), Number)
end

# f returns Array

for f in DiffTests.NUMBER_TO_ARRAY_FUNCS
    @test isa(@inferred(f(n)), Array)
end

for f in DiffTests.ARRAY_TO_ARRAY_FUNCS
    @test isa(@inferred(f(x)), Array)
    @test isa(@inferred(f(y)), Array)
end

for f in DiffTests.VECTOR_TO_VECTOR_FUNCS
    @test isa(@inferred(f(y)), Vector)
end

for f in DiffTests.MATRIX_TO_MATRIX_FUNCS
    @test isa(@inferred(f(A)), Matrix)
end

for f in DiffTests.BINARY_MATRIX_TO_MATRIX_FUNCS
    @test isa(@inferred(f(A, B)), Matrix)
end

# f! returns Nothing

for f! in DiffTests.INPLACE_ARRAY_TO_ARRAY_FUNCS
    z = similar(x)
    @test isa(@inferred(f!(z, x)), Nothing)
end

for f! in DiffTests.INPLACE_NUMBER_TO_ARRAY_FUNCS
    zx = similar(x)
    @test isa(@inferred(f!(zx, n)), Nothing)

    zy = similar(y)
    @test isa(@inferred(f!(zy, n)), Nothing)
end
