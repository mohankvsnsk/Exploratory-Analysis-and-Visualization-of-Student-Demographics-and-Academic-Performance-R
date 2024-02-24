library(ggplot2)
library(ggeasy)
library(ggthemes)
library(janitor)
library(pacman)
library(tidyverse)

student <- read_csv("data.csv")

student <- clean_names(student)

head(student)

ms_df <- student |> 
  group_by(ms = marital_status) |>
  summarise(count = n())
ms_df$ martial_s = ifelse(ms_df$ms == 1, 'single',
                          ifelse(ms_df$ms == 2, 'married',
                                 ifelse(ms_df$ms == 3,'widower',
                                        ifelse(ms_df$ms == 4, 'divorced',
                                               ifelse(ms_df$ms == 5,'facto union', 
                                                      ifelse(ms_df$ms == 6, 'separated', 'NA'))))))
ms_df

bar_plot <- ggplot(ms_df, aes(x = martial_s , y = count)) +
  geom_line(stat = "Identity") +
  geom_point(size = 4)+
  labs(x = "Martial Status", y = "Number") +
  ggtitle("Count of Martial Status Types") + theme_clean() +
  easy_rotate_x_labels(angle = 80, side = c("right"), teach = FALSE)
bar_plot


#Statistics Analysis of Admission Grade

# Set the seed
set.seed(123)

sample_size <- 100

sample1 <- sample(student$age_at_enrollment, size = sample_size)
sample2 <- sample(student$age_at_enrollment, size = sample_size)
sample3 <- sample(student$age_at_enrollment, size = sample_size)

# Compute sample statistics
sample_mean1 <- mean(sample1)
sample_variance1 <- var(sample1)

sample_mean2 <- mean(sample2)
sample_variance2 <- var(sample2)

sample_mean3 <- mean(sample3)
sample_variance3 <- var(sample3)
#Complete data_age set
mean_age= mean(student$age_at_enrollment)
var_age = var(student$age_at_enrollment)

# Create a sample data_age frame
data_age <- data.frame(
  stat_means_ag = c(mean_age, sample_mean1, sample_mean2 ,sample_mean3),
  stat_var_ag = c(var_age, sample_variance1, sample_variance2, sample_variance3)
)
data_age




# Create a bar plot with different colors for means and variances
barplot(as.matrix(data_age),
        beside = TRUE,
        col = c("blue", "red"),  # Set different colors for means and variances
        main = "Means and Variances of Admission grades",
        xlab = "Comapring sample and original statitiscal values of Admission grade",
        ylab = "Value"
)
#Statistics Analysis of Age

# Set the seed
set.seed(123)

sample_size <- 100

sample1 <- sample(student$age_at_enrollment, size = sample_size)
sample2 <- sample(student$age_at_enrollment, size = sample_size)
sample3 <- sample(student$age_at_enrollment, size = sample_size)

# Compute sample statistics
sample_mean1_age <- mean(sample1)
sample_variance1_age <- var(sample1)

sample_mean2_age <- mean(sample2)
sample_variance2_age <- var(sample2)

sample_mean3_age <- mean(sample3)
sample_variance3_age <- var(sample3)
#Complete data_age set
mean_age= mean(student$age_at_enrollment)
var_age = var(student$age_at_enrollment)

# Create a sample data_age frame
data_age <- data.frame(
  stat_means_ag = c(mean_age, sample_mean1_age, sample_mean2_age,sample_mean3_age),
  stat_var_ag = c(var_age, sample_variance1_age, sample_variance2_age, sample_variance3_age)
)
data_age




# Create a bar plot with different colors for means and variances
barplot(as.matrix(data_age),
        beside = TRUE,
        col = c("blue", "red"),  # Set different colors for means and variances
        main = "Means and Variances of Age",
        xlab = "Comapring sample and original statitiscal values of Age",
        ylab = "Value"
)

# Scatter Plot of Previous and Admission Grades
# Set the seed
set.seed(123)

sample_size <- 100

sample1_pg <- sample(student$previous_qualification_grade, size = sample_size)
sample1_adg <- sample(student$admission_grade, size = sample_size)
plot(sample1_pg, main="Comparsion of Admission Grades", ylab="Admission Grades(Prev & Present)", col="red", cex=2)
points(sample1_adg, col="blue", cex=2)

# Generate the histogram data
p_gd <- hist(student$previous_qualification_grade, plot = FALSE)
ad_g <- hist(student$admission_grade, plot = FALSE)

# Set colors for the histograms
c1 <- "blue"
c2 <- "red"

# Plot the first histogram using a transparent color
plot(p_gd, col = alpha(c1, 0.5), main = "Overlayed Histograms of Grades", xlab = "Grades") 

# Add the second histogram using a different color
plot(ad_g, col = alpha(c2, 0.5), add = TRUE)

