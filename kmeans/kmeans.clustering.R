#Example query: 
#source("C:/cygwin/home/Diana/Clustering/kmeans/kmeans.clustering.R")
#m <- kmeans.clustering("C:/cygwin/home/Diana/Clustering/Data/fakedata.txt", 5, "Col1", "Col2")
#m



#D = Path to data file, k=number of clusters, col1 = Column name 1, col2 = Column name 2, iterations = number of max iterations
kmeans.clustering <- function(D, k, col1, col2, iterations) 
{

m <- read.Data(D, col1, col2)
m <- init.Clusters(m, k)

for(i in 1:iterations){
	m2 <- cluster(m, k)
	draw.Clusters(m2, i, "C:/cygwin/home/Diana/Clustering/")  
	if(compare(m, m2)){
		return(m2)
	}
	m <- m2
}

return(m)

}

#Compares cluster column of two matrices and return false if different
compare <- function(Data, Data2){
	for(i in 1:nrow(Data)){
		if(!as.numeric(Data[i,3])==as.numeric(Data2[i,3])){
			return(FALSE)
		}
	}
return(TRUE)
}




#Data = Location of txt file, col1 = Name of column1, col2 = Name of column2
read.Data <- function(Data, col1, col2) 
{

m <- matrix(scan(Data), ncol=2, byrow = TRUE)
colnames(m)=c(col1, col2)
return(m)

}




#Data = Matrix, k = number of clusters, partition data into k (random if you want) clusters. No return value.
init.Clusters <- function(Data, k) 
{

Data <- cbind(Data, 1:k)
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

x.coord <- x.coord / counter
y.coord <- y.coord / counter
coords <- c(x.coord, y.coord)
if(counter==0){
	return(c(0,0))
}	
return(coords)

}



#Use calculate.centroid to get centroid, and then assign every row to the closest cluster centroid. Return data.
cluster <- function(Data, k) 
{
centroids <- matrix(nrow=0, ncol=2)
for(r in 1:k){
	centroids <- rbind(centroids, calculate.centroid(Data, r))
}

for(i in 1:nrow(Data)){
	temp <- c()
	for(j in 1:k){
		temp[j] <- sqrt((Data[i,1]-centroids[j,1])^2+(Data[i,2]-centroids[j,2])^2) 
	}

min <- get.min(temp)
Data[i,3] <- min

}
return(Data)

}

#Return the index of the min value item in a list.
get.min <- function(Data){

min <- 10000000
index <- 0
for(i in 1:length(Data)){
	if(as.numeric(Data[i]) < min){
		index = i
		min = as.numeric(Data[i])
	}

}
return(index)
}


#Draws the graph. Pass the index and path (all directories must exist!) where to save the file.
#Path can be either relative to R working dir, or global, up to dir where file will be placed
#It will output the graph to a .png
#It will over-write any files with the same name
draw.Clusters <- function(Data,index,path) 
{
pathInstance<-paste(path,"kmeans",index,".png",sep="",collapse=NULL)
png(pathInstance)
plot(Data[,1],Data[,2],col=c(Data[,3]))
dev.off()
}