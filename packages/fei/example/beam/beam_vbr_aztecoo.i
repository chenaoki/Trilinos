SOLVER_LIBRARY Trilinos_AztecOO
DATA_SOURCE HexBeam
BLOCK_MATRIX true
W 40
D 40
DofPerNode 3
outputLevel 1
AZ_max_iter 100
AZ_orthog AZ_classic
AZ_conv AZ_r0
AZ_tol 3.e-8
AZ_solver AZ_gmres
AZ_precond AZ_Jacobi
