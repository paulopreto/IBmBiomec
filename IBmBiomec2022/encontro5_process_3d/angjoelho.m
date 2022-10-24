% Calculo do angulo do joelho

[Markers, VideoFrameRate, AnalogSignals, AnalogFrameRate, Event, ParameterGroup, CameraInfo, ResidualError] = loadc3d_oct("Ma05.c3d");

p1 = Markers(:, 16, :);
p1 = p1(:,:);

p2 = Markers(:, 17, :);
p2 = p2(:,:);

p3 = Markers(:, 18, :);
p3 = p3(:,:);

p4 = Markers(:, 19, :);
p4 = p4(:,:);

p5 = Markers(:, 21, :);
p5 = p5(:,:);

p6 = Markers(:, 22, :);
p6 = p6(:,:);

% Make figure - plot 3D 
plot3(p1(1,1), p1(1,2), p1(1,3), 'ro')
hold on
plot3(p2(1,1), p2(1,2), p2(1,3), 'bo')
daspect([1,1,1])
box on
grid on
plot3(p3(1,1), p3(1,2), p3(1,3), 'go')
plot3(p4(1,1), p4(1,2), p4(1,3), 'r*')
rotate3d
plot3(p5(1,1), p5(1,2), p5(1,3), 'b*')
plot3(p6(1,1), p6(1,2), p6(1,3), 'g*')
xlabel("X")
ylabel("Y")
zlabel("Z")

vetz_coxa = p1 - p2;
vet_coxaaux1 = p2 - p1;
vet_coxaaux2 = p3 - p1;


vetz_perna = p4 - p5;
vet_pernaaux1 = p5 - p4;
vet_pernaaux2 = p6 - p4;

for i = 1:size(Markers, 1)
    vetz_coxanorm = vetz_coxa(i, :) ./ norm(vetz_coxa(i, :));
    vet_coxaaux1norm = vet_coxaaux1(i, :) ./norm(vet_coxaaux1(i, :));
    vet_coxaaux2norm = vet_coxaaux2(i, :) ./norm(vet_coxaaux2(i, :));
    vety_coxanorm = cross(vet_coxaaux1norm, vet_coxaaux2norm);
    vetx_coxanorm = cross(vety_coxanorm, vetz_coxanorm);
    sistema_coxa(:,3*i-2:3*i) = [vetx_coxanorm', vety_coxanorm', vetz_coxanorm'];
    sistema_coxai = [vetx_coxanorm', vety_coxanorm', vetz_coxanorm'];
    
    vetz_pernanorm = vetz_perna(i, :) ./ norm(vetz_perna(i, :));
    vet_pernaaux1norm = vet_pernaaux1(i, :) ./norm(vet_pernaaux1(i, :));
    vet_pernaaux2norm = vet_pernaaux2(i, :) ./norm(vet_pernaaux2(i, :));
    vety_pernanorm = cross(vet_pernaaux1norm, vet_pernaaux2norm);
    vetx_pernanorm = cross(vety_pernanorm, vetz_pernanorm);
    sistema_perna(:,3*i-2:3*i) = [vetx_pernanorm', vety_pernanorm', vetz_pernanorm'];
    sistema_pernai = [vetx_pernanorm', vety_pernanorm', vetz_pernanorm'];
    
    mrjoelho =  sistema_pernai * sistema_coxai';
    [rotjoelhox, rotjoelhoy, rotjoelhoz] = mr2angle(mrjoelho);
    
    
    angeulerjoelho(i,:) = [rotjoelhox*(180/pi), rotjoelhoy*(180/pi), rotjoelhoz*(180/pi)]; 
end

figure
desbase(sistema_coxa(:, 1:3), sistema_perna(:, 1:3), [0,0,0], [0,0,0], "Base da Coxa", "Base da Perna")

figure
plot(angeulerjoelho)
legend("ROT X", "ROT Y", "ROT Z") 