module DiffTestsMKLSparseExt

import DiffTests: test_matrix, register
import DiffTests.LinearAlgebra: UpperTriangular, LowerTriangular
import DiffTests.SparseArrays: sparse

#sparse_ldiv(x::AbstractVecOrMat) = sparse(test_matrix(x)) \ x # arbitrary sparse matrix not supported
sp_utriag_ldiv(x::AbstractVecOrMat) = UpperTriangular(sparse(test_matrix(x))) \ x
sp_ltriag_ldiv(x::AbstractVecOrMat) = LowerTriangular(sparse(test_matrix(x))) \ x

function __init__()
    register(:VECTOR_TO_VECTOR_FUNCS, [sp_utriag_ldiv, sp_ltriag_ldiv])
    register(:MATRIX_TO_MATRIX_FUNCS, [sp_utriag_ldiv, sp_ltriag_ldiv])
end

end