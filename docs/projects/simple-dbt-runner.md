# Project: Simple dbt Runner - Self-Host dbt with GitHub Actions

The "Simple dbt Runner" is an open-source project I spearheaded to provide a cost-effective and flexible alternative for running dbt (data build tool) in production. This was a response to changes in dbt Cloud's pricing, which for my organization and many others would have resulted in cost increases of many multiples. The basics of the price change were from a cost per seat to usage costs based on time of each DAG run.

The primary function of dbt Cloud at the time was just scheduling. There were a couple other features but nothing major, and we were happy to pay a small monthly fee to not have to think about it. the moment it became a real cost center we decided to cut it.

## Our Solution: Open-Source dbt Runners

The Github repo offers a suite of pre-configured GitHub Actions workflows that allow teams to manage their dbt runs, CI/CD processes, and documentation hosting directly within the GitHub ecosystem. For most teams it would probably run in the free tier (Github Actions charges by runtime but the free tier threshold is reasonable).

Key capabilities include:

*   **Scheduled Production Runs:** Execute dbt jobs on a cron schedule.
*   **Merge-Triggered Runs:**
    *   **Full Runs:** Execute all dbt models after a PR is merged to the main branch.
    *   **State-Aware Incremental Runs:** Intelligently run only modified models and their downstream dependencies, using a `manifest.json` stored in a `gh-pages` branch for state comparison.
*   **Continuous Integration (CI):** Run dbt builds and tests on every commit to a pull request to ensure changes are valid before merging.
*   **dbt Documentation Hosting:** Automatically generate and deploy dbt documentation to GitHub Pages, also utilizing the `gh-pages` branch. We started off with the assumption that users would want to host documentation privately and we selected AWS S3, but decided it was an additional complexity for this project. Large enough companies have Github Enterprise and are able to host documentation privately via Github Pages.

## How It Works

The core idea is to provide a "plug-and-play" setup:

1.  **Fork & Configure:** Teams fork the repository and place their dbt project into a designated folder.
2.  **Secrets Management:** Database credentials and a GitHub Personal Access Token (for workflow permissions) are stored as GitHub Actions secrets.
3.  **Automated Setup:** A "Project Setup" workflow assists in configuring `profiles.yml` and `requirements.txt` for the target database.
4.  **Workflow Customization:** Users can select, modify, or delete the provided GitHub Action workflow files (`.yml`) to suit their specific needs.

The state-aware incremental runs are a key feature, minimizing computation by only processing what's changed. This is achieved by comparing the current dbt project state against the `manifest.json` from the previous successful production run.

## Impact and Goals

*   Reduced dbt costs at my organization by over 95% compared to dbt Cloud.
*   Provided a robust, free, and open-source alternative to paid dbt orchestration services.
*   Gave data teams full control over their dbt deployment environment and schedule.
*   Simplified the process of setting up CI/CD for dbt projects.

## Technical Stack

*   **dbt (data build tool)**
*   **GitHub Actions** (for orchestration and CI/CD)
*   **Python** (for dbt execution and utility scripts)
*   **YAML** (for GitHub Actions workflow definitions)
*   **Shell scripting** (for helper utilities)

## Project Links & Status

*   **Status:** Active, open-source.
*   **GitHub Repository:** [C00ldudeNoonan/simple-dbt-runner](https://github.com/C00ldudeNoonan/simple-dbt-runner)