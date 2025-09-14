#!/bin/bash

TODO_FILE="todo.txt"
touch "$TODO_FILE"

while true; do
  echo "1) Add task  2) View tasks  3) Remove task  4) Exit"
  read -p "Choose [1-4]: " choice

  case $choice in
    1)
      read -p "New task: " task
      echo "$task" >> "$TODO_FILE"
      echo "Task added."
      ;;
    2)
      if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
      else
        nl "$TODO_FILE"
      fi
      ;;
    3)
      nl "$TODO_FILE"
      read -p "Task number to remove: " num
      sed -i "${num}d" "$TODO_FILE"
      echo "Task removed."S
      ;;
    4)
      echo "Bye!"
      exit 0
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
  echo ""
done
