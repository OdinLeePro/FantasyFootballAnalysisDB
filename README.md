# FantasyFootballAnalysisDB
FantasyFootballAnalysisDB is a structured SQL database built for fantasy football analysis, featuring cleaned data from 2021–2023 NFL seasons. Includes R-based data wrangling, SQL triggers, and normalized schemas supporting advanced queries and future web app integration.

## Overview

This project began as a tool for analyzing fantasy football data with a friend. It evolved into a fully normalized SQL database with:

- Cleaned, imported player/game data
- SQL triggers to automate calculations
- Example queries for analysis
- R scripts for data preparation (via `nflverse` and `nflfastR`)
- A flexible structure for future expansion (e.g., Oracle APEX web app)

## Features

- **Normalized SQL Schema** — ~14 tables (initially), designed using Oracle Data Modeler
- **Automated Logic** — Triggers handle real-time calculations during data import
- **R Data Wrangling** — Scripts used to clean and transform raw NFL datasets
- **Query Examples** — Included for fantasy-relevant metrics
- **Expandable** — Scalable for future app development or analysis

## Project Structure

```
/FantasyFootballAnalysisDB
├── README.md
├── LICENSE
├── SQL/
│   ├── FantasyFootballFinalProject.sql
│   ├── ImportingDataFinalProject.sql
│   └── FinalProjectExampleQueries.sql
├── Data Wrangling/
│   ├── GamesData.R
│   └── [Any CSV staging files]
├── Docs/
│   ├── Final Project Final Draft.docx
│   ├── FinalProjectRationalModel.png
│   └── Final Project Proposal.docx  (optional)
```

## Data Sources

- [Kaggle NFL Data](https://www.kaggle.com/)
- [`nflverse`](https://github.com/nflverse) / `nflfastR` R packages

## Future Plans

- Add new tables and data points for deeper analysis
- Explore Oracle APEX to build a front-end app
- Incorporate projections, rankings, and historical trends

## Class Concepts Applied

- Entity-Relationship Modeling
- SQL Normalization (Primary/Foreign Keys)
- Triggers for data integrity
- R-based Data Wrangling
- Query Design and Optimization

## License

This project is licensed under the MIT License.
