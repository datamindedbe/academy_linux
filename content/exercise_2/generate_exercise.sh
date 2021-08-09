#!/bin/bash
echo "Generating structured folders..."

mkdir structured_area
mkdir landing_area

mkdir structured_area/BACKUP
mkdir structured_area/BACKUP/mysql_bkp
mkdir structured_area/BACKUP/parquet

mkdir structured_area/file
mkdir structured_area/file/A
mkdir structured_area/file/B
mkdir structured_area/file/C

mkdir structured_area/timeseries
mkdir structured_area/timeseries/before_2020
mkdir structured_area/timeseries/before_2020/months_1_to_6
mkdir structured_area/timeseries/before_2020/months_7_to_12

mkdir structured_area/timeseries/2020_and_after
mkdir structured_area/timeseries/2020_and_after/even_months
mkdir structured_area/timeseries/2020_and_after/odd_months

mkdir structured_area/other

echo "Generating random files with pattern..."

generate_backup_files () {
    number_of_files=$1
    random_name_length=$2
    extension_to_use=$3
    for ((i=0; i<$number_of_files; i++)); do
        random_part=$(uuidgen | tr -d '-' | cut -c 1-$random_name_length)
        touch landing_area/BACKUP_$random_part.$extension_to_use
    done
}

generate_backup_files 4 6 "mysql"
generate_backup_files 5 15 "bkp"
generate_backup_files 10 32 "parquet"

generate_file_files () {
    number_of_files=$1
    random_name_length=$2
    letter_to_freeze=$3
    for ((i=0; i<$number_of_files; i++)); do
        random_part=$(uuidgen | tr -d '-' | cut -c 1-$random_name_length)
        touch landing_area/file_${letter_to_freeze}${random_part}
    done
}

generate_file_files 10 7 "A"
generate_file_files 7 12 "B"
generate_file_files 21 10 "C"

generate_timeseries_files () {
    number_of_files_per_month=$1
    random_name_length=$2
    year=$3
    extension=$4
    for ((month=1; month<13; month++)); do
        for ((i=0; i<$number_of_files_per_month; i++)); do
            random_part=$(uuidgen | tr -d '-' | cut -c 1-$random_name_length)
            touch landing_area/${year}_${month}_${random_part}.${extension}
        done
    done
}

generate_timeseries_files 1 5 "2019" "avro"
generate_timeseries_files 1 5 "2018" "avro"
generate_timeseries_files 1 6 "2020" "avro"

generate_other_files () {
    number_of_files=$1
    random_name_length=$2
    for ((i=0; i<$number_of_files; i++)); do
        random_part=$(uuidgen | tr -d '-' | cut -c 1-$random_name_length)
        touch landing_area/$random_part
    done
}

generate_other_files 5 5