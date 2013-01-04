function fileExistence( db )
%FILEEXISTENCE Adds a 'filesExist' column to the db.

    db.addEntries('filesExist',@f, 'prefix');

end

function bothExist = f(prefix)
    imageName = drawAFriendFileName(prefix, 'P');
    strokeFile = drawAFriendFileName(prefix, 'S');
    bothExist = {exist(strokeFile, 'file') && exist(imageName, 'file')};
end