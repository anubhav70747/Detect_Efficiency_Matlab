AS=4;
[xopt, fmin, errnum, extra] = glpk (zeros(1,390625), A, b);
size_opt = size(xopt);
list_strat = [];
sum = 0
for i = 1:size_opt(1)
    if xopt(i) > 0.001
        list_strat = [list_strat;i];
    end
end
number_strats = size(list_strat)
for i = 1:number_strats(1)
    printf("Strategy no. %d with probability %f:\n",i,xopt(list_strat(i)));
    for j = 1:AS
        for k = 1:AS
            ans1=cell2mat(AStrat(i));
            ans2=cell2mat(BStrat(i));
            printf(" input %d, %d, output %d,%d \n",j,k,ans1(j),ans2(k));
        end
    end
end



