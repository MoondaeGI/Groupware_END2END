package com.end2end.spring.file.controller;

import com.end2end.spring.file.dto.FileDTO;
import com.end2end.spring.file.dto.FileDetailDTO;
import com.end2end.spring.file.service.FileService;
import com.end2end.spring.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RequestMapping("/file")
@Controller
public class FileController {
    @Autowired
    private FileService fileService;

    @ResponseBody
    @RequestMapping("/upload/image")
    public String uploadImage(MultipartFile file) {
        try {
            return FileUtil.uploadImage(file);
        } catch (IOException e) {
            return e.getMessage();
        }
    }

    @ResponseBody
    @RequestMapping("/delete/image/{path}")
    public void deleteImage(@PathVariable String path) {
        // TODO: 이미지 지우기
    }

    @RequestMapping("/download")
    public void download(String path) {
        // TODO: 다운로드
    }

    @ResponseBody
    @RequestMapping("/delete")
    public void delete(String path) {
        fileService.removeByPath(path);
    }

    @RequestMapping("/select/test")
    public String selectByParentsId() {
        FileDTO dto = FileDTO.builder()
                .approvalId("1")
                .build();
        List<FileDetailDTO> result = fileService.selectByParentsId(dto);

        for(FileDetailDTO fileDetailDTO : result) {
            System.out.println(fileDetailDTO.getSystemFileName());
        }

        return "redirect:/";
    }
}
