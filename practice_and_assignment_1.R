# VECTOR

vector <- c(1, 2, 3, 4, 5, 6, 7)
vector

#Array

v <- c(1,2,3,4,5)
v2 <- c(5,6,7,8)
rows.names <-  c("Row1", "Row2")
column.names <- c("Col1", "Col2")
arr <- array(c(v,v2), dim = c(2,2), dimnames = list(rows.names, column.names))
arr
# Matrix
data <- c("Mohsin", "Ali", "Qasim", "Ali", "Malik", "Ali", "Raza", "Sadaqat", "Narmeen", 'Hasan', "Malik", "Usman")

matrix1 <- matrix(data, nrow = 3, ncol = 4)
matrix2 <- matrix(data, nrow = 3, ncol =4)

col_names = c("Col1", "col2", "col3", "col4")
row_names = c("row1", "rows2", "row3")

dimnames(matrix1) <- list(c("row1","row2","row3"), c("col1", "col2","col3","col4"))

matrix1

cbind(matrix1,matrix2)  # Column bind
rbind(matrix1,matrix2)  #row bind


#Factors

weather <- factor(c("Cold" , "Hot", "Humid", "Cool"))
weather
table(weather)

weather_with_levels <- factor(c("yes", "no", "no", "yes"), levels = c("yes", "no"))
weather_with_levels

#Missing values

list1 <- list("a", 1, "yes", NA, NaN)
is.na(list1)


# DataFrame

name_list <- c("Mohsin", "Ali", "Malik")
edu_list <- c("CS", "SE", "BBA")
id_list <- c(22355, 22366,22377)
dataframe1 <- data.frame(name_list, edu_list, id_list)

names(dataframe1) <- c("Name","Education", "ID")
row.names(dataframe1) <- c("A", "B", "C")
row.names(dataframe1) 

dataframe1
attributes(dataframe1)

#Reading Data

df<-read.csv("hw_data.csv")
head(df,5)

#Subsetting
x <- c("A", "B", "C")
x[2]
x[1:3]
x[c(1,3)]

#Functions

fun <- function(x,y)
{
  
  x+y
  
  
}
fun(3,4)

above10 <- function(x,n)
{
  number <- x > n
  x[number]
  
}

above10(5,3)

fact <- function (n){
if(n <= 1)
{
  return(1)
}
  else
  return(n * fact(n-1))
}
fact(3)

columnmean <- function(y){
  column_length <- ncol(y)
  mean_vector <- numeric(column_length)
  for(i in 1:column_length){
    mean_vector[i] <- mean(y[,i])                  # this wil calulate the mean of each column in dataframe/matrix and store it in vector/array
    
  }
  mean_vector
}


list_1 <- c(1, 2, 4,5)
list_2 <- c(1.2, 4.5, 3.3, 1.22)
list_3 <- c(10,20,30,40)                              #created datalist to pass it to the function above
data <- data.frame(list_1, list_2, list_3)
data

columnmean(data)

#Dates and Times
x <- Sys.time()
p <- as.POSIXlt(x)
names(unclass(p))

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}


# Assignment 1
pollutantmean <- function(dir, pollutant, id = 1:332){
  
  pollutantdata <- list.files(path = dir, pattern = ".csv", full.names = TRUE)
  
  to_store_mean = numeric()
  
  for (i in id){
    data <- read.csv(pollutantdata[i])
    to_store_mean <- c(to_store_mean, data[[pollutant]])
    
  }
  
  mean(to_store_mean, na.rm = TRUE)
}


pollutantmean("C:/Users/Mohsin Ali/Documents/R/specdata", "sulfate")

#Part2

complete <- function(dir, id = 1:322){

  datafiles <- list.files(path = dir, pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  
  for (i in id){
    
    data <- sum(complete.cases(read.csv(datafiles[i])))
    nobs <- c(nobs,data)
  
    
  }
  
  data.frame(id,nobs)
        
}


  
