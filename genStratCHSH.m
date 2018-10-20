A = zeros(36, 3 ^ 4 );

nStrats=0
for A_0=1:3
    for A_1=1:3
        stratA = [A_0 A_1]
        for B_0=1:3
            for B_1=1:3
                stratB = [B_0 B_1]
                S=zeros(4,9);
                for x=1:2
                    for y=1:2
                        S(2 * (x - 1) + y, 3 * (stratA(x) - 1) + stratB(y))=1;
                    end
                end
                nStrats = nStrats + 1;
                A(:, nStrats) = reshape(S, 1, []);
            end
        end
    end
end