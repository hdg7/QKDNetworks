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
library(igraph)

distVector <- function (distanceMax)
{
    a <- read.csv2("cyl_1000.csv",sep=';',header=TRUE)
    a[,2]<-as.numeric(as.matrix(a[,2]))
    a[,3]<-as.numeric(as.matrix(a[,3]))
    b<-a[,c(3,2)]
    geoDistMat<-distm(b)
    y<-seq(10,250,5)
    finalVec={}
    for(elem in y)
    {
        medoid<-readRDS(paste("medoids",elem,"rds",sep="."))
        if(sum(medoid$clusinfo[,2]>distanceMax)>0)
            print("Distances within the cluster not satisfied")
        geoMeds<-geoDistMat[medoid$id.med,medoid$id.med]
        geoMeds[geoMeds>distanceMax]<-0
        geoMeds[geoMeds!=0]<-1
        g<-graph_from_adjacency_matrix(geoMeds)
        compNum<-components(g)$no                
        print(compNum)
        finalVec=c(finalVec,compNum)
    }
    return(finalVec)
}


compMat <- distVector(20*1000)
for (dist in seq(25,100,5))
{
    compMat<- cbind(compMat,distVector(dist*1000))
}
saveRDS(compMat,"components.RDS") 
