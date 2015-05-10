function turnGraphOff(handle_name,isOff)
if (isOff)
    set(handle_name, 'visible','off');
else
    set(handle_name,'visible','on');
end