file_name_nodes = "~/projects/moose/cai157/thinfilms/compression/10_plastic/Job-1_nodes.inp";
file_name_elems = "~/projects/moose/cai157/thinfilms/compression/10_plastic/Job-1_elems.inp";
file_name_final = "~/projects/moose/cai157/thinfilms/compression/10_plastic/Job-1_final.inp";
fid_nodes = fopen(file_name_nodes,"r");
fid_elems = fopen(file_name_elems,"r");
fid_final = fopen(file_name_final,"w");
fwrite(fid_final,"*Heading");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Preprint, echo = NO, model = NO, history = NO, contact = NO");
fwrite(fid_final,"\n");
while ( ! feof(fid_nodes) ) % write nodes in input file
  text_line = fgetl(fid_nodes);
  fputs(fid_final,text_line);
  fputs(fid_final,"\n");
end
fclose(fid_nodes);
fid_nodes = fopen(file_name_nodes,"r");
nodes = zeros(0,4);
count_nodes = 0;
while ( ! feof(fid_nodes) ) % get nodes
  text_line = fgetl(fid_nodes);
  if ( ! strncmp(text_line,"*",1) )
    count_nodes++;
    nodes_line = strsplit(text_line,', ');
    nodes(count_nodes,1) = str2double(nodes_line(1));
    nodes(count_nodes,2) = str2double(nodes_line(2));
    nodes(count_nodes,3) = str2double(nodes_line(3));
    nodes(count_nodes,4) = str2double(nodes_line(4));
  end
end
fclose(fid_nodes);
xmax = max(nodes(:,2)); % get max/min coordinates
xmin = min(nodes(:,2));
ymax = max(nodes(:,3));
ymin = min(nodes(:,3));
zmax = max(nodes(:,4));
zmin = min(nodes(:,4));

ymiddle = ymax/2; %%%%%%%%%%
xmiddle = xmax/2;%%%%%%%%%%

xbottom = []; % define boundary node sets
xbottom_coord = xmin;

xtop = []; % define boundary node sets
xtop_coord = xmax;

ybottom = [];
ybottom_coord = ymin;
ytop = [];
ytop_coord = ymax;
zbottom = []; 
zbottom_coord = zmin;

ztop = []; 
ztop_coord = zmax;

ycentre = []; %%%%%%%%%%%%%
ycentre_coord = ymiddle;
xcentre = []; %%%%%%%%%%%%%
xcentre_coord = xmiddle;

xbottom_size = 0;
for j = 1:count_nodes, % define xbottom
  if ( nodes(j,2) == xbottom_coord )
    xbottom_size++;
    xbottom(xbottom_size) = nodes(j,1);
  end
end

xtop_size = 0;
for j = 1:count_nodes, % define xtop
  if ( nodes(j,2) == xtop_coord )
    xtop_size++;
    xtop(xtop_size) = nodes(j,1);
  end
end


xcentre_size = 0;   %%%%%%%%%%%
for j = 1:count_nodes, % define xcentre
  if ( nodes(j,2) == xcentre_coord )
    xcentre_size++;
    xcentre(xcentre_size) = nodes(j,1);
  end
end

ybottom_size = 0;
for j = 1:count_nodes, % define ybottom
  if ( nodes(j,3) == ybottom_coord )
    ybottom_size++;
    ybottom(ybottom_size) = nodes(j,1);
  end
end
ytop_size = 0;
for j = 1:count_nodes, % define ytop
  if ( nodes(j,3) == ytop_coord )
    ytop_size++;
    ytop(ytop_size) = nodes(j,1);
  end
end

ycentre_size = 0;   %%%%%%%%%%%
for j = 1:count_nodes, % define ycentre
  if ( nodes(j,3) == ycentre_coord )
    ycentre_size++;
    ycentre(ycentre_size) = nodes(j,1);
  end
end

zbottom_size = 0;
for j = 1:count_nodes, % define zbottom
  if ( nodes(j,4) == zbottom_coord )
    zbottom_size++;
    zbottom(zbottom_size) = nodes(j,1);
  end
end

ztop_size = 0;
for j = 1:count_nodes, % define ztop
  if ( nodes(j,4) == ztop_coord )
    ztop_size++;
    ztop(ztop_size) = nodes(j,1);
  end
end

fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=xbottom");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:xbottom_size, % write xbottom
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",xbottom(j));
  if ( j < xbottom_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end

fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=xtop");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:xtop_size, % write xtop
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",xtop(j));
  if ( j < xtop_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end

fwrite(fid_final,"**");   %%%%%%%%%%%
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=xcentre");
fwrite(fid_final,"\n");
count_nodes_line = 0;
  
for j = 1:xcentre_size, % write xcentre
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",xcentre(j));
  if ( j < xcentre_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end


fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=ybottom");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:ybottom_size, % write ybottom
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",ybottom(j));
  if ( j < ybottom_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end
fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=ytop");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:ytop_size, % write ytop
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",ytop(j));
  if ( j < ytop_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end


fwrite(fid_final,"**");   %%%%%%%%%%%
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=ycentre");
fwrite(fid_final,"\n");
count_nodes_line = 0;
  
for j = 1:ycentre_size, % write ycentre
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",ycentre(j));
  if ( j < ycentre_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end



fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=zbottom");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:zbottom_size, % write zbottom
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",zbottom(j));
  if ( j < zbottom_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end

fwrite(fid_final,"**");
fwrite(fid_final,"\n");
fwrite(fid_final,"*Nset, nset=ztop");
fwrite(fid_final,"\n");
count_nodes_line = 0;
for j = 1:ztop_size, % write zbottom
  count_nodes_line = count_nodes_line + 1;
  fprintf(fid_final,"%d",ztop(j));
  if ( j < ztop_size )
    fprintf(fid_final,", ");
  end
  if ( count_nodes_line == 6 )
    count_nodes_line = 0;
    fprintf(fid_final,"\n");
  end
end
if ( count_nodes_line < 6 )
  fprintf(fid_final,"\n");
end

while ( ! feof(fid_elems) ) % write elems in input file
  text_line = fgetl(fid_elems);
  fputs(fid_final,text_line);
  fputs(fid_final,"\n");
end
fclose(fid_elems);
fclose(fid_final);
