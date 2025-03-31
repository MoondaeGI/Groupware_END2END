package com.end2end.spring.util;

import com.end2end.spring.file.dto.FileDTO;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class FileUtil {
    public static List<FileDTO> upload(String path, MultipartFile[] files) {
        String uploadPath = Statics.FILE_UPLOAD_PATH + path;

        File filePath = new File(uploadPath);

        filePath.mkdir();

        List<FileDTO> list = new ArrayList<>();
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue;
            }

            String systemFileName = UUID.randomUUID() + file.getOriginalFilename();
            try {
                file.transferTo(new File(uploadPath + "/" + systemFileName));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            FileDTO fileDTO = FileDTO.builder()
                    .originFileName(file.getOriginalFilename())
                    .systemFileName(systemFileName)
                    .fileSize(file.getSize())
                    .path(path + "/" + systemFileName)
                    .build();
            list.add(fileDTO);
        }

        return list;
    }

    public static void removeFile(String path) {
        File file = new File(path);

        if (file.exists()) {
            file.delete();
        }

        throw new IllegalArgumentException("해당 경로의 파일이 존재하지 않습니다.");
    }

    public static String uploadTempImage(MultipartFile file) throws IOException {
        String uploadPath = Statics.FILE_UPLOAD_PATH + "image";

        File filePath = new File(uploadPath);

        filePath.mkdir();

        String systemFileName = UUID.randomUUID() + file.getOriginalFilename();
        file.transferTo(new File(uploadPath + "/" + systemFileName));

        return "/files/image/" + systemFileName;
    }
}
