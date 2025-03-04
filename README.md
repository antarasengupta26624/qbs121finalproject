<style>
  body {
    font-family: 'Times New Roman', Times, serif;
  }
	 h1 {
    text-align: center;
  }
</style>


# Socioeconomic Disparities in Mental Health


## Contents 
I. Introduction \
II. Objectives \
III. Methods* \
IV. Conclusions \
V. References \
*All code can be found in Methods_final.pdf






## I. Introduction
This dataset includes nationally representative, cross-sectional survey data conducted by CDC’s National Center for Health Statistics (NCHS). Specifically,  The National Health and Nutrition Examination Survey (NHANES) 2021-2023 data were used. It collects data on demographics, socioeconomic status (SES), dietary habits, health behaviors, and medical conditions – including mental health indicators. The NHANES is unique in that it is the only health survey that includes health exams, laboratory tests, and dietary interviews for participants of all ages in the United States. 

Current socioeconomic disparities in depression are well-documented and multifaceted. Individuals with lower socioeconomic status (SES) are more likely to experience higher rates of depression and more severe depressive symptoms. This is influenced by factors such as income, education, employment status, and housing conditions. Current literature indicates that individuals in the lowest income quintile have a higher probability of experiencing symptoms of depression compared to those in the highest income quintile. Specifically, being in the richest income quintile is associated with a lower probability of experiencing symptoms of anxiety and depression (OR = 0.67, CI [0.64-0.70]).[1]   Additionally, lower educational attainment and unemployment are significant predictors of poorer depression outcomes. For instance, unemployed individuals have a 28% higher depressive symptom scale score compared to employed individuals. [2]

Unfortunately but unsurprisingly, the COVID-19 pandemic has exacerbated these disparities. During the pandemic, adults with less than a high school education, those with incomes below $25,000, and renters had significantly higher odds of serious depression compared to their higher-SES counterparts.[3] Furthermore, socioeconomic inequalities in depression were found to persist or even increase during the pandemic, particularly affecting those with lower income and educational levels.[4]

Moreover, socioeconomic factors also influence the utilization and perceived helpfulness of mental health treatments. Higher SES individuals are more likely to talk to a mental health professional and perceive the treatment as helpful.[1] However, disparities in treatment outcomes are evident, with lower SES individuals experiencing slower and less improvement in response to pharmacotherapy for major depression.[5]

Therefore, there is strong theory suggesting that socioeconomic disparities in depression are significant and multifactorial, with lower SES associated with higher prevalence, greater severity, and poorer treatment outcomes for depression. Addressing these disparities requires firstly identification of the problem then procurement of targeted interventions that consider such broader socioeconomic determinants of mental health. Employing the NHANES sample will allow for a nationwide examination of mental health variation. The aim of the present study is to elucidate specific socioeconomic disparities in mental health; specifically, we will operationalize mental health problems with a depression scale and include highly correlated socioeconomic indicators in our modeling.




## II. Objectives


## III. Methods

<iframe src="assets/table1.html" width=800 height=600 frameBorder=0></iframe>

### A. **Data Wrangling**

1. Reading & Merging Data
- Imported ‘depression questionnaire’ and ‘demographics’ datasets using read_xpt().
- Merged both datasets by the unique identifier ‘SEQN’.

2. Handling Missing Data  
- Removed ‘RIDAGEMN’ variable since it contained only NA values.
- Applied Multiple Imputation by Chained Equations (MICE) using predictive mean matching (pmm) to handle missing values.
- Extracted five imputed datasets and selected the first one (nhanes_imputed.1) for all future analyses.

3. Variables Renaming for Readability   
- Renamed key variables for clarity.

4. Data Cleaning & Filtering
- Removed responses coded as ‘Refuse’ and ‘Don’t Know’ in categorical variables. 
- Kept data consistency by applying similar filtering across other variables.

5. Creating the PHQ-9 Depression Score   
- Identified PHQ-9 questionnaire variables (‘DPQ010’ to ‘DPQ090’).
- Converted values 7 (refused) and 9 (missing) to NA.
- Calculated PHQ-9 Total Score as the sum of all NA responses.


