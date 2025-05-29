# Project: Snowquery - R Package for Database Querying

`snowquery` is an R package I developed to simplify running SQL queries against Snowflake, Redshift, and PostgreSQL databases directly from R.

## The Motivation

I love R for data analysis. I chose Snowflake as the data warehouse for my startup. Snowflake only had a python connector. Nail: meet Hammer.

I wanted:

*   A unified package for querying databases we were using from R.
*   Abstract away the complexities and python requirements for the Snowflake connection.
*   A simple and local credential management system.

## How It Works

**For Snowflake:**

`snowquery` uses the `reticulate` package to run the official [Snowflake Python connector](https://docs.snowflake.com/en/developer-guide/python-connector/python-connector-pandas) in the background. This bypasses the need for users to manually configure ODBC drivers or deal with other R-specific Snowflake connection hurdles. The results come back as Pandas DataFrames from the Python connector which are seamlessly converted into R dataframes.

**For Redshift & PostgreSQL:**

For these databases, `snowquery` uses the standard `DBI` interface with the `RPostgres` driver, making for a normal and efficient connection method.

## Key Features

*   **Simplified Querying:** A single function, `queryDB()`, is the main entry point for executing queries.
*   **Credential Management:**
    *   The package looks for a `snowquery_creds.yaml` file in the user's home directory (`~`). This file can store connection details (account, username, password, warehouse, role, etc.) for multiple named connections.
    *   Credentials can also be passed directly to the `queryDB()` function, overriding or supplementing the YAML file.
*   **Supported Databases:** Snowflake, Redshift, and PostgreSQL.
*   **Python Dependency Management:** For Snowflake connections, it checks for a Python installation and the `snowflake-connector-python[pandas]` library, providing guidance through error messages if they are missing.
*   **Connection Timeout:** Users can specify a timeout for database connections. Kind of important if you want to run very long-running queries.

## Technical Stack

*   **R**
*   **Python** (for Snowflake via `reticulate`)
*   `snowflake-connector-python[pandas]`
*   `DBI`
*   `RPostgres`
*   `yaml` (for credential file parsing)

## Installation & Usage

The package can be installed from CRAN or the development version from GitHub:

```R
# From CRAN
install.packages("snowquery")
```

Typical usage would look like this:

```R
library(snowquery)

# Using a named connection from snowquery_creds.yaml
my_data <- queryDB("SELECT * FROM my_awesome_table", conn_name = 'my_snowflake_dwh')

# Manually passing credentials
more_data <- queryDB(
  "SELECT * FROM another_table",
  db_type = 'postgres',
  host = 'localhost',
  port = 5432,
  database = 'mydb',
  username = 'user',
  password = 'password'
)
```

## Project Links & Status

*   **Status:** Active and available on CRAN.
*   **CRAN:** <a href="https://cran.r-project.org/package=snowquery" target="_blank" rel="noopener noreferrer">https://cran.r-project.org/package=snowquery</a>
*   **GitHub Repository:** <a href="https://github.com/mermelstein/snowquery" target="_blank" rel="noopener noreferrer">https://github.com/mermelstein/snowquery</a>
*   **Package Website:** <a href="https://snowquery.org" target="_blank" rel="noopener noreferrer">https://snowquery.org</a>