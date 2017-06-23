function [ ] = testscript
load('test_local.mat');
global p;
global r;
global st;
st=0;
color_feat={'colorhistrgb32',...
    'colorhistrgb64',...
    'colorhistrgb128',...
    'colorhistrgb256',...
    'colorhisthsv32',...
    'colorhisthsv64',...
    'colorhisthsv128',...
    'colorhisthsv256'};
texture_feat= {'EHD','HTD'};

clusters={test.cluster};
for i=1:numel(clusters)
    temp_ind=find(strcmp(clusters,clusters{i}));
    temp_ind(temp_ind==i)=[];
    relevance{i}=temp_ind;
   % display (relevance{i});
end
k=1;
for ii=1:numel(color_feat)
    
    for jj=1:(numel(texture_feat))-1
        option=[color_feat{ii} texture_feat{jj}];
        if ~isempty(option)
            options{k}=[option '_local'];
          %  options{k}=[option];
            k=k+1;
        end
    end
end

  for i=1:numel(options)
    disp(['Computing Precision and Recall measure for option ' num2str(i) ': {' options{i} '}+HTD ...']);
    evalc(['data=cell2mat({test.' options{i} '}'')']);
    Dist=squareform(pdist(data,'euclidean'));
    [v,ind]=sort(Dist,2);
    [precision{i},recall{i}]= compute_f(ind,relevance);
   %  disp(precision{i});
   %  disp(recall{i});
     %n=n+1;
     h=figure('Visible','off');
      %for k=1:10
       %  for id1=1:10
        %    for id2=1:10
         %       subplot(10,10,(id1-1)*10+id2);imshow(imread(test(ind(id1+(k-1)*10,id2)).filename));title(num2str(v(id1+(k-1)*10,id2)),'fontsize',5);
          %   end
         %end
          % print(h,['Results_' options{i} filesep num2str(k)  '.jpg'],'-djpeg');
       %  k
    % end
end

%p = sum(precision{i});
%r = sum(recall{i});

save('PreRecall.mat', 'precision','recall');
%load('PreRecall.mat');
p=0;
r=0;
for i=1:numel(options)
    %st=sum(precision{i});
    p=p+sum(precision{i}(:));
    r=r+sum(recall{i}(:));
%    display(p./100);
%    display(r./100);
end
   display((p/100)/8);
   display((r/100)/8);
%figure(10);
%cc=hsv(numel(options));
%for i=1:numel(options)
%hold on;
%h=plot([1:100],F{i},'color',cc(i,:));
%legend(h,num2str(i),'location','southeast');
%end
%title('F-measure ');
%hold off;

figure(10);
cc=hsv(numel(options));
for i=1:numel(options)
hold on;
h=plot([1:100],precision{i},'color',cc(i,:));
%legend(h,num2str(i),'location','southeast',8);
%disp({'Precision:' sum(precision{i})});
end
title('Precision');
hold off;

figure(20);
cc=hsv(numel(options));
for i=1:numel(options)
hold on;
h=plot([1:100],recall{i},'color',cc(i,:));
%legend(h,num2str(i),'location','southeast');
end
title('Recall');
hold off;

end

