#!/bin/bash
# all_tasks.sh
# A compilation of Bash scripting practice tasks
set -euo pipefail

############################################
# Task 1: Hello World
############################################
hello_world() {
    echo "=== Task 1: Hello World ==="
    echo "Hello World"
    echo
}

############################################
# Task 2: Variables Demo
############################################
variables_demo() {
    echo "=== Task 2: Variables Demo ==="
    Name="Saket"
    Role="DevOps Learner"
    echo "Name: $Name, Role: $Role"
    echo
}

############################################
# Task 3: Strict Mode Demo
############################################
strict_demo() {
    echo "=== Task 3: Strict Mode Demo ==="
    echo "Trying undefined variable (set -u)..."
    # Uncomment to see failure
    # echo $UNDEFINED_VAR

    echo "Trying failing command (set -e)..."
    # Uncomment to see failure
    # false

    echo "Trying failing pipeline (set -o pipefail)..."
    # Uncomment to see failure
    # ls /nonexistent | grep something
    echo
}

############################################
# Task 4: Local vs Global Variables
############################################
local_demo() {
    echo "=== Task 4: Local vs Global Variables ==="

    local_function() {
        local msg="Hello from local"
        echo "Inside local_function: msg = $msg"
    }

    global_function() {
        msg="Hello from global"
        echo "Inside global_function: msg = $msg"
    }

    local_function
    echo "Outside after local_function: msg = ${msg:-<undefined>}"

    global_function
    echo "Outside after global_function: msg = $msg"
    echo
}

############################################
# Task 5: System Info Reporter
############################################
system_info() {
    echo "=== Task 5: System Info Reporter ==="

    print_system_info() {
        echo "--- System Information ---"
        echo "Hostname: $(hostname)"
        uname -a
        echo
    }

    print_uptime() {
        echo "--- Uptime ---"
        uptime -p
        echo
    }

    print_disk_usage() {
        echo "--- Disk Usage (Top 5) ---"
        df -h | head -n 1
        df -h | sort -k3 -h | tail -n 5
        echo
    }

    print_memory_usage() {
        echo "--- Memory Usage ---"
        free -h
        echo
    }

    print_top_cpu_processes() {
        echo "--- Top 5 CPU Processes ---"
        ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
        echo
    }

    print_system_info
    print_uptime
    print_disk_usage
    print_memory_usage
    print_top_cpu_processes
}

############################################
# Main Runner
############################################
main() {
    hello_world
    variables_demo
    strict_demo
    local_demo
    system_info
}

main

