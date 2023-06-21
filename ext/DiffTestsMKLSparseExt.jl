module DiffTestsMKLSparseExt

using LinearAlgebra: UpperTriangular, LowerTriangular
using SparseArrays: sparse

sparse_ldiv(x::AbstractVecOrMat) = sparse(test_matrix(x)) \ x
sp_utriag_ldiv(x::AbstractVecOrMat) = UpperTriangular(sparse(test_matrix(x))) \ x
sp_ltriag_ldiv(x::AbstractVecOrMat) = LowerTriangular(sparse(test_matrix(x))) \ x

pushifmissing!(v::AbstractVector, el) =
    isnothing(findfirst(==(el), v)) && push!(v, el)

# enable test functions that require ldiv!(::Matrix, ::SparseMatrixCSC, ::Matrix)
for f in [sparse_ldiv, sp_utriag_ldiv, sp_ltriag_ldiv]

    pushifmissing!(DiffTests.VECTOR_TO_NUMBER_FUNCS, f)
    pushifmissing!(DiffTests.VECTOR_TO_NUMBER_FUNCS, f)
    pushifmissing!(DiffTests.VECTOR_TO_NUMBER_FUNCS, f)

    pushifmissing!(DiffTests.MATRIX_TO_MATRIX_FUNCS, f)
    pushifmissing!(DiffTests.MATRIX_TO_MATRIX_FUNCS, f)
    pushifmissing!(DiffTests.MATRIX_TO_MATRIX_FUNCS, f)
end

end