module DiffTestsMKLSparseExt

import DiffTests: VECTOR_TO_VECTOR_FUNCS, MATRIX_TO_MATRIX_FUNCS
import DiffTests.LinearAlgebra: UpperTriangular, LowerTriangular
import DiffTests.SparseArrays: sparse

sparse_ldiv(x::AbstractVecOrMat) = sparse(test_matrix(x)) \ x
sp_utriag_ldiv(x::AbstractVecOrMat) = UpperTriangular(sparse(test_matrix(x))) \ x
sp_ltriag_ldiv(x::AbstractVecOrMat) = LowerTriangular(sparse(test_matrix(x))) \ x

pushifmissing!(v::AbstractVector, el) =
    isnothing(findfirst(==(el), v)) && push!(v, el)

# enable test functions that require ldiv!(::Matrix, ::SparseMatrixCSC, ::Matrix)
for f in [sparse_ldiv, sp_utriag_ldiv, sp_ltriag_ldiv]
    pushifmissing!(VECTOR_TO_VECTOR_FUNCS, f)
    pushifmissing!(MATRIX_TO_MATRIX_FUNCS, f)
end

end