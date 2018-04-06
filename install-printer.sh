#!/bin/bash

url="http://134.226.101.24/ValidationHandlers/AccounterHandler.ashx?username=$1&password=$2"
name="TCD_Mobile"
drvPath="drv:///hpcups.drv/hp-color_laserjet_cm6040_mfp.ppd"
ppdPath="hp-color_laserjet_cm6040_mfp.ppd"
printPrefix="http://134.226.101.24/ipp/TCD_Mobile"
printerArgs="job-sheets=none -o media=iso_a4_210x297mm -o sides=one-sided"

response=$(curl -s $url)

if [[ -z $response ]]
then
  echo "Invalid username/PIN."
  exit
else
  if [[ -z $(command -v lpadmin) ]]
  then
    echo "CUPS is not installed. Please install CUPS to add printers."
  else
    IFS=':' read -r -a array <<< "$response"
    lpadmin -p $name -m $drvPath -v $printPrefix/${array[0]}/${array[1]} -o $printerArgs -E

		rc=$?;
		if [[ $rc != 0 ]]
		then
			lpadmin -p $name -P $ppdPath -v $printPrefix/${array[0]}/${array[1]} -o $printerArgs -E

			rc=$?
			if [[ $rc != 0 ]]
			then
				echo "Cannot install printer configuration due to unknown error."
				exit 1
			fi
		fi

    echo "TCD_Mobile printer installation completed."
  fi
fi
