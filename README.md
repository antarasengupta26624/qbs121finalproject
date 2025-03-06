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
IV. Results \
V. Conclusions \
VI. Future Research \
VII. References \
*All code can be found in Methods_final.pdf






## I. Introduction
This dataset includes nationally representative, cross-sectional survey data conducted by CDC’s National Center for Health Statistics (NCHS). Specifically,  The National Health and Nutrition Examination Survey (NHANES) 2021-2023 data were used. It collects data on demographics, socioeconomic status (SES), dietary habits, health behaviors, and medical conditions – including mental health indicators. The NHANES is unique in that it is the only health survey that includes health exams, laboratory tests, and dietary interviews for participants of all ages in the United States. 

Current socioeconomic disparities in depression are well-documented and multifaceted. Individuals with lower socioeconomic status (SES) are more likely to experience higher rates of depression and more severe depressive symptoms. This is influenced by factors such as income, education, employment status, and housing conditions. Current literature indicates that individuals in the lowest income quintile have a higher probability of experiencing symptoms of depression compared to those in the highest income quintile. Specifically, being in the richest income quintile is associated with a lower probability of experiencing symptoms of anxiety and depression (OR = 0.67, CI [0.64-0.70]).[1]   Additionally, lower educational attainment and unemployment are significant predictors of poorer depression outcomes. For instance, unemployed individuals have a 28% higher depressive symptom scale score compared to employed individuals. [2]

Unfortunately but unsurprisingly, the COVID-19 pandemic has exacerbated these disparities. During the pandemic, adults with less than a high school education, those with incomes below $25,000, and renters had significantly higher odds of serious depression compared to their higher-SES counterparts.[3] Furthermore, socioeconomic inequalities in depression were found to persist or even increase during the pandemic, particularly affecting those with lower income and educational levels.[4]

Moreover, socioeconomic factors also influence the utilization and perceived helpfulness of mental health treatments. Higher SES individuals are more likely to talk to a mental health professional and perceive the treatment as helpful.[1] However, disparities in treatment outcomes are evident, with lower SES individuals experiencing slower and less improvement in response to pharmacotherapy for major depression.[5]

Therefore, there is strong theory suggesting that socioeconomic disparities in depression are significant and multifactorial, with lower SES associated with higher prevalence, greater severity, and poorer treatment outcomes for depression. Addressing these disparities requires firstly identification of the problem then procurement of targeted interventions that consider such broader socioeconomic determinants of mental health. Employing the NHANES sample will allow for a nationwide examination of mental health variation.




## II. Objectives
The aim of the present study is to elucidate specific socioeconomic disparities in mental health by leveraging data from the NHANES 2021–2023 survey. Specifically, we will operationalize mental health problems using the Patient Health Questionnaire-9 (PHQ-9) depression scale and analyze its associations with key socioeconomic indicators such as income, education level, employment status, and other covariates.

By applying statistical modeling techniques learned in QBS 121, we aim to:

1. Quantify the relationship between SES and depression severity.
2. Visualize the role of demographic and structural factors affecting depression scores.
3. Evaluate socioeconomic influences on mental health severity through regression modeling .
4. Identify policy-relevant findings via post-hoc analyses.

## III. Methods


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

### B. **Packages and Tests Employed**
In this project, we utilized a range of packages from both R and Python to facilitate data management, statistical analysis, and visualization. In R, we employed core functions in Base R alongside packages such as dplyr for data manipulation, ggplot2 for creating static visualizations, and plotly for interactive graphics. Additional libraries like Hmisc, MASS, and gtsummary provided tools for statistical models and summary statistics. In Python, we leveraged packages like pandas for data manipulation, NumPy for numerical operations, and SciPy to conduct statistical tests. Visualization was enhanced with Matplotlib and Seaborn, while machine learning tasks were performed using sklearn for logistic regression analysis.

