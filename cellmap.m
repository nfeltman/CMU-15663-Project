function res = cellmap( f, a)
    if ( size(a,1) > 0 )
        res = cellfun(f, a,'UniformOutput',false);
    else
       res = {}; 
    end
end

