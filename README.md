# Strive

Strive is a fitness and wellness platform prototype built around personal health tracking, coaching, and goal-oriented planning. The project combines a .NET WPF desktop application with a lightweight web front-end for health calculators and an SQL schema for sample fitness data.

## Overview

This repository contains a demo project for a fitness app that helps users:

- track their health and progress
- calculate BMI and calorie needs
- explore personal training and fitness plans
- manage data for members, trainers, and workout programs

The project is structured as a prototype and includes both desktop and web-facing components.

## Features

- Home and authentication screens for a fitness platform
- BMI calculator
- Calorie calculator with gender and goal-based logic
- Database schema for users, trainers, workout plans, and measurements
- Sample fitness data for members and trainers
- WPF desktop shell for the app

## Tech Stack

- C# / WPF (.NET Framework 4.8)
- HTML
- CSS
- JavaScript
- MySQL / MariaDB SQL schema

## Repository Structure

```text
Strive/
├── Strive.sln
├── Strive/
│   ├── App.xaml
│   ├── App.xaml.cs
│   ├── MainWindow.xaml
│   ├── MainWindow.xaml.cs
│   ├── App.config
│   ├── Strive.csproj
│   ├── Database/
│   │   └── strive_database.sql
│   ├── Web/
│   │   ├── CSS/
│   │   ├── HTML/
│   │   └── JS/
│   └── Properties/
└── README.md
```

## Included Modules

### Desktop App
The desktop app is a WPF project initialized in `Strive/Strive.csproj` and provides the application shell for the project.

### Web Front End
The web folder includes static pages and scripts for:

- landing page (`Strive/Web/HTML/Strive.html`)
- BMI calculator (`Strive/Web/HTML/BMI.html`)
- calorie calculator (`Strive/Web/HTML/CalorieCalculator.html`)

These pages use JavaScript logic in:

- `Strive/Web/JS/BMI.js`
- `Strive/Web/JS/CalorieCalculator.js`

### Database
The sample MySQL database schema is defined in:

- `Strive/Database/strive_database.sql`

It includes tables such as:

- `users`
- `trainers`
- `workout_plans`
- `measurements_calculations`

## Getting Started

### Prerequisites

- Visual Studio 2022 or later
- .NET Framework 4.8
- MySQL or MariaDB server

### 1. Restore and open the solution

Open `Strive.sln` in Visual Studio.

### 2. Create the database

Import the SQL file into a MariaDB/MySQL database named `strive_database`:

```bash
mysql -u your_user -p < Strive/Database/strive_database.sql
```

### 3. Run the application

Build and run the WPF project from Visual Studio.

## Usage

The project currently serves as a prototype/demo platform with functional calculator pages and a database-ready foundation for a broader fitness application.

Examples of available pages:

- landing page for the Strive brand
- login/register demo UI
- BMI calculation page
- calorie requirement calculator

## Project Status

This project is a prototype focused on UI, data modeling, and health-related functionality. It is not yet a complete production-ready fitness platform.

## Roadmap

Potential next steps include:

- backend API integration
- user authentication and authorization
- persistent database connections
- dashboards for user metrics and progress
- trainer/member management workflows
- deployment support and environment configuration

## Related Links

- Trello board: https://trello.com/b/wXBgoemi/goaldiggers

## Notes

The current codebase is a strong starting point for a fitness app concept and demonstrates a realistic structure for a health-focused product with a WPF desktop front-end and web-based calculators.