Our analysis employed a variety of statistical tests to investigate the relationships between socioeconomic factors and mental health outcomes. We conducted T-tests to compare mean depression scores across different income and education groups, examining the significance of these differences. A correlation analysis using Pearson’s method was performed to assess relationships between socioeconomic indicators and the PHQ-9 depression scores. We also utilized linear mixed-effects models (LMM) to account for clustering in the survey data and logistic regression to determine odds ratios for the likelihood of higher depression symptoms based on demographic and socioeconomic variables. Together, these tests provided a comprehensive understanding of the complexities underlying socioeconomic disparities in mental health.

### C. **Sample Characteristics**
  **Table 1:**
<iframe src="assets/table1.html" width=800 height=600 frameBorder=0></iframe>

## IV. Results

### A. **Correlation Matrix Heatmap**
1. Defining Key SES Indicators
- Demographics: Race/Ethnicity, Gender, Age, Birthplace, Military Service Status
- SES Factors: Education Level, Marital Status, Household Size, Income Level
- Depression Indicator: PHQ-9 Total Score
  
2. Computing Correlation Matrix 
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

<iframe src="assets/heatmap_cor.html" width="100%" height="500px"></iframe>


### B. **Exploratory Data Visualizations**
1. *Age Distribution of Depression Severity*
<iframe src="assets/age_distrib2.html" width="100%" height="500px"></iframe>

- **What is the visualization showing?**
This pyramid population plot displays the distribution of depression severity levels (low vs. high) across different age groups. The x-axis represents the percentage of individuals in each category, with negative values indicating low depression (green) and positive values representing high depression (blue).

- **Why visualize this?**
Visualizing depression distribution across age groups allows for a clearer understanding of how depression prevalence changes with age. It helps identify trends in mental health across different life stages and highlights potentially vulnerable age groups that may require targeted interventions.

- **Conclusions**

2. *3-D Scatterplot*
<iframe src="assets/cube.html" width=800 height=600 frameBorder=0></iframe>

- **What is the visualization showing?**
  
The 3D scatterplot illustrates the relationships between Income to Poverty Ratio, Age, and PHQ-9 Score, with each point representing an individual’s data in these three dimensions. The color gradient indicates varying levels of depressive symptoms, with darker colors reflecting lower scores.

- **Why visualize this?**

  Visualizing these relationships helps to identify patterns in how financial stability and age may influence mental health, allowing for a clearer understanding of the factors contributing to depressive symptoms and facilitating more targeted interventions.
  
- **Conclusions**
  
The plot suggests a negative correlation between income-to-poverty ratio and PHQ-9 scores, indicating that individuals with higher financial stability tend to report fewer depressive symptoms. Additionally, age trends appear to show that older individuals often have lower scores, highlighting the complex interplay between socioeconomic factors and mental health.



4. *Violin Plot of Gender*
<iframe src="assets/violin.html" width=800 height=600 frameBorder=0></iframe>

- **What is the visualization showing?**
The violin plot illustrates the distribution of PHQ-9 scores across different education levels, differentiated by gender. Each "violin" shape represents the density of PHQ-9 scores for males (blue) and females (red) within each education category, highlighting how scores vary between genders at each educational attainment level.

- **Why visualize this?**
Visualizing the distribution of PHQ-9 scores by education level and gender allows for a clearer comparison of mental health outcomes across diverse educational backgrounds and identifies potential gender disparities in depressive symptoms, which can inform targeted mental health interventions.

- **Conclusions**
The plot suggests that females generally report higher PHQ-9 scores than males at all education levels, indicating greater levels of depressive symptoms among women. Moreover, higher educational attainment appears to correspond to lower PHQ-9 scores for both genders, highlighting the influence of education on mental health. These findings emphasize the importance of considering both gender and education in understanding mental health outcomes.


6. *Boxplots*
- **What is the visualization showing?**
- **Why visualize this?**
- **Conclusions**


### C. **T-Test**

