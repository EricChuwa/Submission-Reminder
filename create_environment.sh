#!/bin/bash

read -p "Enter first Name: "  usrName #Reading User name and saving into the usrName variable.
export usrHome="submission_reminder_$usrName"

mkdir -p $usrHome/{app,modules,assets,config} #creating the directory

# File creation
touch $usrHome/app/reminder.sh
touch $usrHome/modules/functions.sh
touch $usrHome/assets/submissions.txt
touch $usrHome/config/config.env
touch $usrHome/startup.sh

# Writing Reminder.sh

cat <<EOF > "$usrHome/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source $usrHome/config/config.env
source $usrHome/modules/functions.sh

# Path to the submissions file
submissions_file="$usrHome/assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOF

# Writing functions.sh
cat <<EOF > "$usrHome/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "\$student" | xargs)
        assignment=$(echo "\$assignment" | xargs)
        status=$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOF

# Writing Config.env
cat <<EOF > "$usrHome/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Writing submissions.txt
cat <<EOF > "$usrHome/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Raphael, Shell Init, submitted
Edwin, Shell Loops, not submitted
Nonie, Shell Basics, submitted
Samantha, Git, not submitted
Jeremiah, Shell Navigation, not submitted
EOF

# Writing startup.sh
chmod u+x $usrHome/startup.sh
cat <<EOF > "$usrHome/startup.sh"
chmod u+x $usrHome/app/reminder.sh
./$usrHome/app/reminder.sh
EOF

# Updating permisions of all files with .sh extension
find $usrHome -name "*.sh" -exec chmod u+x {} \;