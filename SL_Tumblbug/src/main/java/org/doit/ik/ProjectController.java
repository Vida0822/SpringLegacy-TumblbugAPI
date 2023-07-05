package org.doit.ik;

import java.util.ArrayList;

import org.doit.ik.domain.File;
import org.doit.ik.domain.Project;
import org.doit.ik.service.ViewProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/tumblbug/*")
@Log4j
@AllArgsConstructor
public class ProjectController {
	
	private ViewProjectService viewProjectService ; 
	
	/* 핸들러 함수들 구현하세요 ~ */

	
	// 목록보기 핸들러 
	
	
	// 검색하기 핸들러 
	
	
	// 상세보기 핸들러 
	@GetMapping("/view")
	public void view(@RequestParam("pro_cd") String pro_cd
					, Model model) {
		log.info("> /tumblbug/view GET...");
		
		// 1. 프로젝트 얻어와서 
		Project project = viewProjectService.getProject(pro_cd) ; 	
		
		// 2. 대표이미지 
		model.addAttribute("imageFiles",viewProjectService.getImageFiles(project)) ;
		
		// 3. viewInfo
		model.addAttribute("viewInfo",viewProjectService.getViewInfo(project)) ;

		// 5. viewPlan 
		model.addAttribute("viewPlan",viewProjectService.getViewPlan(project)) ;
		
		
	
	} // view
	
	// 후원요청 핸들러 
	
	
	// 후원승인 핸들러 
	
	
	
	
	
}
