# reading in dataframe
df = read.csv("/Users/lukehall/Downloads/nhanes_imputed_1.csv")
df

# Load necessary package
library(Hmisc)
library(table1)

# Convert RIDRETH3 to a factor with appropriate labels
df$RIDRETH3 <- factor(df$RIDRETH3, 
                      levels = c(1, 2, 3, 4, 6, 7), 
                      labels = c("Mexican American", 
                                 "Other Hispanic", 
                                 "Non-Hispanic White", 
                                 "Non-Hispanic Black", 
                                 "Non-Hispanic Asian", 
                                 "Other Race - Including Multi-Racial"))
# Convert RIAGENDR to a factor with proper labels
df$RIAGENDR <- factor(df$RIAGENDR, 
                      levels = c(1, 2), 
                      labels = c("Male", "Female"))
# Convert DMQMILIZ to a factor with appropriate labels
df$DMQMILIZ <- factor(df$DMQMILIZ, 
                      levels = c(1, 2, 7, 9), 
                      labels = c("Yes", "No", "Refused", "Don't know"))

# Explicitly mark missing values
df$DMQMILIZ[is.na(df$DMQMILIZ)] <- "Missing"

# Convert DMDBORN4 to a factor with appropriate labels
df$DMDBORN4 <- factor(df$DMDBORN4, 
                      levels = c(1, 2, 77, 99), 
                      labels = c("Born in 50 US states or Washington, D.C.",
                                 "Others",
                                 "Refused",
                                 "Don't know"))

# Explicitly mark missing values
df$DMDBORN4[is.na(df$DMDBORN4)] <- "Missing"

# Convert DMDEDUC2 to a factor with appropriate labels
df$DMDEDUC2 <- factor(df$DMDEDUC2, 
                      levels = c(1, 2, 3, 4, 5, 7, 9), 
                      labels = c("Less than 9th grade",
                                 "9-11th grade (Includes 12th grade with no diploma)",
                                 "High school graduate/GED or equivalent",
                                 "Some college or AA degree",
                                 "College graduate or above",
                                 "Refused",
                                 "Don't know"))

# Explicitly mark missing values
df$DMDEDUC2[is.na(df$DMDEDUC2)] <- "Missing"

# Convert INDFMPIR to a factor with appropriate labels
df$INDFMPIR_Factor <- cut(df$INDFMPIR, 
                          breaks = c(-Inf, 4.99, Inf), 
                          labels = c("0 to 4.99", "5 or more"), 
                          right = FALSE)

# Explicitly mark missing values
df$INDFMPIR_Factor[is.na(df$INDFMPIR)] <- "Missing"

# Convert to a factor with specified levels for consistency
df$INDFMPIR_Factor <- factor(df$INDFMPIR_Factor, 
                             levels = c("0 to 4.99", "5 or more", "Missing"))

# Convert DMDMARTZ to a factor with appropriate labels
df$DMDMARTZ <- factor(df$DMDMARTZ, 
                      levels = c(1, 2, 3, 77, 99), 
                      labels = c("Married/Living with partner", 
                                 "Widowed/Divorced/Separated", 
                                 "Never married", 
                                 "Refused", 
                                 "Don't know"))

# Explicitly mark missing values
df$DMDMARTZ[is.na(df$DMDMARTZ)] <- "Missing"

# Convert to a factor with specified levels for consistency
df$DMDMARTZ <- factor(df$DMDMARTZ, 
                      levels = c("Married/Living with partner", 
                                 "Widowed/Divorced/Separated", 
                                 "Never married", 
                                 "Refused", 
                                 "Don't know", 
                                 "Missing"))
# Convert DMDHHSIZ to a factor with appropriate labels
df$DMDHHSIZ_Factor <- cut(df$DMDHHSIZ, 
                          breaks = c(-Inf, 2, 4, 6, Inf), 
                          labels = c("1-2", "3-4", "5-6", "7 or more"), 
                          right = TRUE) 

# Explicitly mark missing values (though missing count is 0 in this case)
df$DMDHHSIZ_Factor[is.na(df$DMDHHSIZ)] <- "Missing"

# Convert to a factor with specified levels for consistency
df$DMDHHSIZ_Factor <- factor(df$DMDHHSIZ_Factor, 
                             levels = c("1-2", "3-4", "5-6", "7 or more", "Missing"))

# Convert DPQ100 to a factor with appropriate labels (modifying in place)
df$DPQ100 <- factor(df$DPQ100, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all difficult", 
                               "Somewhat difficult", 
                               "Very difficult", 
                               "Extremely difficult", 
                               "Refused", 
                               "Don't know"))

# Explicitly mark missing values
df$DPQ100[is.na(df$DPQ100)] <- "Missing"

