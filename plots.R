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


library(plot3D)
library("colorspace") 

a<- readRDS("components.RDS")
x<-seq(10,250,5)
y<-seq(20,100,5)
persp3D(x,y,a,phi = 20, theta = -60,col =diverge_hcl(100,c=100,l=c(70,90),power=1), ylab="Distance", xlab="Repeaters", zlab="Components",axes=TRUE,ticktype="detailed")
par(mar=c(6.1,4.1,1.1,1.1))
image2D(a,x,y,col=diverge_hcl(100,c=100,l=c(70,90),power=1),contour=TRUE,ylab="Distance", xlab="Repeaters")