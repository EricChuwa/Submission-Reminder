# SUBMISSION REMINDER APPLICATION
## Overview
The Submissions Reminder Application is a simple shell-script project that simply sets up a directory structure and a few basic functionality to help remind students of their pending submissions

The application helps automate:
- Creating the required folder structure.
- Populating required files with initial content.
- Setting up environment configurations
- Launching the reminder script

## Project Structure

```
Submission-Reminder/
├── copilot_shell_script.sh
├── create_environment.sh
├── README.md
└── submission_reminder_<userName>/
    ├── app/
    │   └── reminder.sh
    ├── assets/
    │   └── submissions.txt
    ├── config/
    │   └── config.env
    ├── modules/
    │   └── functions.sh
    └── startup.sh
```

Description of key files:

- app/reminder.sh – Main script to send reminders for pending submissions.

- modules/functions.sh – Contains reusable functions for the app.

- submissions.txt – Stores the list of pending submissions.

- config/config.env – Environment variables configuration.

- startup.sh – Startup script to launch the application.

- assets/ – Directory for any supporting files or resources.

## Setup Instruction
### 1. Run the "create_environment.sh"
Go into the "Submission_Reminder" directory and run the following command. 

bash create_environment.sh

This will:

- Create the submission_reminder_<username> folder.

- Generate the required subdirectories and files.

- Make the main scripts executable.

### 2. Configure Environment