# Ensure factor levels include "Missing" for consistency
df$DPQ100 <- factor(df$DPQ100, 
                    levels = c("Not at all difficult", 
                               "Somewhat difficult", 
                               "Very difficult", 
                               "Extremely difficult", 
                               "Refused", 
                               "Don't know", 
                               "Missing"))

# DPQ010 - Nervous Feelings
df$DPQ010 <- factor(df$DPQ010, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ010[is.na(df$DPQ010)] <- "Missing"
df$DPQ010 <- factor(df$DPQ010, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ020 - Hopelessness
df$DPQ020 <- factor(df$DPQ020, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ020[is.na(df$DPQ020)] <- "Missing"
df$DPQ020 <- factor(df$DPQ020, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ030 - Interest Loss
df$DPQ030 <- factor(df$DPQ030, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ030[is.na(df$DPQ030)] <- "Missing"
df$DPQ030 <- factor(df$DPQ030, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ040 - Sleep Difficulties
df$DPQ040 <- factor(df$DPQ040, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ040[is.na(df$DPQ040)] <- "Missing"
df$DPQ040 <- factor(df$DPQ040, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ050 - Energy Loss
df$DPQ050 <- factor(df$DPQ050, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ050[is.na(df$DPQ050)] <- "Missing"
df$DPQ050 <- factor(df$DPQ050, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ060 - Appetite Changes
df$DPQ060 <- factor(df$DPQ060, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ060[is.na(df$DPQ060)] <- "Missing"
df$DPQ060 <- factor(df$DPQ060, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ070 - Feeling Successful
df$DPQ070 <- factor(df$DPQ070, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ070[is.na(df$DPQ070)] <- "Missing"
df$DPQ070 <- factor(df$DPQ070, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ080 - Thoughts of Better Death
df$DPQ080 <- factor(df$DPQ080, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ080[is.na(df$DPQ080)] <- "Missing"
df$DPQ080 <- factor(df$DPQ080, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

# DPQ090 - Concerns About Suicide
df$DPQ090 <- factor(df$DPQ090, 
                    levels = c(0, 1, 2, 3, 7, 9), 
                    labels = c("Not at all", 
                               "Several days", 
                               "More than half the days", 
                               "Nearly every day", 
                               "Refused", 
                               "Don't know"))
df$DPQ090[is.na(df$DPQ090)] <- "Missing"
df$DPQ090 <- factor(df$DPQ090, levels = c("Not at all", "Several days", "More than half the days", 
                                          "Nearly every day", "Refused", "Don't know", "Missing"))

#Dropping Others in the dataframe
df$RIDRETH1 <- NULL
df$RIDEXMON <- NULL
df$SDDSRVYR <- NULL
df$RIDSTATR <- NULL
df$RIDEXAGM <- NULL
df$DMDYRUSR <- NULL
df$RIDEXPRG <- NULL
df$DMDHRGND <- NULL
df$DMDHRAGZ <- NULL
df$DMDHREDZ <- NULL
df$DMDHRMAZ <- NULL
df$DMDHSEDZ <- NULL
df$WTINT2YR <- NULL
df$WTMEC2YR <- NULL
df$SDMVSTRA <- NULL
df$SDMVPSU <- NULL
df$INDFMPI <- NULL
df$INDFMPIR <- NULL
df$DMDHHSIZ <- NULL
df$SEQN <- NULL

# Assign more intuitive variable names
label(df$SEQN) <- "Participant Sequence Number"
label(df$RIDRETH3) <- "Race/Ethnicity Code"
label(df$RIAGENDR) <- "Gender Code"
label(df$RIDAGEYR) <- "Age (Years)"
label(df$DMQMILIZ) <- "Military Service Status"
label(df$DMDBORN4) <- "Birthplace Code"
label(df$DMDEDUC2) <- "Education Level"
label(df$DMDMARTZ) <- "Marital Status"
label(df$DMDHHSIZ_Factor) <- "Household Size"
label(df$INDFMPIR_Factor) <- "Income Level (Poverty Ratio)"
label(df$DPQ010) <- "Nervous Feelings*"
label(df$DPQ020) <- "Hopelessness*"
label(df$DPQ030) <- "Interest Loss*"
label(df$DPQ040) <- "Sleep Difficulties*"
label(df$DPQ050) <- "Energy Loss*"
label(df$DPQ060) <- "Appetite Changes*"
label(df$DPQ070) <- "Feeling Successful*"
label(df$DPQ080) <- "Thoughts of Better Death*"
label(df$DPQ090) <- "Concerns About Suicide*"
label(df$DPQ100) <- "Difficulty these problems have caused"
label(df$PHQ9_TOTAL) <- "Total PHQ-9 Score"

# Specify variable order
table1(~ DPQ010 + DPQ020 + DPQ030 + DPQ040 + DPQ050 + DPQ060 + DPQ070 + DPQ080 + DPQ090 + 
         DPQ100 + PHQ9_TOTAL + RIDRETH3 + RIAGENDR + RIDAGEYR + DMQMILIZ + DMDBORN4 + DMDEDUC2 + 
         DMDMARTZ + DMDHHSIZ_Factor + INDFMPIR_Factor, 
       data = df,
       footnote = "Summary of key variables; * Indicates that the question was asked, 'Over the last 2 weeks, how often have you...'",
       topclass = "Rtable1-zebra Rtable1-shade")

# Table and figure for Logistic Regression

## Load necessary library
library(gtsummary)
## Convert PHQ9_TOTAL into an ordinal factor with specified depression severity categories
df$PHQ9_CATEGORY <- cut(df$PHQ9_TOTAL, 
                        breaks = c(-Inf, 4, 9, 14, 19, 27), 
                        labels = c("Minimal", "Mild", "Moderate", "Moderately severe", "Severe"),
                        right = TRUE, 
                        ordered_result = TRUE)

library(MASS)
table(df$PHQ9_TOTAL)
median(df$PHQ9_TOTAL, na.rm = FALSE)  # Remove NA values if present
mean(df$PHQ9_TOTAL, na.rm = FALSE)  # Remove NA values if present

median_phq9 <- median(df$PHQ9_TOTAL, na.rm = TRUE)  # Get median
df$PHQ9_BINARY <- ifelse(df$PHQ9_TOTAL > median_phq9, 1, 0)  # 1 = High Depression, 0 = Low Depression

table(df$PHQ9_BINARY)  # Check distribution
## Ensure PHQ9_BINARY is a factor (good practice for logistic regression)
df$PHQ9_BINARY <- factor(df$PHQ9_BINARY, levels = c(0, 1), labels = c("Low Depression", "High Depression"))

## Fit logistic regression
BIGMOD <- glm(PHQ9_BINARY ~ RIAGENDR + INDFMPIR_Factor + RIDAGEYR + DMDEDUC2 + DMDMARTZ, 
              data = df, 
              family = binomial(link = "logit"))

## Create regression table with formatted labels
lm_table <- BIGMOD |> 
  tbl_regression(
    exponentiate = TRUE,  # Converts log-odds to odds ratios
    intercept = TRUE,  # Keep intercept in model
    label = list(
      RIAGENDR ~ "Gender",
      INDFMPIR_Factor ~ "Income-to-Poverty Ratio",
      RIDAGEYR ~ "Age (Years)",
      DMDEDUC2 ~ "Education Level",
      DMDMARTZ ~ "Marital Status"
    )
  )

## Add model statistics
lm_table |> 
  add_glance_table(
    label = list(statistic = "Wald Chi-Square"),
  )
## Figure for OR
### Define shorter names for the variables
var_labels <- c(
  "(Intercept)" = "(Intercept)",
  "RIAGENDRFemale" = "Female",
  "RIDAGEYR" = "Age",
  "INDFMPIR_Factor5 or more" = "Higher Income (PIR)",
  "DMDEDUC29-11th grade (Includes 12th grade with no diploma)" = "Some HS",
  "DMDEDUC2High school graduate/GED or equivalent" = "HS Grad",
  "DMDEDUC2Some college or AA degree" = "Some College",
  "DMDEDUC2College graduate or above" = "College Grad",
  "DMDEDUC2Don't know" = "Education Unknown",
  "DMDMARTZWidowed/Divorced/Separated" = "Widowed/Divorced",
  "DMDMARTZNever married" = "Never Married",
  "DMDMARTZDon't know" = "Marital Status Unknown",
  "DMDMARTZRefused" = "Marital Status Refused"
)

### Apply shorter names
results$Variable <- factor(results$Variable, levels = names(var_labels), labels = var_labels)

ggplot(results, aes(x = reorder(Variable, Odds_Ratio), y = Odds_Ratio)) +  
  geom_point(color = "blue", size = 4) +  # Larger points for visibility
  geom_errorbar(aes(ymin = CI_Lower, ymax = CI_Upper), width = 0.3, color = "black") +  
  geom_hline(yintercept = 1, linetype = "dashed", color = "red") +  # Reference line at OR = 1
  coord_flip() +  
  theme_bw(base_size = 14) +  # Black-and-white theme with larger text
  labs(title = "Odds Ratios for High Depression (PHQ-9)",  
       x = "Predictor Variable",  
       y = "Odds Ratio (95% CI)") +
  theme(
    panel.grid.major = element_blank(),  # Remove major gridlines
    panel.grid.minor = element_blank(),  # Remove minor gridlines
    axis.text = element_text(face = "bold"),  # Bold axis text
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16)  # Center title
  )
