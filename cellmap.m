function res = cellmap( f, a)
    res = cellfun(f, a,'UniformOutput',false);
end

