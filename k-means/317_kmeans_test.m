% k - means clustering: Take some labelled data, look at the labels of the clusters to understand what label each cluster corresponds to. 
% then take an unlabelled datapoint, see into which cluster it fits best, and thereby assign the unlabelled datapoint a label.
% we assume that there are k clusters, and each cluster is defined by its center point — its mean. 
% to find these clusters, we use k random centroids. A centroid is simply a datapoint around which we form a cluster. We call that set of datapoints its cluster.
% then we take the mean of the cluster, and let that be the new centroid.
% we do this in order to minimize the total sum of distances from every centroid to the points in its cluster — that is, our metric for how well the clusters split up the data.

load mnist_train                    % mnist_train: MNIST data set containing N = 60000 grayscale images of size 28 × 28;
                                    % Each column of digits is a 28 × 28 grayscale image, stored as a vector of length 28^2 = 784 with elements between 0 and 1 (0 denotes a black pixel and 1 a white pixel);
                                    % digits: (784 x 60,000) matrix, containing the sample images, or data vectors of handwritten numbers;
                                    % labels: (1 x 60,000) matrix, containing the true representations of the sample numbers;
% X = reshape(digits(:,i), 28, 28); % to display the image in the ith column of digits, use the command;
digits = digits(:, 1:20);           % a sample collection of the first 20 out of the 60,000 image vectors;
10
% Let's say we want to cluster digits = 20 images into k = 2 groups. In order to do this, we need to first find the group representatives for each cluster k = 1, 2
% z1 will therefore be (784 x 1) vector representative of group 1, and z2 will be the (784 x 1) vector representative of group 2.
% we will also need to assign eaceh of the 20 image(data) vectors into one of the two groups,
% after which we will set Z by computing (and re-computing) the average of the vectors in group 1, and group 2 respectively

% To randomly set an initial group assignment to all 20 vectors from 'digits' and split them into two groups:

group = randi(2, 1, 20)             % splitting the 20 image vectors into k = 2 groups;

                                    % k-means will be run on this set of digits = 10,000 vectors with k = 20 clusters. 
                                    % in this file we'll shorten that even further and simply use digits = 20, to better understand what's happening;

                                    % each element in the 'group' matrix indicates the group number to which digits(i) belongs: digits(:,1) -> group 2, digits(:, 2) -> group 1, and so on.
                                    % as an example, say the vectors belonging to group 2 from the 'digits' matrix is the first, third, fifth,..., and so on.
                                    % the 'group' vector corresponds to the N-vector 'c' described in the book
% I = find(group == 2)              % the vector 'I' describes which of the vectors belong to group == i, where i = 1, 2, ..., k;

% the matrix 'I' indicates the set of all indices for which group == 2,
% indicates that digits(:, 1) -> 1st, (:, 3) -> 3rd,..., vectors in the 'digits' matrix belong to group 1

% Now we will randomly pick a group representative from 'digits' for z1 and z2 to form Z = [z1 z2],
% initializing z1 to be the centroid for group 1, z2 to be the centroid for group 2, and so on
% we need to pick from I, an index corresponding to the one in 'digits':

k = 2;
Z = [];
for i = 1:k                         % the loop will run for as many clusters there are(k), each time concatenating to the columns of Z a vector from each cluster k = 1, 2
    I = find(group == i);           % find the group representatives corresponding to i = 1,2,...,k 
    pos = randi(length(I));
    zi = digits(:, pos);
    Z = [Z zi];
end

J = [];
J_prev = [];
d = [];
sq_dist = [];
for i = 1:20
    for j = 1:2
        sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
		sq_dist = [sq_dist sq_dist_i];
    end
	[min_val idx] = min(sq_dist);
	group(i) = idx;
	d = [d min_val];                % stores the current minimum value for the current x(i) vector, compared to all z1, z2, ..., zk centroid vectors;
	sq_dist = [];                   % reinitialize so that the next vector can be compared;
end

J = mean(d);

% now to calculate the mean of each cluster and updating the values of the centroid matrix Z,
% which is the clustering assignment:

while norm(J - J_prev) >= 10^-5 * J
    Z = [];
    for i = 1:k
        I = find(group == i);                   % find the vectors which belong to the updated group 
        % update the new centroids by calculating and assigning the mean of all the vectors that belong to each group
        Z = [Z mean(digits(:, I), 2)];           % because I is a row vector, MATLAB automatically creates a matrix with each element of I corresponding to a column vector of Z    
    end
    
    % better to have simply written a function for this, but we'll leave it like this for now;
    d = [];
    for i = 1:20
        for j = 1:2
            sq_dist_i = (norm(digits(:, i) - Z(:,j)))^2;
            sq_dist = [sq_dist sq_dist_i];
        end
        [min_val idx] = min(sq_dist);
        group(i) = idx;
        d = [d min_val];                % stores the current minimum value for the current x(i) vector, compared to all z1, z2, ..., zk centroid vectors;
        sq_dist = [];                   % reinitialize so that the next vector can be compared;
    end
    
    J_prev = J;
    J = mean(d);
nd

% to see the results of the clustering:
for k = 1:2
    subplot(4, 5, k)
    imshow(reshape(Z(:,k), 28, 28))
end
    





% % Z = [digits(:, find(group == 2))];  % equivalent statements; [] not necessary
