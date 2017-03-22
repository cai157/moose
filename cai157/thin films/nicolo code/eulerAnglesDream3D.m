fid_elset = fopen("Job-1_elset.inp","r");
grainElem = zeros(1,1);
Ngrains = 0;
Nelems = 0;
grain_index = 0;
beginGrain = 0;
while ( ! feof(fid_elset) )
  text_line = fgetl(fid_elset);
  if ( strncmp(text_line,"*Elset, elset=Grain",19) ) % new grain found
    beginGrain = 1;
    Ngrains++;
    grain_index = Ngrains;
    Nelems = 0;
  else
    if ( strncmp(text_line,"**",2) )
      beginGrain = 0;
    end
    if ( beginGrain ) % get elements
      elems_line = strsplit(text_line,', ');
      elems_line_split = str2double(elems_line);
      elems_line_size = size(elems_line_split);
      elems_line_size = elems_line_size(2);
      for el = 1:elems_line_size,
        grainElem(grain_index,Nelems+el) = elems_line_split(el);
      end
      Nelems = Nelems + elems_line_size;
    end
  end
end
fclose(fid_elset);


load("euler_ang_file.txt"); % check that number of lines is number of grains
grainangle_no_order = zeros(1,4); % element, Euler Angles (not ordered)
count = 0;
for j = 1:sizecsvgrain1j,
  for k = 1:sizecsvgrain1k,
    if ( grain1(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain1(j,k);
      grainangle_no_order(count,2) = euler_ang_file(1,1);
      grainangle_no_order(count,3) = euler_ang_file(1,2);
      grainangle_no_order(count,4) = euler_ang_file(1,3);
    end
  end
end
for j = 1:sizecsvgrain2j,
  for k = 1:sizecsvgrain2k,
    if ( grain2(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain2(j,k);
      grainangle_no_order(count,2) = euler_ang_file(2,1);
      grainangle_no_order(count,3) = euler_ang_file(2,2);
      grainangle_no_order(count,4) = euler_ang_file(2,3);
    end
  end
end
for j = 1:sizecsvgrain3j,
  for k = 1:sizecsvgrain3k,
    if ( grain3(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain3(j,k);
      grainangle_no_order(count,2) = euler_ang_file(3,1);
      grainangle_no_order(count,3) = euler_ang_file(3,2);
      grainangle_no_order(count,4) = euler_ang_file(3,3);
    end
  end
end
for j = 1:sizecsvgrain4j,
  for k = 1:sizecsvgrain4k,
    if ( grain4(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain4(j,k);
      grainangle_no_order(count,2) = euler_ang_file(4,1);
      grainangle_no_order(count,3) = euler_ang_file(4,2);
      grainangle_no_order(count,4) = euler_ang_file(4,3);
    end
  end
end
for j = 1:sizecsvgrain5j,
  for k = 1:sizecsvgrain5k,
    if ( grain5(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain5(j,k);
      grainangle_no_order(count,2) = euler_ang_file(5,1);
      grainangle_no_order(count,3) = euler_ang_file(5,2);
      grainangle_no_order(count,4) = euler_ang_file(5,3);
    end
  end
end
for j = 1:sizecsvgrain6j,
  for k = 1:sizecsvgrain6k,
    if ( grain6(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain6(j,k);
      grainangle_no_order(count,2) = euler_ang_file(6,1);
      grainangle_no_order(count,3) = euler_ang_file(6,2);
      grainangle_no_order(count,4) = euler_ang_file(6,3);
    end
  end
end
for j = 1:sizecsvgrain7j,
  for k = 1:sizecsvgrain7k,
    if ( grain7(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain7(j,k);
      grainangle_no_order(count,2) = euler_ang_file(7,1);
      grainangle_no_order(count,3) = euler_ang_file(7,2);
      grainangle_no_order(count,4) = euler_ang_file(7,3);
    end
  end
end
for j = 1:sizecsvgrain8j,
  for k = 1:sizecsvgrain8k,
    if ( grain8(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain8(j,k);
      grainangle_no_order(count,2) = euler_ang_file(8,1);
      grainangle_no_order(count,3) = euler_ang_file(8,2);
      grainangle_no_order(count,4) = euler_ang_file(8,3);
    end
  end
end
for j = 1:sizecsvgrain9j,
  for k = 1:sizecsvgrain9k,
    if ( grain9(j,k) != 0 )
      count = count + 1;
      grainangle_no_order(count,1) = grain9(j,k);
      grainangle_no_order(count,2) = euler_ang_file(9,1);
      grainangle_no_order(count,3) = euler_ang_file(9,2);
      grainangle_no_order(count,4) = euler_ang_file(9,3);
    end
  end
end
% ordering
number_of_elements = 4000;
grainangle_ordered = zeros(number_of_elements,4);
for el = 1:number_of_elements,
  for el2 = 1:number_of_elements,
    if ( grainangle_no_order(el2,1) == el )
      grainangle_ordered(el,1:4) = grainangle_no_order(el2,1:4);
    end
  end
end
fid = fopen("euler_ang_file_new.txt","w");
for el = 1:number_of_elements,
  fprintf(fid,"%f %f %f \n",grainangle_ordered(el,2),grainangle_ordered(el,3),grainangle_ordered(el,4));
end
fclose(fid);
