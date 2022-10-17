function [] = desbase(B1,B2,OB1,OB2,name1,name2)
% % Rotina para desenhar duas bases.
% % Entre com as bases 1 e 2(B1 e B2)
% % Depois entre com a origens da base 1 e 2 (OB1 e OB2)
% %  Por ultimo entre com os nomes para base 1 e 2 (name1 e name2)
% % Lembre-se de escrever o nome das bases na forma de texto (entre apostrofe).



if nargin == 1;B2 = eye(3);OB1 = [0 0 0];OB2 = [0 0 0];end
if nargin == 2;OB1 = [0 0 0];OB2 = [0 0 0];name1 = 'bas1'; name2 = 'bas2';end


[nlin,ncol] = size(B1);

%colordef('white')
%colordef('none')
warning off
% whitebg('k')
% figure


bcan = eye(3);

coordx = [0 0 0 ; 1 0 0] ;
coordy = [0 0 0 ; 0 1 0] ;
coordz = [0 0 0 ; 0 0 1] ;
% 
plot3(coordx(:,1),coordx(:,2),coordx(:,3),'r','linewidth',1)
hold on
plot3(coordy(:,1),coordy(:,2),coordy(:,3),'g','linewidth',1)
plot3(coordz(:,1),coordz(:,2),coordz(:,3),'b','linewidth',1)
xlabel('X')
ylabel('Y')
zlabel('Z')
% % % % grid on


text(1,.1,.1,'X') 
text(.1,1,.1,'Y') 
text(.1,.1,1,'Z')



% 
% xmax = max([B1(1,1);B1(1,2);B1(1,3);B2(1,1);B2(1,2);B2(1,3)]);
% xmin = min([B1(1,1);B1(1,2);B1(1,3);B2(1,1);B2(1,2);B2(1,3)]);
% 
% ymax = max([B1(2,1);B1(2,2);B1(2,3);B2(2,1);B2(2,2);B2(2,3)]);
% ymin = min([B1(2,1);B1(2,2);B1(2,3);B2(2,1);B2(2,2);B2(2,3)]);
% 
% zmax = max([B1(3,1);B1(3,2);B1(3,3);B2(3,1);B2(3,2);B2(3,3)]);
% zmin = min([B1(3,1);B1(3,2);B1(3,3);B2(3,1);B2(3,2);B2(3,3)]);
% 
% axis([xmin xmax ymin ymax zmin zmax])

daspect([1 1 1])
 
axis vis3d
view([36 19]);
box on


desvet(OB1,B1(:,1),'r',[name1,'_i']);
desvet(OB1,B1(:,2),'g',[name1,'_j']);
desvet(OB1,B1(:,3),'b',[name1,'_k']);


desvet(OB2,B2(:,1),'r',[name2,'_i']);
desvet(OB2,B2(:,2),'g',[name2,'_j']);
desvet(OB2,B2(:,3),'b',[name2,'_k']);

% camproj('perspective')

rotate3d on






% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % ##############################################################
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % ##############################################################


function desvet(p,v,color,name)
%desvet(v)   desenha o vetor v na origem
%desvet(p,v) desenha o vetor v no ponto p
%desvet(v,color) desenha o vetor v na origem com cor color 
%desvet(p,v,color) desenha o vetor v no ponto p com cor color.
%desvet(p,v,color,'name') desenha o vetor v no ponto p
%                       com cor color e escreve o nome name. 
%          A  cor pode ser uma de
%         'y'     amarelo     'm'     magenta       
%         'c'     cyan        'r'     vermelho         
%         'g'     verde       'b'     azul          
%         'w'     branco      'k'     preto   
%
%       written by Reginaldo J. Santos on 23 November 1997 
%                  DMat/ICEx/UFMG
if nargin==1
   plavec(p);
elseif nargin==2
   plavec(p,v);
elseif nargin==3
   plavec(p,v,color);
elseif nargin==4   
   plavec(p,v,color,name);
end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % ##############################################################
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % ##############################################################

function plavec(p,v,color,name,thick)
%plavec(v) places the vector v in the origin 
%plavec(p,v) places the vector v in point p
%plavec(v,color) places the vector v in the origin 
%plavec(p,v,color) places the vector v in point p
%                  with color color.
%plavec(p,v,color,'name') places the vector v in point p
%                 with and color color and write name. 
%          The color can be one of
%         'y'     yellow      'm'     magenta       
% 	       'c'     cyan        'r'     red         
% 	       'g'     green       'b'     blue          
% 	       'w'     white       'k'     black   
%
%       written by Reginaldo J. Santos on 25 November 2001 
%                  DMat/ICEx/UFMG

p=p(:);p=double(p);
if nargin==1
 v=p;
 if length(v)==3
  p=[0,0,0];
 elseif length(v)==2
  p=[0,0];
 end
 color='k';
end
if (nargin==2)
  if (isstr(v))
    color=v;
    v=p;
    p=[0,0,0];
  else
    color='k';
  end
end
v=v(:);v=double(v);
m=length(p);
n=length(v);
if (m==3)&(n==3)
  h=1/10;
  l=h/4;
