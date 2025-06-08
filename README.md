Adventure Works dbt Project
==========================

This repository contains a dbt project for exploring the Adventure Works dataset. The models query a **Microsoft SQL Server** database, and development was done using the dbt CLI extension in **Visual Studio Code**. All code lives in the `aw_project` folder using the standard dbt layout:

* `models/` – SQL models broken down into staging, intermediate and marts
* `macros/` – reusable SQL snippets and custom data tests
* `seeds/` – CSV reference data such as `AW_QUOTA.csv`
* `dbt_project.yml` – project configuration

## dbt architecture

The project follows the common **bronze → silver → gold** layering pattern:

* **Bronze (staging)** – models in `models/staging` load raw source tables and rename or type cast columns. Macros such as `date_conv` and `two_places` are used here for date formatting and rounding numeric values.
* **Silver (intermediate)** – models under `models/intermediate` transform the cleaned data. For example, `intermediate/transformations/int_adventure_works__SalesOrder.sql` joins order headers and details while deriving shipping categories, and files in `intermediate/merging` merge several staging models (e.g. `merg_DimProduct.sql`).
* **Gold (marts)** – final dimensional and fact tables in `models/marts` select from the intermediate layer. Tables like `DimCustomer.sql` or `DimFactSales.sql` form the reporting schema.

Transformations rely heavily on dbt's `ref()` function to chain models together. Seeds provide additional lookup values, and custom tests (for instance `test_email_domain` and `total_due_check`) enforce data quality.

## Development environment

The repository includes a Python virtual environment under `dbt-env` with the `dbt-sqlserver` adapter preinstalled. Using Visual Studio Code with the dbt extension, you can open the workspace and run commands directly in the integrated terminal. The project expects a working `profiles.yml` pointing to a SQL Server warehouse.

## Running the project

Make sure dbt is installed and configured for your warehouse. Typical commands:

```bash
dbt run
```
Execute all models in order.

```bash
dbt test
```
Run both generic dbt tests and the custom ones defined in `macros/tests`.

Output from these commands is written to `logs/dbt.log` for troubleshooting.
