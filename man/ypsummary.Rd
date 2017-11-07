\name{ypsummary}
\alias{ypsummary}
\alias{ypsummary.default}
\alias{summary.ypsummary}
\alias{print.ypsummary}
\title{The main function of the package provides five summary measures for clinical trials.}
\usage{
\method{ypsummary}{default}(time, event, group, tau, alpha = 0.05,
  tie = TRUE, bound = 50, repnum = 2000, ...)
}
\arguments{
\item{...}{for S4 method only.}

\item{time}{the numeric vector of observations pooled from the two groups}

\item{event}{the numeric vector of the right-censoring indicator (event = 1, censored = 0)}

\item{group}{the numeric vector of the group indicator (treatment = 1, control = 0)}

\item{tau}{the upper end of the range used in defining the summary measures. Must be user-specified.}

\item{alpha}{the significance level. The default value is 0.05.}

\item{tie}{if it is \code{TRUE}, very tiny values will be added to the observations when sorting them.}

\item{bound}{the boundary (-\code{bound}, \code{bound}) for estimating the parameters relevant to a short-term and a long-term hazard ratio in Yang and Prentice model (Yang and Prentice, 2005). These parameters are \eqn{\beta_1} and \eqn{\beta_2} in their notations. The default boundary is \eqn{(-50, 50)}.}

\item{repnum}{the number of replications for the resampling method in obtaining the limiting variance estimators of the measures. The default value is 2000.}
}
\description{
The main function of the package provides five summary measures below:
\itemize{
\item The average hazard ratio (AHR): \eqn{\int _{0}^{\tau} hr(x) dx}{∫ _{0}^{\tau} hr(x)dx}
\item The weighted average hazard ratio (WAHR): \eqn{\int_{0}^{\tau} hr(x) dw(x)}{∫ _{0}^{\tau} hr(x)dw(x)} where \eqn{dw(x) = dF_c(x)/F_c(\tau)}
\item The restricted superiority probability ratio (RSPR): \eqn{\frac{\int_{0}^{\tau} S_c(x) dF_t(x)}{\int_{0}^{\tau} S_t(x) dF_c(x)}}{∫ _{0}^{\tau} S_c(x)dF_t(x) / ∫ _{0}^{\tau} S_t(x)dF_c(x)}
\item The restricted mean survival difference (RMSD): \eqn{\int_{0}^{\tau} S_t(x) dx - \int_{0}^{\tau} S_c(x) dx}{∫ _{0}^{\tau} S_t(x)dx - ∫ _{0}^{\tau} S_c(x)dx}
\item The ratio of restricted mean times lost (RMSR): \eqn{\frac{\tau - \int_{0}^{\tau} S_t(x) dx}{\tau - \int_{0}^{\tau} S_c(x) dx}}{(\tau - ∫ _{0}^{\tau} S_t(x)dx) / (\tau - ∫ _{0}^{\tau} S_c(x)dx)}
  }
}
\details{
The hazard ratio \eqn{hr(x)} is defined as the ratio of \eqn{\lambda_t(x)} over \eqn{\lambda_c(x)} which are the treatment and control hazard functions, respectively.
}
\value{
  \item{Estimate}{The point estimate for the corresponding summary meausure}
  \item{CI}{The confidence interval constructed by a re-sampling method. If the measure is a ratio, the z-value is the standardized log of the estimate. If the measure is a difference, the z-value is the standardized estimate.}
  \item{z-value}{normally distributed value derived from the asymptotic results}
  \item{p-value}{the (two-sided) p-value using \code{z-value}}
}
\references{
Yang, S (2017). Improving testing and description of treatment effect in clinical trials with survival outcomes. Pre-print.

Yang S, and Ross L. Prentice (2005). Semiparametric analysis of short-term and long-term hazard ratios with two-sample survival data. Biometrika, 92.1:1-17.
}

\examples{
library(ClinicalTrialSummary)
data(ggas)
result <- ypsummary(time=ggas$time, event=ggas$event, group=ggas$group, tau=8.2)
result
}