The selection of statistical tests for each variable in the analysis stems from the nature of the variables involved and the assumptions associated with each test. Independent t-tests were chosen for the binary categorical variable gender because this test compares the means of two groups—in this case, the average PHQ-9 total score for males and females—allowing for an assessment of the difference between these two distinct populations. For multilevel categorical variables like education_level and marital_status , ANOVA (Analysis of Variance) was employed, as this test extends the t-test methodology to compare means across more than two groups. It evaluates whether there are any statistically significant differences among the group means. For the continuous variables income_to_poverty_ratio and age_years , Pearson correlation coefficients were calculated to determine the strength and direction of the linear relationships with the PHQ-9 total score. This approach is appropriate as both predictors are continuous, enabling the assessment of how changes in these variables are associated with changes in the PHQ-9 scores. Together, these tests provide a comprehensive analysis of the potential relationships between various factors and the PHQ-9 total score, adhering to appropriate statistical methodologies based on data characteristics.

<iframe src="assets/results.html" width=800 height=600 frameBorder=0></iframe>


The results of the statistical analyses reveal significant relationships between several demographic and socioeconomic factors and mental health, as indicated by the PHQ-9 total score. The independent t-test shows a substantial difference in PHQ-9 scores between genders, suggesting that one gender—likely women, based on typical coding—reports higher levels of depressive symptoms than the other. The ANOVA results for education level and marital status both indicate strong and significant differences in PHQ-9 scores among the various groups, implying that individuals with different educational backgrounds and marital situations experience varying levels of mental health challenges, signaling the importance of these social determinants. Furthermore, the Pearson correlation analyses reveal weak negative correlations between PHQ-9 scores and both income-to-poverty ratio and age. Specifically, higher income-to-poverty ratios are associated with lower PHQ-9 scores, indicating better mental health among those with greater financial stability. Similarly, older individuals tend to have slightly lower PHQ-9 scores, suggesting that age may also play a role in mental health outcomes. Collectively, these findings emphasize the significance of both social and economic factors in influencing mental health, highlighting the need for targeted interventions in these areas.



### D. **Linear Mixed-Effects Model (LMM) with PSU as a Random Effect**
This model showcases how socioeconomic and demographic factors impact PHQ-9 scores, while accounting for PSU (Primary Sampling Unit) clustering. 

1. Why this model?
- Survey data is clustered within PSUs.
- LMM accounts for PSU variability, improving overall model accuracy. 

2. Model Summary
- Random effect (PSU variance): 0.00385 -  minimal clustering impact. 
- Residual variance: 20.59 - most variation is individual level

3. Results:
- Gender (Female): Females have higher PHQ-9 scores.
- Age: Older age is linked to lower PHQ-9 scores.
- Education: Higher education lowers PHQ-9 scores.
- Marital status: Not being married increases PHQ-9 scores.
- Income Level: Higher income lowers PHQ-9 scores. 

<iframe src="assets/lmm_table.html" width=800 height=600 frameBorder=0></iframe>
<iframe src="assets/PHQ9_Coefficients.html" width=800 height=600 frameBorder=0></iframe>

### E. **Binary Logistic Regression for PHQ-9 Depression (Median Split)**

This logistic regression model examines how socioeconomic and demographic factors influence the likelihood of having a PHQ-9 depression score above the median threshold.

1. Why this model?
- The PHQ-9 score was dichotomized at the median, allowing us to assess predictors of higher depressive symptoms.
- Logistic regression estimates the odds of being in the higher-depression category based on the factors.
- Odds ratios (OR) provide an interpretable measure of relative risk across predictor variables.

2. Model Summary
- Intercept (OR = 2.29, 95% CI: 1.69 – 3.10): The baseline odds of having a PHQ-9 score above the median.
- Gender: Women are 1.59 times more likely to have higher depression scores than men (95% CI: 1.43 – 1.76).
- Income: Individuals with a family income-to-poverty ratio of 5 or more have 28% lower odds of higher depression scores (OR = 0.722, 95% CI: 0.632 – 0.823).
- Age: Each additional year of age is associated with slightly lower odds of higher depression (OR = 0.984, 95% CI: 0.981 – 0.987).
- Education:
  - Individuals with some college or an associate’s degree have 28% lower odds of higher depression scores (OR = 0.718, 95% CI: 0.557 – 0.922).
  - College graduates or above have the lowest odds (OR = 0.631, 95% CI: 0.488 – 0.813), reinforcing the protective effect of higher education.
  - High school graduates and those with less than a high school education also had lower odds, though estimates were less precise.
