%% ---- Clip function to clip out the text Horizontally and vertically---%%
function image_out=clip(image_in)
[r c]=find(image_in);
image_out=image_in(min(r):max(r),min(c):max(c));
end