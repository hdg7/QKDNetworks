#!/usr/bin/Rscript
#
#    Copyright (C) 2020 Hector D. Menendez <hector.david.1987@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

library(geosphere)
library(cluster)
args<-commandArgs(TRUE)
a <- read.csv2("cyl_1000.csv",sep=';',header=TRUE)
a[,2]<-as.numeric(as.matrix(a[,2]))
a[,3]<-as.numeric(as.matrix(a[,3]))
b<-a[,c(3,2)]
val<-as.numeric(args[1])
geoDistMat<-distm(b)
inDist<-as.dist(geoDistMat)
sol<-pam(inDist,val)
saveRDS(sol,paste("medoids",args[1],"rds",sep='.'))
