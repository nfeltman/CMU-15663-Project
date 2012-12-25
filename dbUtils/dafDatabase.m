classdef dafDatabase < handle
    %DAFDATABASE Manage a database for DrawAFriend.
    %   Detailed explanation goes here
    
    properties
        m;
        vals;
    end
    
    methods
        function obj = dafDatabase(roundsfile)
            [ objectID, drawerID, guesserID, modelID, newset, accuracy ] = drawAFriendMetaData(roundsfile);
            obj.m = containers.Map();
            n = size(objectID,1);
            obj.vals = cell(n,6);
            obj.m('prefix') = 1;
            obj.vals(:,1) = mat2cell(objectID,ones(n,1),size(objectID,2));
            obj.m('drawerID') = 2;
            obj.vals(:,2) = mat2cell(drawerID,ones(n,1));
            obj.m('guesserID') = 3;
            obj.vals(:,3) = mat2cell(guesserID,ones(n,1));
            obj.m('modelID') = 4;
            obj.vals(:,4) = mat2cell(modelID,ones(n,1));
            obj.m('newset') = 5;
            obj.vals(:,5) = mat2cell(newset,ones(n,1));
            obj.m('accuracy') = 6;
            obj.vals(:,6) = mat2cell(accuracy,ones(n,1));
        end
        function res = getAll(obj, varargin)
            argnums = cell2mat(cellmap(@(name) obj.m(name),varargin));
            res = obj.vals(:,argnums);
        end
        function res = mapAll(obj,f,varargin)
            argnums = cell2mat(cellmap(@(name) obj.m(name),varargin));
            n = size(obj.vals,1);
            for k = n:-1:1,
                a = f(obj.vals{k,argnums});
                res(k,:) = a;
            end
        end
        function addEntries(obj,newEntries,f,varargin)
            if ischar(newEntries)
                newEntries = {newEntries};
            end
            if ~iscell(newEntries) && size(newEntries,1) ~= 1,
                error('The new entries list must be a 1-by-n cell array.');
            end
            numNew = size(newEntries,2);
            n = size(obj.vals,1);
            newargnums = (1:numNew) + size(obj.vals,2);
            for k = 1:numNew,
                if ~ischar(newEntries{k})
                    error('One of the entry names is not a string.');
                end
                if obj.m.isKey(newEntries{k}),
                    error(['Already have the key ' newEntries{k}]);
                end
            end
            for k = 1:numNew,
                obj.m(newEntries{k}) = newargnums(k);
            end
            argnums = cell2mat(cellmap(@(name) obj.m(name),varargin));
            for k = n:-1:1,
                a = f(obj.vals{k,argnums});
                obj.vals(k,newargnums) = a;
            end
        end
        function k = keys(obj)
            k = obj.m.keys;
        end
    end
    
end

