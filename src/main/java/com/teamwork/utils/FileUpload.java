package com.teamwork.utils;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

public class FileUpload {


    /**
     * 上传单个文件
     * @param file 文件
     * @return 新文件名
     */
    public static String uploadOne(CommonsMultipartFile file, HttpServletRequest req){
        String path = req.getSession().getServletContext().getRealPath("upload");
        if (!file.isEmpty()) {
            String uploadFileName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            String fileName = uuid + uploadFileName;
            File targetFile = new File(path, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                file.transferTo(targetFile);
                return fileName;
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return "-1";

    }
}
