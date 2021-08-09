# Dataminded Academy - Introduction to Linux & Bash
## Exercises Repository

This repository is hosting the exercises provided to students in the context of the `Introduction to Linux & Bash` course of the Dataminded Academy.

### 1. The exercises in details

The following exercises are part of the repository:

* **Exercise 1 (`exercise_1`) - Learn to move around**: In this exercise, students are asked to:
    * Run the `source messthisthingup.sh` script. The latter will customize the $PS1 variable to hide all the information of the terminal and bring students somewhere random in the system.
    * Determine where they currently are.
    * Say how many files are there. What are they? (`ls -1 | wc -l`)
    * Run `ls -la`. What are those information about?
    * Find their way back to the folder where they ran the first script to run the `source imback.sh` script.

* **Exercise 2 (`exercise_2`) - Files manipulation & globbing**: In this exercise, students are asked to:
    * Use the `tree` command to visualize the whole file structure.
    * Separate the files that are in the `file_dump` folder (TODO: generate way more random files with a random generator) to respect the other folders patterns (using mv and globbing) 

* **Exercise 3 (`exercise_3`) - Redirection, pipes and commands (1)**: In this exercise, students are asked to:
    * Run the `ls –al /bin` which will return all the programs in the image binaries folder.
    * Use the `head` and `tail` commands in coordination with the piping operation to retrieve the 10th result starting from the top and the 10th result starting from the bottom.
    * Write the two results to the same file `output.log` by using redirection and concatenation operators

* **Exercise 4 (`exercise_4`) - Redirection, pipes and commands (2)**: In this exercise, students are asked to:
    * Use the awk command to process the content of a .csv file:
        * Answer different questions that make student play with awk, piping (and Google :p)
        * Final query is something like : `cat mlb_players.csv | awk -F,  '{if (($6 > 27) && ($0 ~ "Jose.*")) {print $1 $2 $6}}' | wc -l`

* **Exercise 5 (`exercise_5`) - Redirection, pipes and commands (3)**: In this exercise, students are asked to:
    * Use `jq` to query a specific heavily-nested JSON file from the Github API

* **Exercise 6 (`exercise_6`) - Permissions**: In this exercise, students are asked to:
    * Check the content of the `the_locked_file` file which is only accessible by root.
    * Modify the file permissions with `chown` and `chmod` to:
        * Be able to read the file content
        * Match a given access pattern:
            * THE user should have read, write and execution permissions. 
            * Owning group should have read and execution only. 
            * Others should have read permission only.


* **Exercise 7 (`exercise_7`) - Bash scriptingr**: In this exercise, students are asked to:
    * TBD

### 2. How-to run 

First, you need to build the Docker image of the exercise environment (powered by TTYD) with:
```
docker build -t linux-introduction-training:latest .
```

Then, you can run a specific number of environments with the command below. The script will ask you at which port it must starts to spin-up the environments as well as how many environments should be created: 
```
./spawn_the_envs.sh
```

Once done, you can clean-up the stage with:
```
./kill_the_envs.sh
```