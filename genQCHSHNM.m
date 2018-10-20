function b=genQCHSHNM(Beta,eta)
Alpha = sqrt(1-(Beta^2));
Psi = [Alpha;0;0;Beta];
Rho = Psi*Psi';

vecMA = cell(2,2);
vecMA{1,1} = normalize_pure(sqrt(Beta)*[1;0] - sqrt(Alpha)*[0;1]);  
vecMA{2,1} = normalize_pure(sqrt(Alpha)*[1;0] + sqrt(Beta)*[0;1]);  
vecMA{1,2} = normalize_pure(sqrt(Beta)^3*[1;0] + sqrt(Alpha)^3*[0;1]);  
vecMA{2,2} = normalize_pure(sqrt(Alpha)^3*[1;0] - sqrt(Beta)^3*[0;1]);  
MA = cell(2,2);
for x = 1:2
  for u = 1:2
    MA(u,x) = vecMA{u,x}*vecMA{u,x}';
  end
end

vecMB = cell(2,2);
vecMB{1,1} = normalize_pure(sqrt(Beta)^3*[1;0] - sqrt(Alpha)^3*[0;1]);  
vecMB{2,1} = normalize_pure(sqrt(Alpha)^3*[1;0] + sqrt(Beta)^3*[0;1]);  
vecMB{1,2} = normalize_pure(sqrt(Beta)*[1;0] + sqrt(Alpha)*[0;1]);  
vecMB{2,2} = normalize_pure(sqrt(Alpha)*[1;0] - sqrt(Beta)*[0;1]);  
MB = cell(2,2);
for y = 1:2
  for v = 1:2
    MB(v,y) = vecMB{v,y}*vecMB{v,y}';
  end
end



Joint_P = cell(2,2,2,2);
for x = 1:2
  for y = 1:2
    for u = 1:2
      for v = 1:2
        Joint_P{u,v,x,y} = trace(Rho * kron(MA{u,x},MB{v,y}));
      end
    end
  end
end
for x = 1:2
  for y = 1:2
    sum = 0;
    for u = 1:2
      for v = 1:2
        sum = sum+ Joint_P{u,v,x,y};
      end
    end
  end
end

CHSH = - Joint_P{2,1,1,1} - Joint_P{1,1,1,2} - Joint_P{1,2,2,2} + Joint_P{1,1,2,1};
Marg_PA = cell(2,2);
 for x = 1:2
  for u = 1:2
    Marg_PA{u,x} = trace(Rho * kron(MA{u,x},eye(2)));
  end
end


Marg_PB = cell(2,2);
for y = 1:2
  for v = 1:2
    Marg_PB{v,y} = trace(Rho * kron(eye(2),MB{v,y}));
  end
end

etaB=eta;
etaA=eta;

Q1 = ones(4,9);

for as = 0:1
    for bs = 0:1
        for ao = 0:1
            Q1(2 * as + bs + 1 , 3 * ao + 3) = etaA * (1-etaB) * Marg_PA{ao+1,as+1} ;
        end
        for bo = 0:1
            Q1(2 * as + bs + 1 , 3 * 2 + bo + 1) = etaB * (1-etaA) * Marg_PB{bo+1,bs+1};
        end
    end
end

for as = 0:1
	for bs = 0:1			
		Q1(2 * as + bs + 1, 9) = (1 - etaA) *  (1-etaB);	
		for ao = 0:1
      for bo = 0:1
        Q1(2 * as + bs + 1 , 3 * ao + bo + 1) = Joint_P{ao+1,bo+1,as+1,bs+1} * etaA * etaB;				
			end
		end
  end
end
b = reshape(Q1, 1, []);
endfunction