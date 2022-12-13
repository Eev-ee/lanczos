(*https://mrob.com/pub/ries/lanczos-gamma.html*)
Dc[n_] := DiagonalMatrix[Table[2*Factorial2[2*k - 1], {k, 0, n}]];
cmatrixElement[row_, col_] := 
  Piecewise[{{0, col > row}, {1/2, 
     row == 1 && col == 1}}, (-1)^(row + col)*4^(col - 1)*(row - 
      1)*(row + col - 3)!/(row - col)!/(2*col - 2)!];
c[n_] := Array[cmatrixElement, {n + 1, n + 1}];
f[g_, n_] := Sqrt[2]*(E/(2*(n + g) + 1))^(n + 1/2);
Dr[k_] := 
 DiagonalMatrix[
  Prepend[Table[-(2*n + 2)!/(2*n!*(n + 1)!), {n, 0, k - 1}], 1]];
bmatrixElement[row_, col_] := 
 Piecewise[{{1, row == 1}, {0, row > col}}, (-1)^(col - row)*
   Binomial[col + row - 3, 2*row - 3]];
b[k_] := Array[bmatrixElement, {k + 1, k + 1}];
lanczosCoeff[g_, n_] := Module[{M, l},
  M = (Dr[n] . b[n]) . (c[n] . Dc[n]);
  l = Transpose[Table[f[g, k], {k, 0, n}]];
  M . l
];
tlg1[g_, n_] := 
 N[MatrixForm[lanczosCoeff[g, n - 1]*Exp[g]/Sqrt[2 Pi]], 20];
 
