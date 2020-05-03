x=csvread('bookprice.txt');
[row, col] = size(x);
scatter(x(:,1),x(:,2))
xlabel('page');
ylabel('price');
xlim([0 600]);
ylim([0 250]);
hold on
k=3;
centroids=zeros(k,size(x,2));
randidx = randperm(size(x,1));
centroids = X(randidx(1:k), :);

for j=1:row
    group1=[];
    group2=[];                                                                                                   
    group3=[];

    for i=1:row                    
        dist1=norm(centroids(1,:)-x(i,:));
        dist2=norm(centroids(2,:)-x(i,:));
        dist3=norm(centroids(3,:)-x(i,:)) ;           

        if (dist1<dist2 && dist1<dist3)                                                                                                   
            group1=[group1;x(i,:)];                                                                                                                                                                                                                                               


        elseif (dist2<dist3 && dist2<dist1)
            group2 =[group2;x(i,:)];



        elseif(dist3<dist1 && dist3<dist2 )
             group3=[group3;x(i,:)];


        end
    end

    avggroup1=mean(group1,1);
    avggroup2=mean(group2,1);
    avggroup3=mean(group3,1);

    centroids(1,:)= avggroup1
    centroids(2,:)= avggroup2
    centroids(3,:)= avggroup3
    group1
    group2                                                                                                   
    group3
end
plot(centroids(:,1), centroids(:,2), 'd')
hold off

    group1
    group2                                                                                                   
    group3
