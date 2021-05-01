path = 'trainSet/';
% I = imread('HB03335.JPG');
% figure,imshow(I)
% newImg = ImageProc('HB03335.JPG');
% figure,imshow(newImg)

% figure, imshow(newImg2)
D = '17_DEG/17_DEG';
% D = 'full path to the main folder';
S = dir(fullfile(D,'*'));
N = setdiff({S([S.isdir]).name},{'.','..'}); % list of subfolders of D.
% % disp(N)
for ii = 1:numel(N)
    T = dir(fullfile(D,N{ii},'*')); % improve by specifying the file extension.
    C = {T(~[T.isdir]).name}; % files in subfolder.
    disp(N{ii});
    for jj = 1:numel(C)
      if (endsWith(C{jj},'JPG'))
         F = fullfile(D,N{ii},C{jj});
         disp(F);
         procImg = ImageProc(F);
         savePath = strcat('emptyTemplate/emptyTemplate/',N{ii},'/',C{jj});
         imwrite(procImg, savePath);
      end
        % do whatever with file F.
    end
end