% k - means clustering
% choose a random number of clusters; k = 20, in this case.
% we assume that there are k clusters, and each cluster is defined by its center point — its mean. 
% to find these clusters, we use k random centroids. A centroid is simply a datapoint around which we form a cluster. We call that set of datapoints its cluster.
% randomly assign each point to a cluster, then take the mean of the cluster (call it J), and let that be the new centroid.
% we do this in order to minimize the total sum of distances from every centroid to the points in its cluster - our metric for how well the clusters split up the data.
% terminate when |J - J_prev| <= 10^-5*J.

load mnist_train                        % mnist_train: MNIST data set containing N = 60000 grayscale images of size 28 × 28;
                                        % Each column of digits is a 28 × 28 grayscale image, stored as a vector of length 28^2 = 784 with elements between 0 and 1 (0 -> black, 1 -> white);
                                        % digits: (784 x 60,000) matrix, containing the sample images, or data vectors of handwritten numbers;
                                        % labels: (1 x 60,000) matrix, containing the true representations of the sample numbers;
% X = reshape(digits(:,i), 28, 28);     % to display the image in the ith column of digits, use the command;
digits = digits(:, 1:10000);            % a sample collection of the first 10,000 out of the 60,000 image vectors;

% Let's say we want to group the digits = 10,000 images into k = 20 clusters.
% in order to do this, we need to first randomly find the group representatives for each cluster k = 1,2,...,20
% z1 will therefore be (784 x 1) vector representative of group 1, z2 will be the (784 x 1) vector representative of group 2,...
% we will also need to initially randomly assign each of the 10,000 image(data) vectors into one of the 20 clusters,
% after which we will set up the Z matrix by computing (and re-computing) the mean of the vectors in group 1, group 2,..., group 20

% To randomly set an initial group assignment to all 10,000 vectors from 'digits' and split them into 20 groups:

group = randi(20, 1, 10000);            % splitting the 10,000 image vectors into k = 20 groups;
                                        % each element in the 'group' vector indicates the group number to which digits(i) belongs
% I = find(group == 5)                  % the vector 'I' describes which of the vectors belong to group == i, where i = 1, 2, ..., k;

% Now we will randomly pick a group representative from 'digits' for z1,z2,...,z20 to form Z = [z1 z2 ... z20],
% initializing z1 to be the centroid for group 1, z2 to be the centroid for group 2, and so on
% we need to pick from I, an index corresponding to the one in 'digits':

k = 20;
Z = [];
for i = 1:k                         % run for as many k clusters, each time concatenating to the columns of Z a vector from digits belonging to that group
    I = find(group == i);           % finds the indices of the entries of the group vector 
    pos = randi(length(I));         % pick a random number ranging from 1 to the length of the vector I
    zi = digits(:, pos);            % pick an image from 'digits' corresponding to that position
    Z = [Z zi];
end

J = [];
J_prev = [];
d = [];                             % stores the minimum value of the current vector, compared to all z1, z2, ..., zk centroid vectors; 
sq_dist = [];                       % stores the values of all the squared distance of a vector from each centroid vector
for i = 1:10000
    for j = 1:20
        sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
		sq_dist = [sq_dist sq_dist_i];
    end
	[min_val idx] = min(sq_dist);   % returns the minimum distance from the current point to its closest centroid(stores the index of z in idx)
	group(i) = idx;                 % update the group assignment of the vector 
	d = [d min_val];
	sq_dist = [];                   % reinitialize so that the next image vector can be compared;
end

J = mean(d);                        % compute the mean

% Now, to calculate the mean of each cluster and update the group representative centroid vectors in Z:

while norm(J - J_prev) >= 10^-5 * J
    Z = [];                                     % empty Z as it will be updated and replaced by a new mean each time
    for i = 1:k
        I = find(group == i);
        % update the new centroids by calculating the mean of all the vectors that belong to the group:
        Z = [Z mean(digits(:, I), 2)];          % because I is a row vector, MATLAB fetches every single element from digits(:, I(1)),(:, I(2)),... and calculates their mean column-wise      
    end
    
    % better to have simply written a function for calculating the squared distances, but we'll leave it like this for now;
    d = [];                                     % empty d as the current values will be taken up by J_prev
    for i = 1:10000
        for j = 1:20
            sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
            sq_dist = [sq_dist sq_dist_i];
        end
        [min_val idx] = min(sq_dist);
        group(i) = idx;
        d = [d min_val];                        % stores the current minimum value for the current x(i) vector, compared to all z1, z2, ..., zk centroid vectors;
        sq_dist = [];                           % reinitialize so that the next vector can be compared;
    end
    
    J_prev = J;
    J = mean(d);
end

% to see the results of the clustering:
for k = 1:20
    subplot(4, 5, k)
    imshow(reshape(Z(:,k), 28, 28))             % reshape the group representative vectors into their image formats
end
