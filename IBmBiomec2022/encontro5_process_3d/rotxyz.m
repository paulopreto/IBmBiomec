% Rotina criada por Paulo R. P. santiago (PRETO)
%
% Primeira versao 01/07/04 ultima atualizaçao 
%
% Roda um vetor (centrado na origem) nos eixos x,y e z.
%
% Entre com o vetor (dat com (x,y,z) em uma coluna) e 
% os graus de rotaçao em cada eixo. Eixo z vertical.
% Escolha a ordem que as rotacoes serao realizadas.

% O sentido da rotaçao e de acordo com a regra da mão direita 
% anti-horario para todos em todos os eixo 
% (como se estivesse olhado de cima para baixo 
% no eixo rodado "olhando na ponta do eixo rodado)
%
% vetor original em magenta "rosa", vetor apos a rotaçao em amarelo

function [datrot] = rotxyz(dat,xth,yth,zth)

nl  = size(xth,1);
%%%%%%%%%%%%%%%%%%% Passando de graus para radianos %%%%%%%%%%%%%%%%%%%%%%%%

xth = xth * pi / 180;
yth = yth * pi / 180;
zth = zth * pi / 180;

for i = 1:nl
%%%%%%%%%%%%%%%%%%%%%%% Matrizes de rotaçao %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% matriz de rotaçao em torno do eixo x (x fixo)
mat_x_rot = [...
              1 ,     0    ,       0
              0 , cos(xth(i)) ,  -sin(xth(i))
              0 , sin(xth(i)) ,   cos(xth(i)) 
                                        ];

% matriz de rotaçao em torno do eixo y (y fixo)
mat_y_rot = [...
              cos(yth(i))   , 0 , sin(yth(i))
                  0         , 1 ,    0
               -sin(yth(i)) , 0 , cos(yth(i))  
                                         ];

% matriz de rotaçao em torno do eixo z (z fixo)
mat_z_rot = [...
              cos(zth(i)) , -sin(zth(i))  , 0
             sin(zth(i))  ,   cos(zth(i)) , 0
                 0        ,      0        , 1
                                         ];

% MR = (mat_z_rot * mat_y_rot) * mat_x_rot;
MR = mat_z_rot * mat_y_rot * mat_x_rot;
datrot(:,(3*i-2:3*i)) = MR * dat;
end
%     % rodando dat em torno de x
%     xrot = mat_x_rot * dat;
% 
%     % rodando dat em torno de y
%     yrot = mat_y_rot * xrot;
% 
%     % rodando dat em torno de z
%     zrot = mat_z_rot * yrot;
% 
%     datrot = zrot;
