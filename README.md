# Spotify Analysis Using dbt
The project uses dbt to help translate, model, and analyze Spotify playlist data. Included in this project is a single seed file with the data to be analyzed. This project will specifically be using Google BigQuery so that anyone could create a Google BigQuery Project for free and host this project for free.

## Requirements and Tech Stack
To run this project locally you will need to install and have access to the following:
- [dbt](https://docs.getdbt.com/dbt-cli/install/overview) (dbt-bigquery)
- [Google BigQuery](https://cloud.google.com/bigquery)

## Installation
1. Clone the Github repo locally
2. Connet to your BigQuery Project
3. Run `dbt deps`
4. Run `dbt seed`
5. Run the full project for the first time with `dbt run`
6. Hook up a BI tool of your choice (I like Mode for free visualization)
