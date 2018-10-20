etaB=1
etaA=1
for as = 0:1
    for bs = 0:1
        for ao = 0:1
            Q(2 * as + bs + 1 , 3 * ao + 3) = etaA*(1-etaB) / 2;
        end
        for bo = 0:1
            Q(2 * as + bs + 1 , 3 * 2 + bo + 1) = etaB*(1-etaA) / 2;
        end
    end
end

T = (2+sqrt(2))/4
for as = 0:1
	for bs = 0:1			
		Q(2 * as + bs + 1, 9) = (1 - etaA) *  (1-etaB);	
		for ao = 0:1
            for bo = 0:1
                if as*bs == mod(ao+bo,2) 
                    Q(2 * as + bs + 1 , 3 * ao + bo + 1) = T * etaA * etaB / 2;
				else
					Q(2 * as + bs + 1 , 3 * ao + bo + 1) =(1 - T) * etaA * etaB / 2;
				end
			end
		end
    end
end
				
				
b = reshape(Q, 1, [])
						