### B. **Pearson Correlation Matrix**
1. Defining Key SES Indicators
- Demographics: Race/Ethnicity, Gender, Age, Birthplace, Military Service Status
- SES Factors: Education Level, Marital Status, Household Size, Income Level
- Depression Indicator: PHQ-9 Total Score
  
2. Computing Pearson Correlation Matrix 
- Extracted correlation values specifically for the PHQ-9 score.

3. Results:
- Highest Negative Correlations:
  - Income Level (r = -0.196): Higher income is associated with lower PHQ-9 scores.
  - Age (r = -0.170): Older individuals tend to have lower PHQ-9 scores.
  - Education Level (r = -0.118): Higher education is mildly associated with lower depression scores. 

- Highest Positive Correlations:
  - Marital Status (r = 0.155): Being married may be linked to higher PHQ-9 scores.
  - Gender (r = 0.110): Females may be linked to higher PHQ-9 scores. 

4. Conclusions:
- Socioeconomic factors (income, education, age) seem more relevant to depression scores 
- Marital status and gender show some association but are weaker 
- Race, birthplace, and household size have negligible impact

<iframe src="assets/ggpairs_plot.html" width=800 height=600 frameBorder=0></iframe>

### C. **Linear Mixed-Effects Model (LMM) with PSU as a Random Effect**
This model showcases how socioeconomic and demographic factors impact PHQ-9 scores, while accounting for PSU (Primary Sampling Unit) clustering. 

1. Why this model?
- Survey data is clustered within PSUs.
- LMM accounts for PSU variability, improving overall model accuracy. 

2. Model Summary
lmer(PHQ9_TOTAL ~ Gender_Code +  Age_Years + Education_Level + Marital_Status + Income_Level_as_Poverty_Ratio + (1 | SDMVPSU), data = nhanes_cleaned, REML = FALSE)
- Random effect (PSU variance): 0.00385 -  minimal clustering impact. 
- Residual variance: 20.59 - most variation is individual level

3. Results:
- Gender (Female): Females have higher PHQ-9 scores.
- Age: Older age is linked to lower PHQ-9 scores.
- Education: Higher education lowers PHQ-9 scores.
- Marital status: Being married increases PHQ-9 scores.
- Income Level: Higher income lowers PHQ-9 scores. 

<iframe src="assets/LMM_results.html" width=800 height=600 frameBorder=0></iframe>

### D. **Binary Logistic Regression for PHQ-9 Depression (Median Split)**

<iframe src="assets/Log Regression Final .html" width=800 height=600 frameBorder=0></iframe>


## IV. Conclusion


## V. References
Henking C, Reeves A, Chrisinger B. Global inequalities in mental health problems: understanding the predictors of lifetime prevalence, treatment utilisation and perceived helpfulness across 111 countries. Prev Med. 2023;177:107769. doi:10.1016/j.ypmed.2023.107769
Buckman JEJ, Saunders R, Stott J, et al. Socioeconomic Indicators of Treatment Prognosis for Adults With Depression: A Systematic Review and Individual Patient Data Meta-analysis. JAMA Psychiatry. 2022;79(5):406. doi:10.1001/jamapsychiatry.2022.0100
Lee H, Singh GK. Monthly trends in self-reported health status and depression by race/ethnicity and socioeconomic status during the COVID-19 Pandemic, United States, April 2020 – May 2021. Ann Epidemiol. 2021;63:52-62. doi:10.1016/j.annepidem.2021.07.014
Herrmann K, Beese F, Wollgast L, et al. Temporal dynamics of socioeconomic inequalities in depressive and anxiety symptoms during the COVID-19 pandemic: a scoping review. Front Public Health. 2024;12:1397392. doi:10.3389/fpubh.2024.1397392
Mills JA, Suresh V, Chang L, et al. Socioeconomic Predictors of Treatment Outcomes Among Adults With Major Depressive Disorder. Psychiatr Serv. 2022;73(9):965-969. doi:10.1176/appi.ps.202100559



## V. References
