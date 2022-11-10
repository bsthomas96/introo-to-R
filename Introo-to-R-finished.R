# Intro to R Lesson
# Oct 28th, 2022

# Interacting with R

## I am adding 3 and 5. R is fun!
3+5

x <- 3
y <- 10
y
x + y

number <- x + y

# Try changing the value of x to 5, what happens to number?
x <- 5
# After changing the value of x to 5, number changed from 8 to 10

# Now try changing the value of variable y to contain the value 10, update the variable number also
# Changed variable y to the value of 10 and re-ran the variable number, ended up with output of 15

# START OF SECTION 1.2

# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species

# Exercise of created combined vector
combined <- c(glengths, species)

# Create a character vector and store the vector as a variable called 'expression'
expression <-c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

# Exercise for 1.2
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
# Turn sample group into a factor data structure
samplegroup <- factor(samplegroup)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
df

# Create a data frame called favorite_books with the following vectors as columns
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
favorite_books <- data.frame(titles, pages)

list1 <- list(species, df, number)
list2 <- list(species, glengths, number)

# START OF SECTION 1.3

glengths <- c(glengths, 90) # adding at the end
glengths <-c(30, glengths) # adding at the beginning
sqrt(81)
sqrt(glengths)
round(3.14159)
?round
args(round)
example("round")
round(3.14159, digits=2)
round(3.14159, 2)

# Exercise for 1.3
mean(glengths, trim=0, na.rm = FALSE)
test <-c(1, NA, 2, 3, NA, 4)
sort(glengths, decreasing = TRUE)
square_it <- function(x) {
  square <- x * x
  return(square)
}
square_it(5)
square_it <- function(x) {
  x * x
}
multiply_it <- function(x,y) {
  product <- x * y
  return(product)
}

# START OF SECTION 1.4
?read.csv
metadata <- read.csv(file="data/mouse_exp_design.txt")
# Exercise for 1.4

proj_summary <- read.table(file = "data/project-summary.txt", header = TRUE, row.names = 1)

# Use the class() function on glengths and metadata, how does the output differ between the two?
class(glengths)
class(metadata)

# Use the summary() function on the proj_summary dataframe
summary(proj_summary)

# How long is the samplegroup factor?
length(samplegroup)

# What are the dimensions of the proj_summary dataframe?
dim(proj_summary)

# When you use the rownames() function on metadata, what is the data structure of the output?
str(rownames(metadata))

# How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.
length(colnames(proj_summary))

# START OF SECTION 2.1
age <- c(15, 22, 45, 52, 73, 81)
age[5]
age[-5]
age[c(3,5,6)]
age[1:4]

# Create a vector called alphabets with the following letters
alphabets <- c(C, D, X, L, F)
# Issue here when trying to create new vector called alphabets

# Extract only those elements in samplegroup that are not KO
idx <- samplegroup != "KO"
samplegroup[idx]

# Use the samplegroup factor we created in a previous lesson, and relevel it such that KO is the first level followed by CTL and OE
factor(samplegroup, levels = c("KO", "CTL", "OE"))

# START OF SECTION 2.2
# Install the tidyverse package 
install.packages("tidyverse")
# Package installation from CRAN
install.packages("gg.plot2")

# START OF SECTION 2.3
# Extract value 'Wt'
metadata[1,1]
# Extract value '1'
metadata[1,3]
# Extract 3rd row
metadata[3, ]
# Extract 3rd column
metadata[ ,3]
# Extract third column as a data frame
metadata[ , 3, drop = FALSE] 
# Dataframe containing first two columns
metadata[ , 1:2] 
# Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 
# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 
# Check column names of metadata data frame
colnames(metadata)
# Extract the genotype column
metadata$genotype 
# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

# Exercise for 2.3
# Return the genotype and replicate column values for Sample 2 and Sample 8
metadata[c("sample2", "sample8"), c("genotype", "replicate")]

# Return the fourth and ninth values of the replicate column
metadata$replicate[c(4,9)]

# Extract the replicate column as a data frame
metadata[, "replicate", drop = FALSE]

# Subset the metadata dataframe to return only the rows of data with a genotype of KO
idx <- which(metadata$genotype=="KO")
metadata[idx, ]

# Create a list named random with the following components: metadata, age, list1, samplegroup, and number
random <- list(metadata, age, list1, samplegroup, number)

# Extract the samplegroup component
random[[4]]

# Set names for the random list you created in the last exercise
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")

# Extract the age component using the $ notation
random$age