- Marital Status:
  - Widowed, divorced, or separated individuals have 43% higher odds of high depression scores (OR = 1.43, 95% CI: 1.26 – 1.62).
  - Never-married individuals have 55% higher odds (OR = 1.55, 95% CI: 1.35 – 1.78), suggesting a link between marital status and depressive symptoms.

3. Conclusions
- Lower income and lower education are key predictors of higher PHQ-9 scores, aligning with prior research on socioeconomic disparities in mental health.
- Being female and not being married are significant risk factors for higher depression scores.
- Older individuals have slightly lower odds of depression, potentially due to resilience or generational differences in mental health experiences.

<iframe src="assets/Log Regression Final .html" width=800 height=600 frameBorder=0></iframe>
<iframe src="assets/ORFin.html" width=600 height=400 frameBorder=0></iframe>

### F. **Binary Logistic Regression for PHQ-9 Depression (Median Split): Race & Immigration**
This analysis expands on the previous logistic regression to explore the impact of ethnicity/race and years spent in the U.S. on depression severity. 

1. Why this model?  
- The PHQ-9 score was dichotomized at the median to assess predictors of higher depressive symptoms.  
- Logistic regression estimates the odds of being in the higher-depression category based on these factors while controlling for demographic and socioeconomic variables.
- Odds ratios (OR) provide an interpretable measure of relative risk across predictor variables.

2. Model Summary

**Ethnicity/Race:**  
- Compared to the reference group (Asian), none of the ethnicity groups (Black, Hispanic, Other, or White) showed a statistically significant association with higher PHQ-9 scores (all p > 0.05).  
- The lack of significance suggests that, when adjusting for other demographic and socioeconomic factors, ethnicity/race alone does not strongly predict higher depression scores in this sample.

**Years in the U.S.:**  
- *20 or more years in the U.S.:* This group had the highest odds of depressive symptoms (OR = 1.71, 95% CI: 0.94 – 3.14), approaching statistical significance (p = 0.08). This trend suggests that longer residency in the U.S. may be associated with a higher risk of depression.

#### 3. Conclusions  
- Ethnicity alone is not a strong predictor of depression risk when controlling for socioeconomic and demographic factors. Other studies have acknowledged how the impact of race/ethnicity was unclear in the past. However, recent studies have shown evidence for an association between race and depression. [6]
- Longer residency in the U.S. appears to be associated with a higher likelihood of depressive symptoms, with those in the country for 20+ years facing the highest risk. Previous studies have also confirmed this, calling for a focus on preventative care through "community-based" care. [7]
  
<iframe src="assets/race_logreg.html" width=800 height=600 frameBorder=0></iframe>
<iframe src="assets/immigration_logreg2.html" width=800 height=600 frameBorder=0></iframe>
<iframe src="assets/immigrantOR.html" width=800 height=600 frameBorder=0></iframe>


## V. Conclusion
This analysis highlights how a myriad of socioeconomic disparities affect mental health, particularly concerning depression. Using the NHANES dataset, our findings align with existing literature, reinforcing the idea that individuals with lower socioeconomic status (SES) experience are more likely to suffer from depression.

Income, education, and age were among the strongest predictors of depression scores, with lower income and educational attainment associated with higher depression severity. Additionally, while women and married individuals showed an association with higher PHQ_9 scores, their effects were comparatively weaker. Lastly, there was no statistically significant evidence that race, years lived in the US, and household size had an effect on depression scores. Moreover, the findings support the idea that structural factors, such as economic stability and access to education, play a crucial role in shaping mental health outcomes. Our findings emphasize the importance of considering socioeconomic factors when treating and detecting depression

Lastly, our findings indicate that race/ethnicity alone was not a significant predictor of depression severity when controlling for SES and demographic factors. However, research has shown that discrimination, cultural stigma, and barriers to mental health care may influence mental health outcomes among racial and ethnic minority groups, necessitating further investigation. [8] However, longer residency in the U.S. amongst an immigrant subpopulation was associated with a higher likelihood of depressive symptoms, particularly among individuals who had lived in the country for 20 or more years. While this trend did not reach statistical significance, it aligns with previous studies showing that acculturation stress, economic instability, and barriers to social mobility contribute to worsening mental health among long-term immigrants. [7]

