\name{mcheatmaps}
\alias{mcheatmaps}
\title{
Multiple matrices heatmap visualization
}
\description{
mcheatmaps serves to visualize multiple different symmetric matrices and matrix clusters in a single figure using a dendogram, two half heatmaps and various color labels.
}
\usage{
mcheatmaps(matA = NULL, matB = NULL, matC = NULL, pdfname = "a", flabels = NULL,
aliases = NULL, datapts = TRUE, hminB = NULL, hmaxB = NULL, hminC = NULL, hmaxC = NULL,
ncolors = 10, legA = "", legB = "", legC = "", switchcls = FALSE, cmet = NULL,
ccol = NULL, cellines = FALSE, Bwhole = FALSE, Cwhole = FALSE, diag = NULL,
inverseColorScaleB = 0, inverseColorScaleC = 0)
}
\arguments{
  \item{matA}{
Symetric matrix used to create the dendrogram and order the data. This matrix needs to be a distance matrix to create the correct dendrogram. The column and row names must be the same between all three matrices. Order of columns and row must also be the same.
}
  \item{matB}{
Symetric matrix used to create the bottom half of the heatmap. If matC is not used, a complete heatmap will be created from matB. The column and row names must be the same between all three matrices. Order of columns and row must also be the same.
}
  \item{matC}{
Symetric matrix used to create the top half of the heatmap. If matB is not used, a complete heatmap will be created from matC. The column and row names must be the same between all three matrices. Order of columns and row must also be the same.
}
  \item{pdfname}{
Name of the image you want to create without extensions, can include path. Default ("a").
}
  \item{flabels}{
Matrix of the same length as the matrices and of n rows. n being the number of supplementary information you want to add to the matrix. Each row corresponds to a row of colored labels between the dendogram and the heatmaps. Data in this matrix can be text or numbers and a color will be assigned to each different information. Columns must be in the same order as those in the matrices, row names should be a short name giving information on the annotation. Using this argument will create a second image called pdfname_labels.pdf containing the correspondances between color labels and information.
}
  \item{aliases}{
A two column matrix with n rows. Same n as for flabels. The first column is the short name used in flabels while the second is a longer name for the same row. Rows must be in the same order as the flabels matrix.
}
  \item{datapts}{
Set to false if the data values should not be printed in the heatmaps. (Default TRUE)
}
  \item{hminB}{
sets the minimal value of the heatscale of matB
}
  \item{hmaxB}{
sets the maximal value of the heatscale of matB
}
  \item{hminC}{
sets the minimal value of the heatscale of matC
}
  \item{hmaxC}{
sets the maximal value of the heatscale of matC
}
  \item{ncolors}{
Number of colors you want in the heatscales. (Default 10)
}
  \item{legA}{
Title associated with matA
}
  \item{legB}{
Title associated with matB
}
  \item{legC}{
Title associated with matC
}
  \item{switchcls}{
Switches the top and bottom heatscale colors
}
  \item{cmet}{
list of methods you want to use to calculate the dendogram. It uses the one that gives the best correlation. (By default it uses c('ward','single','complete','average','mcquitty'))
}
  \item{ccol}{
Is a vector and it's length must be equal to the number of different colors necessary to show flabels. It must contain a list of colors in a format recognizable by R.
}
  \item{cellines}{
Set to true if the cells of the heatmap should be outlined (Default FALSE)
}
  \item{Bwhole}{
Set to true if all values from matB should be printed as whole numbers (Default FALSE)
}
  \item{Cwhole}{
Set to true if all values from matC should be printed as whole numbers (Default FALSE)
}
  \item{diag}{
Vector containing the elements to be printed in the diagonal between the heatmaps
}
  \item{inverseColorScaleB}{
Set to true to inverse the order of the heatscale of matB.
}
  \item{inverseColorScaleC}{
Set to true to inverse the order of the heatscale of matC.
}
}
\author{
Thierry Chenard \email{thierry.chenard@usherbrooke.ca}, Rafael Najmanovich \email{rafael.najmanovich@usherbrooke.ca}
}

\examples{
library(mcheatmaps)
mpg=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(mpg)=rownames(mtcars)
colnames(mpg)=rownames(mtcars)
hp=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(hp)=rownames(mtcars)
colnames(hp)=rownames(mtcars)
wt=matrix(nrow=nrow(mtcars),ncol=nrow(mtcars))
rownames(wt)=rownames(mtcars)
colnames(wt)=rownames(mtcars)
for(i in 1:nrow(mtcars)){
  for(j in 1:nrow(mtcars)){
    mpg[i,j]=abs(mtcars$mpg[i]-mtcars$mpg[j])
    hp[i,j]=abs(mtcars$hp[i]-mtcars$hp[j])
    wt[i,j]=abs(mtcars$wt[i]-mtcars$wt[j])
  }
}
label=t(mtcars[,colnames(mtcars) == "cyl" | colnames(mtcars) == "gear", drop=FALSE])
aliases=matrix(c("cyl","gear","number of cylinders","number of gears"),2,2)
mcheatmaps(matA=mpg,matB=hp,matC=wt,flabels=label,aliases=aliases,pdfname="CarStats",
legA="Difference in gas consumtion (mpg)",legB="Difference in HorsePower",
legC="Weight Difference (tonne)")
}