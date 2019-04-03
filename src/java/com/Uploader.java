package com;
import java.io.*;
import org.apache.commons.fileupload.*;

public class Uploader {
    public static boolean processFile(String path,FileItemStream fis,String fname)
    {
        File f=new File(path);
        if(!f.exists())
        {
            f.mkdir();
        }
        try
        {
            File saveFile=new File(f.getAbsolutePath()+File.separator+fname+".jpg");
            FileOutputStream fos=new FileOutputStream(saveFile);
            byte[]b=new byte[1024];
            InputStream is=fis.openStream();
            int x=0;
            while((x=is.read(b))!=-1)
            {
                fos.write(b, 0, x);
            }
            fos.flush();
            fos.close();
            return true;
        }
        catch(FileNotFoundException fnfe)
        {
            fnfe.printStackTrace();
        }
        catch(IOException ioe)
        {
            ioe.printStackTrace();
        }
        return false;
    }
}
