# QKDNetworks
An algorithm to select repeaters for QKD Networks

## File list

* cyl_1000.csv: original data of Castilla y Leon municipalities
* components.RDS: final dataset extracted from the paper results.
* medoids.R: Part of the algorithm that finds the repeaters positions for a given number of repeaters
* components.R: Part of the algorithm that verifies the repeaters and generates the networks for multiple number of repeater.
* plots.R: Script to plot the solutions.
* allmedoids.bash: Script to generate all the medoids files needed for components.R

## Using the software

To run the software you just need to use:
```
$> allmedoids.bash
$> Rscript components.R
```

The first part generates all the medoids files. The second generates the a components.RDS file. You can plot the final results based on this last file.

## Ploting the results

Once you have the components.RDS file, you can print the plots. Two plots will be generated, one in 3D comparing, distances, repeaters and components, and one in 2D comparing distances and repeaters.

```
$> Rscript plot.R
```
The script will show the following images in the misc folder:

![alt tag](https://github.com/hdg7/QKDNetworks/raw/master/misc/contComponents.png)
![alt tag](https://github.com/hdg7/QKDNetworks/raw/master/misc/persComponents.png)
