#!/bin/bash

counter=0

while [ $counter -lt 15]; do
        let counter=counter+1
        name=$(n1 people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
        lastname=$(n1 people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')