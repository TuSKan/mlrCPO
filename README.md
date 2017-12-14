[![Build Status](https://travis-ci.org/mlr-org/mlrCPO.svg?branch=master)](https://travis-ci.org/mlr-org/mlrCPO)
[![Coverage](https://codecov.io/github/mlr-org/mlrCPO/branch/master/graphs/badge.svg)](https://codecov.io/github/mlr-org/mlrCPO)
[![CRAN Status Badge](http://www.r-pkg.org/badges/version/mlrCPO)](https://CRAN.R-project.org/package=mlrCPO)
[![CRAN Downloads](http://cranlogs.r-pkg.org/badges/mlrCPO)](https://cran.rstudio.com/web/packages/mlrCPO/index.html)


# mlrCPO: Composable Preprocessing Operators for [mlr](https://github.com/mlr-org/mlr)

GSoC 2017 Project: Operator Based Machine Learning Pipeline Construction

## What is CPO?

```R
> task = iris.task
> task %<>>% cpoScale(scale = FALSE) %>>% cpoPca()  # pca
> task %<>>% cpoFilterChiSquared(abs = 2)  # filter
> task %<>>% cpoModelMatrix(~ 0 + .^2)  # interactions
> head(getTaskData(task))
        PC1        PC2    PC1:PC2 Species
1 -2.684126 -0.3193972  0.8573023  setosa
2 -2.714142  0.1770012 -0.4804064  setosa
3 -2.888991  0.1449494 -0.4187575  setosa
4 -2.745343  0.3182990 -0.8738398  setosa
5 -2.728717 -0.3267545  0.8916204  setosa
6 -2.280860 -0.7413304  1.6908707  setosa
```

"Composable Preprocessing Operators" are an extension for the [mlr](https://github.com/mlr-org/mlr) ("Machine Learning in R") project which represent preprocessing operations (e.g. imputation or PCA) in the form of R objects. These CPO objects can be composed to form more complex operations, they can be applied to data sets, and they can be attached to mlr `Learner` objects to generate complex machine learning pipelines that perform both preprocessing and model fitting.

## Table of Contents

* [Installation](#installation)
* [Short Overview](#short-overview)
* [Documentation](#documentation)
* [Project Status](#project-status)
* [Similar Projects](#similar-projects)
* [License](#license)

## Installation

`mlrCPO` relies on a small extensions of [`ParamHelpers`](https://github.com/berndbischl/ParamHelpers/pull/194) and the current github version of [`mlr`](https://github.com/mlr-org/mlr/pull/1827). Until these changes propagate to CRAN, you need to install these using [`devtools`](https://cran.r-project.org/web/packages/devtools/README.html):

```R
devtools::install_github("mlr-org/ParamHelpers", ref = "paramSetSugar")
devtools::install_github("mlr-org/mlr")
```

Now install `mlrCPO`:

```R
devtools::install_github("mlr-org/mlrCPO")
```

## Short Overview

CPOs are created by calling a constructor.
```R
> cpoScale()
scale(center = TRUE, scale = TRUE)
```

The created objects have Hyperparameters that can be manipulated using `getHyperPars`, `setHyperPars` etc, just like in `mlr`.
```R
> getHyperPars(cpoScale())
$scale.center
[1] TRUE

$scale.scale
[1] TRUE

> setHyperPars(cpoScale(), scale.center = FALSE)
scale(center = FALSE, scale = TRUE)
```

The `%>>%`-operator can be used to create complex pipelines.
```R
> cpoScale() %>>% cpoPca()
(scale >> pca)(scale.center = TRUE, scale.scale = TRUE)
```

This operator can also be used to apply an operation to a data set:
```R
> head(iris %>>% cpoPca())
  Species       PC1      PC2          PC3          PC4
1  setosa -5.912747 2.302033  0.007401536  0.003087706
2  setosa -5.572482 1.971826  0.244592251  0.097552888
3  setosa -5.446977 2.095206  0.015029262  0.018013331
4  setosa -5.436459 1.870382  0.020504880 -0.078491501
5  setosa -5.875645 2.328290 -0.110338269 -0.060719326
6  setosa -6.477598 2.324650 -0.237202487 -0.021419633
```

Or to attach an operation to an MLR `Learner`, which extends the Learner's hyperparameters by the CPO's hyperparameters:

```R
> cpoScale() %>>% makeLearner("classif.logreg")
Learner classif.logreg.scale from package stats
Type: classif
Name: ; Short name: 
Class: CPOLearner
Properties: numerics,factors,prob,twoclass
Predict-Type: response
Hyperparameters: model=FALSE,scale.center=TRUE,scale.scale=TRUE
```

Get a list of all `CPO`s by calling `listCPO()`.

## Documentation

To effectively use `mlrCPO`, you should first familiarize yourself a little with `mlr`. There is an extensive [tutorial](https://mlr-org.github.io/mlr-tutorial/devel/html/) online; for more ressources on `mlr`, see the overview on `mlr`'s [GitHub page](https://github.com/mlr-org/mlr).

A thorough reference of `mlrCPO`'s capabilities can be found in the [vignette](https://rawgit.com/mlr-org/mlrCPO/master/inst/doc/mlrCPO.html) ([compact version](https://rawgit.com/mlr-org/mlrCPO/master/inst/doc/mlrCPO_terse.html)). For more documentation of individual `mlrCPO` functions, use R's built-in `help()` functionality.

A small intro guide for developers into the code base can be found in [info/developers.md](info/developers.md).

## Project Status

The foundation of `mlrCPO` is built and is reasonably stable, only small improvements and stability fixes are expected here. There are still many concrete implementations of preprocessing operators to be written.

## Similar Projects

There are other projects that provide functionality similar to `mlrCPO` for other machine learning frameworks. The [caret](https://github.com/topepo/caret) project provides some preprocessing functionality, though not as flexible as `mlrCPO`. Much more close to `mlrCPO`'s functionality is the [Recipes package](https://topepo.github.io/recipes/). [scikit learn](http://scikit-learn.org/stable/) also has [preprocessing functionality](http://scikit-learn.org/stable/modules/preprocessing.html) built in.

## License

The BSD 2-Clause License