These findings emphasize the need to consider structural socioeconomic inequalities when addressing depression. Economic stability, education, and healthcare access are critical determinants of mental health. Furthermore, the complex interactions between race, ethnicity, and immigration-related stressors should be examined to develop targeted interventions. Policymakers should prioritize reducing economic disparities, expanding mental health resources, and providing culturally appropriate mental health services to mitigate these disparities.

Future research should explore how social policies, community-based interventions, and mental health care accessibility influence mental health outcomes among immigrant and racial/ethnic minority populations. Addressing these issues is essential for promoting more equitable mental health care and improving long-term mental well-being across diverse communities.

## VI. Future Research
These findings emphasize the need to consider structural socioeconomic inequalities when addressing depression. Economic stability, education, and healthcare access are critical determinants of mental health. Furthermore, the complex interactions between race, ethnicity, and immigration-related stressors should be examined to develop targeted interventions. Policymakers should prioritize reducing economic disparities, expanding mental health resources, and providing culturally appropriate mental health services to mitigate these disparities.

Future research should take a multifaceted approach to understanding mental health disparities by considering intersectional effects across race, socioeconomic status, gender, age, and immigration status. Expanding longitudinal and intervention-based studies will be crucial in identifying long-term mental health trends, evaluating policy impacts, and developing effective strategies to reduce disparities in depression outcomes. Addressing these issues is essential for creating more inclusive, accessible, and culturally competent mental health care systems that benefit all populations.

## VII. References
1. Henking C, Reeves A, Chrisinger B. Global inequalities in mental health problems: understanding the predictors of lifetime prevalence, treatment utilisation and perceived helpfulness across 111 countries. Prev Med. 2023;177:107769. doi:10.1016/j.ypmed.2023.107769

2. Buckman JEJ, Saunders R, Stott J, et al. Socioeconomic Indicators of Treatment Prognosis for Adults With Depression: A Systematic Review and Individual Patient Data Meta-analysis. JAMA Psychiatry. 2022;79(5):406. doi:10.1001/jamapsychiatry.2022.0100

3. Lee H, Singh GK. Monthly trends in self-reported health status and depression by race/ethnicity and socioeconomic status during the COVID-19 Pandemic, United States, April 2020 – May 2021. Ann Epidemiol. 2021;63:52-62. doi:10.1016/j.annepidem.2021.07.014

4. Herrmann K, Beese F, Wollgast L, et al. Temporal dynamics of socioeconomic inequalities in depressive and anxiety symptoms during the COVID-19 pandemic: a scoping review. Front Public Health. 2024;12:1397392. doi:10.3389/fpubh.2024.1397392

5. Mills JA, Suresh V, Chang L, et al. Socioeconomic Predictors of Treatment Outcomes Among Adults With Major Depressive Disorder. Psychiatr Serv. 2022;73(9):965-969. doi:10.1176/appi.ps.202100559

6. Hargrove TW, Halpern CT, Gaydosh L, et al. Race/Ethnicity, Gender, and Trajectories of Depressive Symptoms Across Early- and Mid-Life Among the Add Health Cohort. J Racial Ethn Health Disparities. 2020;7(4):619-629. doi:10.1007/s40615-019-00692-8

7. Ikonte CO, Prigmore HL, Dawson AZ, Egede LE. Trends in prevalence of depression and serious psychological distress in United States immigrant and non-immigrant populations, 2010 - 2016. J Affect Disord. 2020;274:719-725. doi:10.1016/j.jad.2020.05.010

8. Wong EC, Collins RL, Cerully J, Seelam R, Roth B. Racial and Ethnic Differences in Mental Illness Stigma and Discrimination Among Californians Experiencing Mental Health Challenges. Rand Health Q. 2017;6(2):6. Published 2017 Jan 13.

