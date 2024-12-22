# Procurement Pipeline Project

## Introduction
This repository contains the procurement and bid data pipelines. 
It is a dbt project repository and you will find the default folder structure provided by dbt.

## Explaining Key Folders and Concepts

#### Source Data
The source procurement and bid data exists in json files. 
As a first step, the json files are ingested into database tables. 
A table is created per source and data type(procurement/bid) such as bids_source1, bids_source2.
This ingestion is done manually in snowflake UI.


#### Data Model Structure
A 3 layer structure is designed for the data model, staging, intermediate and marts.

#### project/models/staging
The goal in this layer is to keep source data as raw as possible. 
JSON data in the source tables in snowflake database is unpacked to a tabular form at staging.
It is done thanks to custom macros. Filtering and cleaning operations are no applied.
The ouput of staging is two tables, one keeping the data from procurement source and one keeping the data from bid sources. 
Data contracts are enforced in both outputs.
#### project/models/intermediate
The goal of this layer is to clean and process staging models. 
The main transformation applied in intermediate is joining the staging models. 
This is done since all the use cases given in the projects requires procurement and bids together. 
Besides joining the tables, data is cleaned.
#### project/models/marts
The goal of this layer is to provide final output tables which will be used for reporting purposes. 
Two data marts are created for 2 reporting use cases. 
Data contracts are enforced in both outputs.

#### project/tests
Due to the limitations in the data contract enforcement in snowflake database, some of the column checks are added as generic tests.
#### project/macros
Custom macros are added to unpack json data exist in the source data.

## How to work in your local IDE?
1. Downlaod the project from github
2. Save the externally provided profiles.yml file in the downloaded project folder. 
3. In your local IDE, open terminal and run `pip install dbt-core dbt-snowflake`
4. Now, you are ready to run this dbt project. You can:
    - run `dbt doc generate` to create documantation files
    - run `dbt doc serve` to open created files. This command will open the documentation site in your default browser.
    - run `dbt build` to run the models and the tests. 