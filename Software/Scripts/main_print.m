function main_print(text,type)
    global Self

    if Self.run_print == 1
        newline = '\n';
        fid = 1; 
        fprintf(fid,strcat(text,newline));
    end

    if Self.run_file == 1
        newline = '\r\n';
        c = clock;
        filename = strcat("output_",sprintf('%04d', c(1)),sprintf('%02d', c(2)),sprintf('%02d', c(3)),'.txt');
        foldername = pwd + "\Results\";
        fid = fopen(strcat(foldername,filename), type);
        fprintf(fid,strcat(text,newline));
    end    
end