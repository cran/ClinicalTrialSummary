#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericVector ransamf(int repnum, int n, NumericVector B1inq, NumericVector xi1d, NumericVector xi2d, NumericVector cids1, NumericVector cids2) {

  Rcpp::NumericVector out(repnum);
  NumericVector sxi1dg(n);
  NumericVector sxi2dg(n);
  NumericVector scidsg1(n);
  NumericVector scidsg2(n);

  for (int i = 0; i < repnum; ++i) {
    NumericVector g = rnorm(n);

    for(int h = 0; h < n; ++h) {
      sxi1dg[h] = xi1d[h]*g[h];
      sxi2dg[h] = xi2d[h]*g[h];
      scidsg1[h] = cids1[h]*g[h];
      scidsg2[h] = cids2[h]*g[h];
    }

    out[i] = (B1inq[0]*sum(sxi1dg) + B1inq[1]*sum(sxi2dg))/sqrt(n) + sum(scidsg1) + sum(scidsg2);

  }

  return out;

}
