# phenofit 0.3.5 (2022-02-12; Kong et al., 2022, MEE)

- add TIMESAT global model function and cutoff function.
- add the parameter `na.rm` in `check_input`. If `na.rm` = true, missing and
  spike values will be discarded; otherwise, they will be interpolated by valid
  neihbours.
- change `analytical` to `FALSE` in `PhenoDeriv.fFIT`, `PhenoGu.fFIT`

# phenofit 0.3.4 (2021-12-12)

- fix `minpeakheight` error in `PhenoKl`, which leads to `PhenoKl` failed unexpectedly.
- plateau line fitting in `PhenoGu`

# phenofit 0.3.3 (2021-11-14)

- Fix typo error in curvefits' document.

- Fix the error of `plot.fFITs`, due to `fFIT` renamed to `model`.
  
- Rename function `opt_season` to `season_input`
  
- In the case of none growing season division information, `find_season.peaks` will be error. Fixed now.
  
- Fix the bug of `init_param` in the approximately monotonous time-sereis (e.g. fast harvest
  leads to a very short senescence period, and hence approximately monotonic in
  the whole growing season). In previous version, the parameter boundary of `sos`
  might exceed that of `eos`.

- Improved the phenology extraction method `PhenoTrs`, `PhenoDeriv` and
  `PhenoGu` in the approximately monotonous time-sereis. In the previous version
  `NA` value will be return. In the current version, if the time series is
  monotonously increasing, EOS will be the mean value of `t[n]` and peak date of
  season (`POP`). 
  But `PhenoKlos` has no method to avoid `NA` values, because it
  used the strict mathematical solution to find the extreme values in the curve
  of curvature's change rate.

**MAJOR updates to improve multi-GS phenology extraction**

- Fix the bug of `findpeaks`, which lead to sharp changed growing season failed to detect.

- Fix the bug of `PhenoKlos`, where `minpeakheight` not work in previous version.

- Fix the bug of `check_season_dt`, where `peak` might be able to greater than `end`.

- Remove the parameter `check_season_dt` in `removeClosedExtreme`, which might eliminate
  good extreme values.
  
- add `get_pheno.rfit` to extract vegetation phenology from rough fitting directly.

# phenofit 0.3.2 (2021-10-15)

- Parameters of `season_mov` and `curvefits`  are wrapped into options. Scripts of phenofit v2.0 will not work anymore.
- Add global options
- Growing season division was improved. Rough fitting and growing season division are separated. 
- In the package dependency, plyr was replaced with dplyr.
- Add `doubleLog.AG2`, which allows unbalanced background value in the first half and the second half.
- Add `lambda_vcurve` and `lambda_cv_jl` to optimize Whittaker's parameter `lambda`
- Add pkgdown, http://phenofit.top/.
- Growing season division was further tested on FLUXNET daily GPP estimations.

- Julia interface is ready to go, https://github.com/eco-hydro/phenofit.jl.
- phenofit script was separated into a another repository, https://github.com/eco-hydro/phenofit-scripts.

# phenofit 0.3.0 (2021-06-26)

- The rough fitting result returned by [season_mov()] and [season()] was renamed
  from `whit` to `fit`.
- parameters of `season_mov` and `curvefits` are moved into `options`.

# phenofit 0.2.2 (2019-03-19)

- fix visualization (plot and legend) of multiple iteration 
- shinyapp works like TIMESAT now, `phenofit_process` and `phenofit_shiny`
- fix shift error of `wSG`, and add `smooth_SG` and `smooth_wSG`
- add weights updating function: `wKong`
- support asymmetric background values in spring and autumn season.

## major updates

- weights of rough fitting not passed to curve fitting now
- growing season dividing is not used.


# phenofit 0.2.1 (2019-03-11)

- fix point shape error of `plot_input`
- make_legend supports 4 quality categories (MOD13A1) and 6 quality categories (MOD09A1) now.
- wWHIT only adjusts time series of growing season. 


# phenofit 0.2.0 (2019-02-18)    

- release in CRAN


# phenofit 0.1.8 (2019-01-06)    

- `shiny` app `phenofit` released.
- add `QC_flag` to the output of `check_input`.


# phenofit 0.1.7 (2018-10-29)   
- Add V-curve optimization in `season_mov` for Whittaker's parameter lambda.
- Remove `check_ylu` and `upper envelope` in `wWHIT`.
- Update `v-curve`.

# phenofit 0.1.6 (2018-10-26)   

- Melt parameters (i.e. `nptperyear` and `south`) into `INPUT`. `check_input`,
 `season`, `season_mov` and `curvefits` are impacted.
- Add `adj.param` parameter to `season`, which determine whether to automatically 
adjust roughn curve fitting parameters.


# phenofit 0.1.5 (2018-09-19)

- shiny app `check_season` online now.
- `season` can export rough curve fitting result, even no peaks or trough found.


# phenofit 0.1.3 (2018-07-25)

- fix `Init_param`   
    In previous version, parameters are only rely on "good" (w >= 0.5) values. 
    But when "good" values in a relative low ratio, wield parameters will be 
    generated.   
    In this version, when "good" values ratio is lower than 40%, all values 
    will be used to generate initial parameters.   
- Export weigths of every iteration for growing season dividing function, 
(i.e. `wHANT`, `sgfitw` and `whitsmw2`). And unified their weights updating 
strategy.
- `doubleLog.zhang` is still not as stable as others.
- `wTSM_cpp` iter parameter is ignored now.
