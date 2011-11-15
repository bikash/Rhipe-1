#Example query: 
#source("C:/cygwin/home/Diana/Clustering/kmeans/kmeans.clustering.R")
#m <- kmeans.clustering("C:/cygwin/home/Diana/Clustering/Data/docword.kos.txt", 5, "Col1", "Col2")
#m



#D = Path to data file, k=number of clusters, col1 = Column name 1, col2 = Column name 2
kmeans.clustering <- function(D, k, col1, col2) 
{

m <- read.Data(D, col1, col2)
m <- init.Clusters(m, k)
huh <- calculate.centroid(m, 2)
print(c(huh))
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
#sortedData <- Data[sort.list(Data[,3]),]
counter <- 0
x.coord <- 0
y.coord <- 0
for(i in 1:nrow(Data)){
	if(toString(id)==Data[i,3]){
		x.coord <- x.coord + Data[i,1]
		y.coord <- y.coord + Data[i,2]
		counter <- counter + 1
	}
}
print(c(x.coord))
print(c(y.coord))
print(c(counter))

x.coord <- x.coord / counter
y.coord <- y.coord / counter
coords <- c(x.coord, y.coord)
return(coords)

}



#Use calculate.centroid to get centroid, and then assign every row to the closest cluster centroid. Return false if no row was assigned to a different cluster, true otherwise.
cluster <- function(Data) 
{




}



#Draws the graph. Don't know much about this yet.
draw.Clusters <- function(Data) 
{
plot(Data[,1],Data[,2],col=c(Data[,3]))





}