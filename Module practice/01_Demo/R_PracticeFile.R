# Loading Packages ####

# Install pacman ("package manager") if need
if (!require("pacman")) install.packages("pacman")

# Load contributed packages with pacman
pacman::p_load(pacman, party, rio, tidyverse)
# pacman for loading/unloading packages
# party for decision trees
# rio for importing data
# tidyverse for so many reasons

## Load and prepare data ####

# Import csv as df from tidyverse
    (ELS_df <- read.csv("ELshort_choice.csv"))

# Import xlsx as df with rio::import() from rio
    (ELS_df_v2 <- import("Example.xlsx") %>% as_tibble())

# Import plus data prep
  df3 <- import("ELshort_choice.csv") %>%
  as_tibble() %>%
  select(Progress, Consent, Course, Find, Qual, Rel, Use)
  # Also can use mutate, rename, etc. to change things prior to loading
  


# Iris Data ####

library(help = "datasets")
?iris
iris

## Working with Iris ####



# Orange Data ####

?Orange

Orange

## Working with Orange Data ####


# UCB Admissions Data ####

?UCBAdmissions

UCBAdmissions

## Piping commands vs. nested commands ####
# Utilizing piping commands from tidyverse rather than messy nested commands 
ucbDF <- UCBAdmissions
ucbDF %>%
  margin.table(3) %>%
  prop.table %>%
  round(2) %>%
  multiply_by(100)

## Working with UCB Admissions Data ####



# HairEyeColor Data ####



HairEyeColor # view data tables

## Convert table to rows ####

# convert table to rows, save as df
df_hec <- HairEyeColor %>%   # start with tabular data
  as_tibble() %>%            # convert to tibble with rows
  uncount(n) %>%             # convert from summary values
  mutate_all(as_factor) %>%  # convert all vars to factors
  mutate_all(fct_infreq) %>% # order by descending
  print()                    # show results

## Plot with generic plot() command ####
df_hec %>%
  select(Hair) %>%
  plot()

df_hec %>%
  select(Eye) %>%
  plot()

df_hec %>%
  select(Sex) %>%
  plot()

## Use q plot for quick and simple plots ####

qplot(Hair, data = df_hec)
qplot(Eye, data = df_hec)
qplot(Sex, data = df_hec)

# Using ggplot ####
## Bar graphs ####

### One step approach ####
df_hec %>%
  ggplot() +
  geom_bar(aes(Eye))

### Two step approach ####
g <- df_hec %>% ggplot(aes(Hair))   # save what to graph as var
g + geom_bar()                      # var + how to graph it

### Add options to graph ####
g +
  geom_bar(fill = "#1D76B5") + # Color bars
  theme_minimal() +   # use plot theme
  coord_flip() +   # flip coordinates horiz
  labs(   # Add titles and labels
    title = "Hair Color",
    subtitle = "592 Statistics Students",
    caption = "(From HairEyeColor sample dataset",
    y = "Number of Students",
    x = NULL)


### Save plot ####

# Save as png
ggsave("barchart_hec.png",
  width = 12, height = 6, dpi = 300)

ggsave("barchart_hec.pdf",
       width = 12, height = 6, dpi = 300)

### Side-by-side and stacked charts
# Side-by-side
df_hec %>%
  ggplot(aes(Hair, fill = Sex)) +
  geom_bar(position =  position_dodge()) +
  theme(legend.position = "bottom")

# Stacked bar chart
df_hec %>%
  ggplot(aes(Hair, fill = Sex)) +
  geom_bar()

# 100% Stacked bar chart
df_hec %>%
  ggplot(aes(Hair, fill = Sex)) +
  geom_bar(position = "fill")

# Histograms ###################################################################

# Histogram with standard normal dist
x <- rnorm(10000)
ggplot(NULL, aes(x = x)) +
  geom_histogram(binwidth = 0.5,
                 fill = "#1D76B5",
                 color = "white") +
  xlab("z-scores") + 
  ylab("Frequency")

# Q-plot hist
qplot(Petal.Length, geom = "histogram", data = iris)

# Q-plot hist with color
qplot(Petal.Length, 
      geom = "histogram", 
      fill = Species,
      data = iris)

# Q-plot density 
qplot(Petal.Length, 
      geom = "density", 
      fill = Species,
      data = iris)

# GGPlot hist
iris %>%
  ggplot(aes(x = Petal.Length,
             fill = Species)) +
  geom_histogram() +
  theme(legend.position = "bottom")

# GGPlot density
iris %>%
  ggplot(aes(x = Petal.Length,
             fill = Species)) +
  geom_density(alpha = 0.5) + # alpha makes colors more transparent
  theme(legend.position = "bottom")

# Box plot ##################################################################

# All vars at once
iris %>% boxplot()

# One var at a time
iris %>%
  select(Petal.Length) %>%
  boxplot(horizontal = T) # flipped horizontally with horizontal = True

#One var by groups
boxplot(Petal.Length ~ Species,
        data = iris,
        horizontal = T)


# Q-plot of boxplot
qplot(Species, Petal.Length, data = iris)

# Q-plot of boxplot - Color by group
qplot(Species, 
      Petal.Length, 
      col = Species,
      data = iris)

# Q-plot of boxplot - Color by group + jittered
qplot(Species, 
      Petal.Length, 
      col = Species,
      geom = c("boxplot", "jitter"),
      data = iris)

# Q-plot of boxplot only - Color by group
qplot(Species, 
      Petal.Length, 
      col = Species,
      geom = c("boxplot"),
      data = iris)

# GGPlot - Boxplot

iris %>%
  ggplot(aes(x = Species,
             y = Petal.Length,
             fill = Species)) +
  geom_boxplot() +
  coord_flip() +
  xlab("") +
  theme(legend.position = "none")




# EL Short Data ##################################################################

# Import all as df
(ELS_df <- read.csv("ELshort_choice.csv"))

# Import plus data prep - select certain columns
ELS_2 <- import("ELshort_numeric.csv") %>%
  as_tibble() %>%
  select(RecDate,
         ResponseId,
         CONSENT,
         COURSE,
         Find,
         Find_7_TEXT,
         Qual,
         Rel,
         Use,
         Future)


l1 <- TRUE
typeof(l1)






