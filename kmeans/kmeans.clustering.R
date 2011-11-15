#Example query: 
#source("C:/cygwin/home/Diana/Clustering/kmeans/kmeans.clustering.R")
#m <- kmeans.clustering("C:/cygwin/home/Diana/Clustering/Data/docword.kos.txt", 5, "Col1", "Col2")
#m



#D = Path to data file, k=number of clusters, col1 = Column name 1, col2 = Column name 2
kmeans.clustering <- function(D, k, col1, col2) 
{

m <- read.Data(D, col1, col2)
return(m)

}




#Data = Location of txt file, col1 = Name of column1, col2 = Name of column2
read.Data <- function(Data, col1, col2) 
{

m <- matrix(scan(Data), ncol=2, byrow = TRUE)
m <- cbind(m, c(0))
colnames(m)=c(col1, col2, "Cluster ID")
return(m)

}




#Data = Matrix, k = number of clusters, partition data into k (random if you want) clusters. No return value.
init.Clusters <- function(Data, k) 
{


for(i in 1:nrow(Data)){
random <- sample(1:k, 1)
Data[i, 3] <- random
}

return(Data)
}



#Calculate the centroid given the data matrix and the id of cluster. Return centroid coordinates.
calculate.centroid <- function(Data, id) 
{




}



#Use calculate.centroid to get centroid, and then assign every row to the closest cluster centroid. Return false if no row was assigned to a different cluster, true otherwise.
cluster <- function(Data) 
{




}



#Draws the graph. Don't know much about this yet.
draw.Clusters <- function(Data) 
{






}