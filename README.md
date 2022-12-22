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


***The 'Shiny' dashboard allows the user to interactively explore the data by selecting the variable to plot (either the unemployment rate or the number of unemployed persons) from a dropdown menu. When the user selects a variable, the dashboard updates the plot to show the data for that variable.***


# DS Foundation 3

In terms of the scientific method, the script follows the steps of formulating a research question, collecting and organizing data, analyzing the data, and drawing conclusions based on the results. The research question for this project might be something like "What trends can be identified in the civilian unemployment rate in the United States over time?" The data for the project is collected from the Bureau of Labor Statistics (BLS) website, and the data is cleaned, transformed, and analyzed to identify trends or patterns in the unemployment rate. The visualizations created in the script, such as the plot of the unemployment rate over time and the Shiny dashboard, allow the user to review the results of the data preparation and modeling steps and draw conclusions based on the trends or patterns identified in the data.
Regarding CRISP-DM methodology, the script covers all six phases: business understanding, data understanding, data preparation, modeling, evaluation and deployment. The project is focused on collecting and analyzing data on economic indicators, specifically the civilian unemployment rate in the United States, and the data is collected from the BLS website, which includes the unemployment rate and the number of unemployed persons for each month from January 1948 to the present. The data is cleaned and transformed by removing duplicate rows, removing irrelevant columns, handling missing data, and standardizing data formats, and no modeling is performed on the data. The evaluation phase is satisfied by the code that creates a plot of the unemployment rate over time and by the Shiny dashboard, which allows the user to interactively explore the data and review the results to identify trends or patterns and evaluate whether the project objectives have been met. The deployment phase is satisfied by the code that creates the Shiny dashboard and by the documentation file that describes the dataset and any transformations or manipulations that were performed on it. The Shiny dashboard allows the user to interactively explore the data and share the findings with others, while the documentation file helps to ensure that others can understand how the dataset was constructed and use it appropriately.
