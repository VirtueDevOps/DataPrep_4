# install and load necessary packages
install.packages("rvest")
library(rvest)
install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
install.packages("shiny")
library(shiny)

# define a function to scrape data from a web page
scrape_data <- function(url) {
  # read the web page
  page <- read_html(url)
  
  # use html_nodes to select the data table on the page
  data_table <- html_nodes(page, "table")
  
  # use html_table to extract the data from the table as a data frame
  df <- html_table(data_table)[[1]]
  
  return(df)
}

# define the URL for the web page with the data we want to scrape
url <- "https://www.bls.gov/charts/employment-situation/civilian-unemployment-rate.htm"

# scrape the data from the web page
unemployment_data <- scrape_data(url)

# remove duplicate rows
unemployment_data <- unique(unemployment_data)

# remove irrelevant columns
unemployment_data <- select(unemployment_data, -X1, -X2, -X3)

# handle missing data
unemployment_data <- na.omit(unemployment_data)

# standardize data formats
unemployment_data <- mutate(unemployment_data,
                            Date = as.Date(Date, "%b-%y"))

# write the data to a CSV file
write_csv(unemployment_data, "unemployment_data.csv")

# create a documentation file to describe the dataset and any transformations or manipulations that were performed on it
documentation <- "This dataset contains data on the civilian unemployment rate in the United States, as reported by the Bureau of Labor Statistics (BLS). The data includes the unemployment rate and the number of unemployed persons for each month from January 1948 to the present.

The data was collected by scraping the BLS website (https://www.bls.gov/charts/employment-
# create a documentation file to describe the dataset and any transformations or manipulations that were performed on it
documentation <- "This dataset contains data on the civilian unemployment rate in the United States, as reported by the Bureau of Labor Statistics (BLS). The data includes the unemployment rate and the number of unemployed persons for each month from January 1948 to the present.

The data was collected by scraping the BLS website (https://www.bls.gov/charts/employment-situation/civilian-unemployment-rate.htm). The following steps were taken to clean and transform the data:

- Duplicate rows were removed.
- Irrelevant columns were removed.
- Missing data was handled by removing rows with missing values.
- The data format was standardized by converting the 'Date' column to a date format.

No aggregation or summarization was performed on the data. The resulting dataset is stored in a CSV file (unemployment_data.csv) for easy access and analysis."

# write the documentation to a file
write(documentation, "unemployment_data_documentation.txt")

# create a plot of the unemployment rate over time
ggplot(unemployment_data, aes(x = Date, y = Unemployment_rate)) +
  geom_line() +
  labs(title = "Unemployment rate in the United States",
       x = "Date", y = "Unemployment rate (%)")

# create a Shiny dashboard to interactively explore the data
shinyApp(
  ui = fluidPage(
    titlePanel("Unemployment rate in the United States"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variable", "Variable:",
                    c("Unemployment rate" = "Unemployment_rate",
                      "Number of unemployed persons" = "Number_of_unemployed_persons"))
      ),
      mainPanel(
        plotOutput("plot")
      )
    )
  ),
  server = function(input, output) {
  output$plot <- renderPlot({
    ggplot(unemployment_data, aes_string(x = "Date", y = input$variable)) +
      geom_line() +
      labs(title = "Unemployment rate in the United States",
           x = "Date", y = input$variable)
  })
}
)

