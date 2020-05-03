% k - means clustering: Take some labelled data, look at the labels of the clusters to understand what label each cluster corresponds to. Then take an unlabelled datapoint, see into which cluster it fits best, and thereby assign the unlabelled datapoint a label.

% we assume that there are k clusters, and each cluster is defined by its center point — its mean. To find these clusters, we use k random centroids. A centroid is simply a datapoint around which we form a cluster. We call that set of datapoints its cluster. Then we take the mean of the cluster, and let that be the new centroid.

% we do this in order to minimize the total sum of distances from every centroid to the points in its cluster — that is our metric for how well the clusters split up the data.

load mnist_train		% mnist_train: MNIST data set containing N = 60000 grayscale images of size 28 × 28;
            % Each column of digits is a 28 × 28 grayscale image, stored as a vector of length 28^2 = 784 with elements between 0 and 1 (0 denotes a black pixel and 1 a white pixel);
            % digits: (784 x 60,000) matrix, containing the sample images, or data vectors of handwritten numbers;
            % labels: (1 x 60,000) matrix, containing the true representations of the sample numbers;
            % To display the image in the ith column of digits, use the command: X = reshape(digits(:,i), 28, 28);
digits = digits(:, 1:20); 	% a sample collection of the first 20 out of the 60,000 image vectors;

% Let's say we want to cluster 20 images into 2 groups. In order to do this, we need to first find the group representatives for each group j = 1, 2. z1 will therefore be (784 x 1) vector representative of group 1, and z2 will be the (784 x 1) vector representative of group 2. We will also need to assign eaceh image(data) vector into one of the two groups, for each of the 20 vectors in the 'digits' matrix. After which we will set Z by computing the average of the vectors in group 1, and group 2 respectively. I think.

% To randomly set an initial group assignment to all 20 vectors from 'digits' and split them into two groups:

group = randi(2, 1, 20) 	% splitting the 10 image vectors into 2 groups;

            % Using only the first 10,000 digits to speed up computations using: digits = digits(:, 1:10000); k-means will be run on this set of N = 10,000 vectors with k = 20 clusters. In this file we'll shorten that even further and simply use 10, to better understand what's happening;

            % each element in the 'group' matrix indicates the group number to which digits(i) belongs: digits(:,1) -> group 2, digits(:, 2) -> group 1, and so on.
            % as an example, the vectors now belonging to group 2 from the 'digits' matrix is the first, third, fifth,..., and so on.
            % the group vector plays the part of the N-vector 'c' described in the book;
I = find(group == 2) 	% the vector 'I' describes which of the vectors belong to group == k, where k = 1, 2, in this case; and 1, 2, ... , 20 in the main case;
  				% the matrix 'I' indicates the set of all indices for which group == 2
  				% indicates that digits(:, 1) -> 1st, (:, 3) -> 3rd,..., vectors in the 'digits' matrix belong to group 1

  				% Now we will randomly pick a group representative for Z = [z1 z2], initializing z1 to be the centroid for group 1,
  				% And z2 to be the centroid for group 2. We need to pick from I an index corresponding to the one in digits:


load mnist_train
digits = digits(:, 1:20);
group = randi(2, 1, 20)




Z = [digits(:, find(group == 2))];
Z = digits(:, find(group == 2));
I = find(group == 1);
Z = digits(:, find(group == 1));
Z = digits(:, I);
Z = [];
size(I)

size(I, 2)


for i = 1:size(I, 2)
end;

Z = mean(digits(:, find(group == 1)));
size(Z)

d = [];
sq_dist = [];
for i = 1:20
 	for j = 1:2
		sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
		sq_dist = [sq_dist sq_dist_i];
	end
	[min_val idx] = min(sq_dist);
	group(i) = idx;
	d = [d min_val];			% stores the current minimum value for the current x(i) vector, compared to all z1, z2, ..., zk centroid vectors;
	sq_dist = [];				% reinitialize so that the next vector can be compared;
end


Z = [mean(digits(:, find(group == i)), 2) mean(Z(:, i+1))];

Z = digits(:, find(group == 1));
mean(Z, 2);
centroid = ans;
d = norm()


load mnist_train;
digits = digits(:, 1:20);
group = randi(2, 1, 20)


k = 2;
Z = [];
for i = 1:k
    I = find(group == i);
    pos = randi(length(I));
    zi = digits(:, pos);
    Z = [Z zi];
end
d = [];
sq_dist = [];
for i = 1:20
    for j = 1:2
        sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
        sq_dist = [sq_dist sq_dist_i]
    end
    [min_val idx] = min(sq_dist);
    group(i) = idx;
    d = [d min_val];
    sq_dist = [];
end

group

cluster_1 = digits(:, find(group == 1));
cluster_2 = [digits(:, find(group == 2))];
sample_x = [1 2];
sample_y = [3 4];
plot(sample_x, sample_y)
sample_mat = [1 2; 3 4];
sample_avg = mean(sample_mat,2)

hold on

 
scatter(sample_avg(1), sample_avg(2))
plot(sample_avg)
sample_avg = mean(sample_mat)

cluster_mean = mean(cluster_1, 2);
for i = 1:k
    I = find(group == i);
end
ZCopy = [];
for i = 1:k
    I = find(group == i);
    ZCopy = [ZCopy mean(digits(:, I))];
end
ZCopy = [];
for i = 1:k
    ZCopy = [ZCopy mean(digits(:, find(group == i)))];
end
I

ZCopy = mean(digits(:, I), 2);
for i = 1:k
end
ZCopy = [];
for i = 1:k
    I = find(group == i);
    ZCopy = [ZCopy mean(digits(:, I), 2)];
end
 

for i = 1:size(I, 2)
end;
Z = mean(digits(:, find(group == 1)));
size(Z)

Z = digits(:, find(group == 1));
mean(Z, 2);
centroid = ans;
d = norm()
