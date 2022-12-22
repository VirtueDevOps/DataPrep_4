# DataPrep_4

This script is designed to collect, clean, transform, and build a usable dataset with information on economic indicators, specifically the civilian unemployment rate in the United States. The script performs the following tasks:

-Install and load necessary packages: The script starts by installing and loading the rvest and tidyverse packages. These packages provide functions for web scraping and data manipulation, respectively.

-Define a function to scrape data from a web page: The script defines a function called scrape_data that takes a URL as input and returns a data frame with the data from the web page at that URL. The function uses the read_html and html_nodes functions from the rvest package to read the web page and select the data table on the page, respectively. It then uses the html_table function to extract the data from the table as a data frame.

-Define the URL for the web page with the data: The script defines a variable called url that contains the URL for the web page with the data we want to scrape. In this case, the URL points to a page on the Bureau of Labor Statistics (BLS) website with data on the civilian unemployment rate.

-Scrape the data from the web page: The script uses the scrape_data function to scrape the data from the web page and store it in a data frame called unemployment_data.

-Remove duplicate rows: The script uses the unique function to remove duplicate rows from the data frame.

-Remove irrelevant columns: The script uses the select function from the tidyverse package to remove irrelevant columns from the data frame.

-Handle missing data: The script uses the na.omit function to remove rows with missing values from the data frame.

-Standardize data formats: The script uses the mutate and as.Date functions to standardize the data format by converting the Date column to a date format.

-Aggregate and summarize the data (if needed): In this case, we don't need to do any aggregation or summarization, so the script skips this step.

-Store the data in a format that can be easily accessed and analyzed by others: The script uses the write_csv function to write the data to a CSV file called unemployment_data.csv.

-Create a documentation file: The script creates a documentation file called unemployment_data_documentation.txt that describes the dataset and any transformations or manipulations that were performed on it. The documentation file includes information on the source of the data, the steps taken to clean and transform the data, and any aggregation or summarization that was performed.
