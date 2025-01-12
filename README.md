## Introduction:
This project explores a dataset titled *"Predict students' dropout and academic success"* containing 37 variables. The analysis involves data cleaning, visualization, and statistical techniques using R programming. The study focuses on student demographics, statistics, and grade comparisons, including marital status, age statistics, and visualized grade distributions.

---

## Tasks:

### 1. Data Loading and Cleaning:
The dataset was loaded into R, cleaned, and inspected using the following steps:

```R
student <- read_csv("data.csv")
student <- clean_names(student)
head(student)
```

Key observations:
- Dataset contains 4424 rows and 37 columns.
- Columns include `marital_status`, `application_mode`, `course`, and others.
- Cleaned column names for consistency.

---

### 2. Statistical Analysis:
#### Admission Grades and Age Analysis:

- Calculated means and variances for admission grades and age.
- Generated multiple bar plots to compare sample statistics with overall values.

Example R code:

```R
barplot(as.matrix(data_age), 
  beside = TRUE, 
  col = c("blue", "red"),
  main = "Means and Variances", 
  xlab = "Samples vs Overall Statistics", 
  ylab = "Values")
```

#### Key Figures:

![image](https://github.com/user-attachments/assets/f5dd8863-0215-465e-9e4c-c13553ac0a78)

- **Figure 1:** Bar Graph for Admission Grades

![image](https://github.com/user-attachments/assets/98e5f58d-d89c-4886-b18e-17addb845059)

- **Figure 2:** Bar Graph for Age

---

### 3. Data Visualizations:

#### a. Bar Graph:
Analyzed marital status counts using `ggplot2`:

```R
bar_plot <- ggplot(ms_df, aes(x = martial_s, y = count)) +
  geom_bar(stat = "identity") +
  labs(x = "Marital Status", y = "Number") +
  ggtitle("Count of Marital Status Types") +
  theme_clean()
```

#### b. Scatter Plot:
Compared `previous_qualification_grade` and `admission_grade`:

```R
plot(sample1_pg, main="Comparison of Admission Grades", 
  ylab="Grades", col="red", cex=2)
points(sample1_adg, col="blue", cex=2)
```

#### c. Histogram:
Overlayed histograms for grades:

```R
plot(p_gd, col = alpha("blue", 0.5), main = "Overlayed Histograms", xlab = "Grades")
```

#### Key Figures:
![image](https://github.com/user-attachments/assets/760ba96c-6ce9-40e8-af0a-3ae144b6b55c)

- **Figure 3:** Bar Graph for Marital Status

![image](https://github.com/user-attachments/assets/b9293415-4128-45fe-a6cc-f1175f0c2867)

- **Figure 4:** Scatter Plot of Grades

![image](https://github.com/user-attachments/assets/234aa7c6-ae32-4630-a2ae-8b7f701a3619)

- **Figure 5:** Overlayed Histograms for Grades

---

## Conclusion:
This analysis provides insights into:
- Varying counts of marital status categories.
- Statistical summaries for admission grades and age.
- Relationships between previous and admission grades visualized through scatter plots.
- Differing grade distributions highlighted via overlayed histograms.

---

## Citations:
1. UCI Machine Learning Repository. (n.d.). [Dataset Link](https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success)
2. W3Schools - R Graphics: Scatter Plot. (n.d.). [Resource Link](https://www.w3schools.com/r/r_graph_scatterplot.asp)
3. Zach. (2021, January 25). [Nested If Else Statements in R](https://www.statology.org/nested-ifelse-in-r/). Statology.
4. Data Analytics. (2019, November 15). [Plot Two Histograms on One Chart in R](https://www.dataanalytics.org.uk/plot-two-overlapping-histograms-on-one-chart-in-r/).
