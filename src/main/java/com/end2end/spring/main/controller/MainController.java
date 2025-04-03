package com.end2end.spring.main.controller;

import com.end2end.spring.employee.dto.EmployeeDTO;
import com.end2end.spring.employee.dto.EmployeeDetailDTO;
import com.end2end.spring.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/")
	public String home() {
		return "main/index";
	}

	@RequestMapping("/mypage/{employeeId}")
	public String toMyPage(@PathVariable String employeeId, HttpSession session, Model model) {
		// TODO: 해당 사원의 마이페이지 출력

		EmployeeDTO loginUser = (EmployeeDTO) session.getAttribute("loginUser");

		if (loginUser == null || !loginUser.getId().equals(employeeId)) {
			return "redirect:/";
		}
		EmployeeDetailDTO employee = employeeService.selectDetailById(employeeId);
		model.addAttribute("employee", employee);
		return "main/mypage";
	}

	@RequestMapping("/contact")
	public String toContact() {
		// TODO: 연락처 페이지 출력
		return "main/contact";
	}

	@RequestMapping("/worktree")
	public String toWorktree() {
		// TODO: 조직도 페이지 출력
		return "main/worktree";
	}
}