# Cross-sectional and longitudinal relations among irritability, ADHD symptoms, and inhibitory control in the ABCD Study

GitHub repository to accompany the manuscript "[Cross-Sectional and Longitudinal Relations Among Irritability, Attention-Deficit/Hyperactivity Disorder Symptoms, and Inhibitory Control](https://doi.org/10.1016/j.jaac.2023.10.015)" published in the *Journal of the American Academy of Child and Adolescent Psychiatry*[^1]. This paper reflects [pre-registered analyses](https://doi.org/10.17605/OSF.IO/8RKUP)[^2] using of the [Adolescent Brain Cognitive Development (ABCD) Study](10.1016/j.dcn.2017.10.002) 4.0 release.[^3]

This repository contains analysis code and lists of participants included in the analyses.

## Research Questions

The primary research goal was to examine the cross-sectional and longitudinal associations among irritability, ADHD symptoms, and inhibitory control at the baseline and 2-year follow-up time points of the ABCD Study dataset. The research plan - including planned variables, sample size, and analyses - was outlined in a [pre-registration](https://osf.io/vzter/) that was finalized before analyses were conducted.

## Dataset and Variables

All data for this study came from the baseline and 2-year follow-up time points from the ABCD Study 4.0 release, accessed on April 20, 2022. The dataset is accessible through protected access via [https://nda.nih.gov/abcd/](https://nda.nih.gov/abcd).

The study focused on the following data files (and data columns) from the ABCD Study:  

* `abcd_cbcls01`: irritability (see details below), ADHD symptoms (`cbcl_scr_dsm5_adhd_r`)  

* `abcd_tbss01`: inhibitory control (`nihtbx_flanker_cs`)  

* `acspsw03`: age (`interview_age`), sex (`sex`), race/ethnicity (`race_ethnicity`) 

* `abcd_lt01`: site (`site_id_l`)  

* `pdem02`: combined parental income (`demo_prnt_income_v2` and `demo_prtnr_income_v2`), highest parental income (max of `demo_prnt_ed_v2` and `demo_prtnr_ed_v2`)  

* `ssphp`: pubertal status (`pds_p_ss_female_category_2` and `pds_p_ss_male_category_2`)  

The irritability measure is a sum-score scale constructed from five items of the parent-reported Child Behavior Checklist (CBCL). This irritability scale is drawn from a published paper ([Cordova et al., 2022](https://doi.org/10.1016/j.jaac.2022.03.030))[^4] which demonstrated high convergence between this measure and dimensional ADHD symptom measures.

* Stubborn, sullen, or irritable (`cbcl_q86_p`)  

* Temper tantrums or hot temper (`cbcl_q95_p`)  

* Sudden changes in mood or feelings (`cbcl_q87_p`)  

* Sulks a lot (`cbcl_q88_p`)  

* Argues a lot (`cbcl_q03_p`)

## Sample

Participants were excluded based on missing any of the following:   

* irritability score items from the CBCL  

* ADHD *DSM 5* Scale raw score from the CBCL  

* computed score from the NIH Toolbox Flanker Inhibitory Control and Attention task    

* age  

* sex  

* race/ethnicity   

Participants were included in the final longitudinal analyses based on complete data at both the baseline and 2-year follow-up. This yielded a final total sample size of 7,444 participants, which were randomly assigned to either a "discovery" or "replication" subsample.

Lists of participants included in the main analyses can be found in `discovery_sample.csv` and `replication_sample.csv`. Participants also included in the sensitivity analysis (retaining only one sibling per family) can be found in `discovery_sample_sensitivity.csv` and `replication_sample_sensitivity.csv`.

## Analysis Code

The script `clpm.R` performs a two-wave cross-lagged pannel model (CLPM) with maximum likelihood estimation using the lavaan R package (v0.6.9).[^5] This main analysis, done separately for the discovery and replication samples, examines the cross-sectional and longitudinal associations among irritability, ADHD symptoms, and inhibitory control, measured at the baseline and 2-year follow-up time points.

## References

[^1]: McKay, C.C., De Jesus, A.V., Peterson, O., Leibenluft, E., Kircanski, K. (2024). Cross-Sectional and Longitudinal Relations Among Irritability, Attention-Deficit/Hyperactivity Disorder Symptoms, and Inhibitory Control. *Journal of the American Academy of Child and Adolescent Psychiatry*, *63*(10), 1014-1023. doi: [10.1016/j.jaac.2023.10.015](https://doi.org/10.1016/j.jaac.2023.10.015)

[^2]: McKay, C.C., De Jesus, A.V., Peterson, O., Leibenluft, E., Kircanski, K. Cross-sectional and longitudinal relations among irritability, ADHD symptoms, and inhibitory control in the ABCD study. [osf.io/vzter](osf.io/vzter). Published June 26, 2023.

[^3]: Volkow, N.D., Koob, G.F., Croyle, R.T., Bianchi, D.W., Gordon, J.A., Koroshetz, W.J., Pérez-Stable, E.J., Riley, W.T., Bloch, M.H., Conway, K., Deeds, B.G., Dowling, G.J., Grant, S., Howlett, K.D., Matochik, J.A., Morgan, G.D., Murray, M.M., Noronha, A., Spong, C.Y., Wargo, E.M., … Weiss, S.R.B. (2018). The conception of the ABCD study: From substance use to a broad NIH collaboration. *Developmental Cognitive Neuroscience*, *32*, 4–7. doi: [10.1016/j.dcn.2017.10.002](https://doi.org/10.1016/j.dcn.2017.10.002)

[^4]: Cordova, M.M., Antovich, D.M., Ryabinin, P., Neighbor, C., Mooney, M.A., Dieckmann, N.F., Miranda-Dominguez, O., Nagel, B.J., Fair, D.A., & Nigg, J.T. (2022). Attention-Deficit/Hyperactivity Disorder: Restricted Phenotypes Prevalence, Comorbidity, and Polygenic Risk Sensitivity in the ABCD Baseline Cohort. *Journal of the American Academy of Child and Adolescent Psychiatry*, *61*(10), 1273–1284. doi: [10.1016/j.jaac.2022.03.030](https://doi.org/10.1016/j.jaac.2022.03.030)

[^5]: Rosseel Y. (2012). lavaan: An R Package for Structural Equation Modeling. *Journal of Statistical Software*, *48*(2), 1–36. doi: [10.18637/jss.v048.i02](https://doi.org/10.18637/jss.v048.i02)
