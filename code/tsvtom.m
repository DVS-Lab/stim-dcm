function tsvtom(input_file, save_directory)
    R=readtable(input_file, "FileType","text","Delimiter","\t");
    for i=1:size(R(1,:),2)
        R.Properties.VariableNames(i) = "R"+i;
    end
    R=table2array(R);
    save(save_directory, "R");
end