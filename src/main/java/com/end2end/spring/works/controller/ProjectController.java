package com.end2end.spring.works.controller;

import com.end2end.spring.employee.dto.EmployeeDTO;
import com.end2end.spring.works.dto.ProjectDTO;

import com.end2end.spring.works.dto.ProjectInsertDTO;

import com.end2end.spring.works.service.ProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Map;

@RequestMapping("/project")
@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

        @RequestMapping("/main")
        public String main(Model model) {
            List<ProjectDTO> projects = projectService.selectAll();
            //진행상태별 프로젝트 수
            Map<String, Integer> projectStats = projectService.getProjectStatistics();
            model.addAttribute("projects", projects);
            model.addAttribute("stats", projectStats);
            return "works/worksmain";
        }

        @RequestMapping("/insert")
        public String insert(ProjectInsertDTO dto) {

            projectService.insert(dto);

            // TODO: 프로젝트 생성, 폼으로 보낼 예정
            return "redirect:/project/main";
        }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable int id, Model model) {
            ProjectDTO project = projectService.selectById(id);//프로젝트 아이디를 받아서 정보를 가져오도록
        model.addAttribute("project", project);
        return "works/projectDetail";
    }//프로젝트의 디테일 누르면 works 페이지로 가도록

    // Update
    @ResponseBody
    @RequestMapping("/update/{id}")
    public ProjectDTO updateForm(@PathVariable int id) {
        return projectService.selectById(id);
    }

    @RequestMapping("/update")
    public String update(@ModelAttribute ProjectDTO dto, Model model) {
        projectService.update(dto);
        return "redirect:/project/detail/" + dto.getId();
    }

    // Delete
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        projectService.deleteById(id);
        return "redirect:/project/main";
    }

    @RequestMapping("/search")
    public String selectByName(@RequestParam String name, Model model) {
        List<ProjectDTO> result = projectService.selectByName(name);
        model.addAttribute("projects", result);
        //jsp에서 검색해서 나오는 부분에 projects로 c:foreach로 풀어줘야됨
        return "works/worksmain";
    }
    @ResponseBody
    @RequestMapping("/searchUser")
    public List<EmployeeDTO> selectByUser(@RequestParam String name) {

        return    projectService.selectByUser(name);
    }

}
