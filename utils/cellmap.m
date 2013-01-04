function res = cellmap( f, varargin)
    if ( size(varargin{1},1) > 0 )
        res = cellfun(f, varargin{1:end},'UniformOutput',false);
    else
       res = {}; 
    end
end

