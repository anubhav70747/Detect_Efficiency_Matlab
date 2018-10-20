A = zeros(400, 5 ^ 8);

nStrats = 0;
for A_00 = 1:5
  for A_01 = 1:5
    for A_10 = 1:5
      for A_11 = 1:5
      stratA = [A_00 A_01 A_10 A_11]
        for B_00 = 1:5
          for B_01 = 1:5
            for B_10 = 1:5
              for B_11 = 1:5
                
                stratB = [B_00 B_01 B_10 B_11];
                S = zeros(16, 25);
                for x = 1:4
                  for y = 1:4
                    S(4 * (x - 1) + y, 5 * (stratA(x) - 1) + stratB(y)) = 1; % S( [x,y], [stratA(x),stratB(y)] ) = 1
                  end
                end
                
                nStrats = nStrats + 1;
                A(:, nStrats) = reshape(S, 1, []);
              end
            end
          end
        end
      end
    end
  end
end


