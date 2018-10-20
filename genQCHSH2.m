etaA=0.8046873;
etaB=0.8046873;
Q =  ones(16, 25);


for as = 0:3
  for bs = 0:3
    for ao = 0:3
      Q(4 * as + bs + 1 , 5 * ao + 5) = etaA*(1-etaB) / 4;
    end
    for bo = 0:3
      Q(4 * as + bs + 1 , 5 * 4 + bo + 1) = etaB*(1-etaA) / 4;
    end
  end
end

T=0.85
for as1 = 0:1
  for as2 = 0:1
		as = 2 * as1 + as2;
		for bs1 = 0:1
			for bs2 = 0:1
				bs = 2 * bs1 + bs2;
				Q(4 * as + bs + 1, 25) = (1 - etaA)*(1-etaB);
				for ao1 = 0:1
					for ao2 = 0:1
						ao = 2 * ao1 + ao2;
						for bo1 = 0:1
							for bo2 = 0:1
								bo = 2 * bo1 + bo2;
								% Q(4 * (x - 1) + y, 5 * (stratA(x) - 1) + stratB(y))
								if as1*bs1 == mod(ao1+bo1,2) && as2*bs2 == mod(ao2+bo2,2)
									Q(4 * as + bs + 1 , 5 * ao + bo + 1) = T^2 * etaA*etaB / 4;
								elseif  as1*bs1 == mod(ao1+bo1,2) 
									Q(4 * as + bs + 1 , 5 * ao + bo + 1) = T * (1-T) * etaA*etaB / 4;
								elseif  as2*bs2 == mod(ao2+bo2,2)
									Q(4 * as + bs + 1 , 5 * ao + bo + 1) = T * (1-T) * etaA*etaB / 4;
								else
									Q(4 * as + bs + 1 , 5 * ao + bo + 1) =(1 - T)^2 * etaA*etaB / 4;
								end
						  end
						end
					end
				end
			end
		end
	end
end

b = vec(Q)
						
