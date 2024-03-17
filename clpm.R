# R Script for running cross-lagged panel models (CLPMs) for the discovery and replication samples
# Manuscript: Cross-Sectional and Longitudinal Relations Among Irritability, Attention-Deficit/Hyperactivity Disorder Symptoms, and Inhibitory Control

# Authors: Cameron C. McKay, Alethea V. de Jesus
# Date: 2024

# Table of Contents:
# - Install and load required packages
# - Load in data
# - CLPM for discovery sample
# - CLPM for replication sample

# Note: CLPM code originally modified from: https://rpubs.com/leomartinsjf/Ch5Newson

#########################################################
### Install and load required packages
#########################################################
if (!require("here")) {
  install.packages("here", dependencies = TRUE)
  library(here)
}
if (!require("lavaan")) {
  install.packages("lavaan", dependencies = TRUE)
  library("lavaan")
}

#########################################################
### Load in data
#########################################################

# Set filepath
filepath <- "path_to_data"

# Discovery sample
analysis_sample_1 <- read.csv(here::here(filepath, 'Project Code/analysis_sample_1.csv'), header = TRUE, sep = ",", dec = ".")

# Replication sample
analysis_sample_2 <- read.csv(here::here(filepath, 'Project Code/analysis_sample_2.csv'), header = TRUE, sep = ",", dec = ".")

#########################################################
### CLPM for discovery sample
#########################################################

# Make default data frame
attach(analysis_sample_1)

# Cross lagged panel model
# Regressions ON (~) "y regressed on x"; co-variation WITH (~~) 
lavaan_model_1 <- 
  'Year2_CBCL_irritability_sum ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  Year2_cbcl_scr_dsm5_adhd_r ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  Year2_nihtbx_flanker_cs ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  baseline_CBCL_irritability_sum ~~ baseline_cbcl_scr_dsm5_adhd_r
  baseline_CBCL_irritability_sum ~~ baseline_nihtbx_flanker_cs
  baseline_cbcl_scr_dsm5_adhd_r ~~ baseline_nihtbx_flanker_cs
  
  Year2_CBCL_irritability_sum ~~ Year2_cbcl_scr_dsm5_adhd_r
  Year2_CBCL_irritability_sum ~~ Year2_nihtbx_flanker_cs
  Year2_cbcl_scr_dsm5_adhd_r ~~ Year2_nihtbx_flanker_cs'

# Model fit
lavaan_fit_1 <- lavaan::sem(model = lavaan_model_1, 
                            data = analysis_sample_1,
                            estimator = "ML")

# Print model summary
lavaan::summary(lavaan_fit_1, fit.measures=TRUE, standardized=TRUE)

# Model fit measures: clean output
d_lavaan_fit_measures_1 <- as.data.frame(
  lavaan::fitmeasures(lavaan_fit_1, fit.measures = c("chisq", "df", "pvalue", "rmsea",
                                                     "rmsea.ci.lower", "rmsea.ci.upper",
                                                     "cfi", "nnfi", "aic", "bic")))

names(d_lavaan_fit_measures_1)[1]<-"Model fit measures"

# Parameter estimates: clean output
fit_parameter_1 <-lavaan::parameterestimates(lavaan_fit_1,output ="text", 
                                             standardized =T,
                                             rsquare=T) 
fit_parameter_1_df <- as.data.frame(fit_parameter_1)


#########################################################
### CLPM for replication sample
#########################################################

# Make default data frame
attach(analysis_sample_2)

# Cross lagged panel model
# Regressions ON (~) "y regressed on x"; co-variation WITH (~~) 
lavaan_model_2 <- 
  'Year2_CBCL_irritability_sum ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  Year2_cbcl_scr_dsm5_adhd_r ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  Year2_nihtbx_flanker_cs ~ baseline_CBCL_irritability_sum  + baseline_cbcl_scr_dsm5_adhd_r  + baseline_nihtbx_flanker_cs 
  
  baseline_CBCL_irritability_sum ~~ baseline_cbcl_scr_dsm5_adhd_r
  baseline_CBCL_irritability_sum ~~ baseline_nihtbx_flanker_cs
  baseline_cbcl_scr_dsm5_adhd_r ~~ baseline_nihtbx_flanker_cs
  
  Year2_CBCL_irritability_sum ~~ Year2_cbcl_scr_dsm5_adhd_r
  Year2_CBCL_irritability_sum ~~ Year2_nihtbx_flanker_cs
  Year2_cbcl_scr_dsm5_adhd_r ~~ Year2_nihtbx_flanker_cs'

# Model fit
lavaan_fit_2 <- lavaan::sem(model = lavaan_model_2, 
                            data = analysis_sample_2,
                            estimator = "ML")

# Print model summary
lavaan::summary(lavaan_fit_2, fit.measures=TRUE, standardized=TRUE)

# Model fit measures: clean output
d_lavaan_fit_measures_2 <- as.data.frame(
  lavaan::fitmeasures(lavaan_fit_2, fit.measures = c("chisq", "df", "pvalue", "rmsea",
                                                     "rmsea.ci.lower", "rmsea.ci.upper",
                                                     "cfi", "nnfi", "aic", "bic")))

names(d_lavaan_fit_measures_2)[1]<-"Model fit measures"

# Parameter estimates: clean output
fit_parameter_2 <-lavaan::parameterestimates(lavaan_fit_2,output ="text", 
                                             standardized =T,
                                             rsquare=T) 
fit_parameter_2_df <- as.data.frame(fit_parameter_2)