%  l=h/6;
  vv=(1-h)*v;
  nvxy2=v(1)^2+v(2)^2;
  nvxy=sqrt(nvxy2);
  nv=norm(v);
  if (nvxy>0)
    vp1=nv*[-v(2) v(1) 0]/nvxy;
    vp2=[-v(3)*v(1) -v(3)*v(2) nvxy2]/nvxy;
  else
    vp1=[nv 0 0];
    vp2=[0 nv 0];
  end
  H=plot3([p(1) p(1)+v(1)],[p(2) p(2)+v(2)],[p(3) p(3)+v(3)],color);
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  hold on
  % place the arrow
%  H=plot3([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)-l*vp1(1)],...
%      [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)-l*vp1(2)],...
%      [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)-l*vp1(3)],...
%      color); 
%  if (nargin<5)
%    set(H,'Linewidth',2); 
%  else
%    set(H,'Linewidth',thick);
%  end
%  hold on
%  H=plot3([p(1)+vv(1)+l*vp2(1) p(1)+v(1) p(1)+vv(1)-l*vp2(1)],...
%      [p(2)+vv(2)+l*vp2(2) p(2)+v(2) p(2)+vv(2)-l*vp2(2)],...
%      [p(3)+vv(3)+l*vp2(3) p(3)+v(3) p(3)+vv(3)-l*vp2(3)],...
%      color); 
%  if (nargin<5)
%    set(H,'Linewidth',2); 
%  else
%    set(H,'Linewidth',thick);
%  end
  plot3([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)+l*vp2(1)],...
       [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)+l*vp2(2)],...
       [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)+l*vp2(3)],...
       color);
  plot3([p(1)+vv(1)+l*vp1(1) p(1)+v(1) p(1)+vv(1)-l*vp2(1)],...
       [p(2)+vv(2)+l*vp1(2) p(2)+v(2) p(2)+vv(2)-l*vp2(2)],...
       [p(3)+vv(3)+l*vp1(3) p(3)+v(3) p(3)+vv(3)-l*vp2(3)],...
       color);
  plot3([p(1)+v(1) p(1)+vv(1)-l*vp1(1) p(1)+vv(1)+l*vp2(1)],...
       [p(2)+v(2) p(2)+vv(2)-l*vp1(2) p(2)+vv(2)+l*vp2(2)],...
       [p(3)+v(3) p(3)+vv(3)-l*vp1(3) p(3)+vv(3)+l*vp2(3)],...
       color);
  plot3([p(1)+v(1) p(1)+vv(1)-l*vp1(1) p(1)+vv(1)-l*vp2(1)],...
       [p(2)+v(2) p(2)+vv(2)-l*vp1(2) p(2)+vv(2)-l*vp2(2)],...
       [p(3)+v(3) p(3)+vv(3)-l*vp1(3) p(3)+vv(3)-l*vp2(3)],...
       color); 
  % place the text
  if (nargin>3)
    if(nvxy==0)
      %text(p(1)+(1+h)*v(1)+h*vp1(1),p(2)+(1+h)*v(2)+h*vp2(2),...
        %p(3)+(1+h)*v(3),name);
      H=text(p(1)+(1+h)*v(1),p(2)+(1+h)*v(2),...
        p(3)+(1+h)*v(3),name);
    else
      H=text(p(1)+(1+h)*v(1)+h*vp2(1),p(2)+(1+h)*v(2)+h*vp2(2),...
        p(3)+(1+h)*v(3)-l*vp2(3),name);%troquei +l por -l
    end
    %set(H,'Fontsize',14);
  end
  elseif(n==2)&(m==2)
  h=1/10;
  l=h/4;
  vv=(1-h)*v;
  vp=[v(2) -v(1)];
  H=plot([p(1) p(1)+v(1)],[p(2) p(2)+v(2)],color);
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  hold on
  % place the arrow
  fill([p(1)+vv(1)+l*vp(1) p(1)+v(1) p(1)+vv(1)-l*vp(1)],...
      [p(2)+vv(2)+l*vp(2) p(2)+v(2) p(2)+vv(2)-l*vp(2)],color); 
  H=plot([p(1)+vv(1)+l*vp(1) p(1)+v(1) p(1)+vv(1)-l*vp(1) p(1)+vv(1)+l*vp(1)],...
      [p(2)+vv(2)+l*vp(2) p(2)+v(2) p(2)+vv(2)-l*vp(2) p(2)+vv(2)+l*vp(2)],color); 
  if (nargin<5)
    set(H,'Linewidth',2.5); 
  else
    set(H,'Linewidth',thick);
  end
  % place the text
  if (nargin>3)
    if (v(2) > 0)
      text(p(1)+(1+h)*v(1)+l*vp(1),p(2)+(1+h)*v(2)+l*vp(2),name);
    else 
      text(p(1)+(1+h)*v(1)-l*vp(1),p(2)+(1+h)*v(2)-l*vp(2),name);
    end
  end
else
  error('The vector must have dimension 2 or 3!')  
end

hold on 
