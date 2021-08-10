# Dataminded Academy - Introduction to Linux & Bash
## Exercise 4 - Redirection, pipes and commands (2)

In this exercise you will have to use the pipe operator in conjonction with the `awk` command to process data in a csv file. The mlb_players.csv file contains information about players from the US Major League of Baseball. Using the awk command, we are going to analyze the content of the file without spinning up a Jupyter notebook.

The awk command offers a powerful way to parse and process data in a file. The shape of an awk query is as follows:

```
cat <input file> | awk -F<field separator>  '<query>'
```

For example:
```
cat my_file.csv | awk -F,  '{if ($4>75) {print $4/2}}'  # if the 4th field is greater than 75, print it divided by 2
---
cat my_file.csv | awk -F,  '{if ($1 ~ "Scott.*") {print $0}}' # if the 1st field meet the regex inputed, print the whole line
```


The tasks are the following:

1. Print the lines where the player's firstname is Jose
2. From the result above, print the name (field 1), team (field 2) and age (field 6) of the players
3. From the result above, keep only the players that are older than 27
4. Export the result of the query to a separated file named 'results'
5. Find out a way to count how many players are left
