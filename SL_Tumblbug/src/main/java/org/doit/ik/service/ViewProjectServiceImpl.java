package org.doit.ik.service;

import java.util.ArrayList;
import java.util.Date;

import org.doit.ik.domain.DetailCategory;
import org.doit.ik.domain.File;
import org.doit.ik.domain.Plan;
import org.doit.ik.domain.Policy;
import org.doit.ik.domain.Project;
import org.doit.ik.domain.ViewInfo;
import org.doit.ik.domain.ViewPlan;
import org.doit.ik.mapper.MemberMapper;
import org.doit.ik.mapper.ProjectMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ViewProjectServiceImpl implements ViewProjectService {
	
	private ProjectMapper projectMapper ; 
	private MemberMapper memberMapper ; 
	
	// 프로젝트 얻어오기 
	@Override
	public Project getProject(String pro_cd) {
		log.info("> ViewProjectServiceImpl.getProject()...");
		return this.projectMapper.getProject(pro_cd) ;
	} // getProject
	
	
	
	// 프로젝트 기본정보 
	@Override
	public ViewInfo getViewInfo(Project project) {
		
		// 해당 프로젝트의 세부카테고리 객체 (프로젝트가 아닌 이유: 중분류 name 값 얻어오기 위함 ) 
		ViewInfo viewInfo  = null; // 결과 객체 
		
		// 세부 카테고리 이름 (mapper 필요)
		DetailCategory detailCategory = projectMapper.getDetailCategory(project.getPro_cd());

		// 긴제목
		String pro_long = project.getPro_long();
		
		// 대표이미지  (mapper 필요)
		ArrayList<File> imageFiles = projectMapper.getImageFiles( project.getPro_cd()); 
		
		// 모인금액  (mapper 필요)
		int paySum = projectMapper.getPaySum( project.getPro_cd()); 
		
		// 달성률
		int ach_rate =   (int)(paySum/(float)project.getPro_price()*100);  
		
		// 남은기간 
		int left_days = (int) ((project.getPro_end().getTime() - new Date().getTime())/1000/60/60/24)+1;
		
		// 후원자수 
		int pro_sup = project.getPro_sup(); 
		
		// 목표금액
		int pro_price = project.getPro_price(); 
		
		// 시작일 
		Date pro_start = project.getPro_start();
		
		// 종료일 
		Date pro_end = project.getPro_end(); 
		
		// 결제 예상일 = 종료일 + 하루 
		long oneday = 24L * 60 * 60 * 1000 ; 
		Date pay_date = new Date( pro_end.getTime() +oneday); 
		// System.out.println(pay_date.toString());
		
		
		return new ViewInfo(
						detailCategory
						, pro_long
						, imageFiles
						, paySum 
						, ach_rate
						, left_days
						, pro_sup
						, pro_price
						, pro_start
						, pro_end
						, pay_date);		
	}


	@Override
	public ArrayList<File> getImageFiles(Project project) {
		log.info("> ViewProjectServiceImpl.getImageFiles()...");
		return  projectMapper.getImageFiles( project.getPro_cd()); 
	}

	@Override
	public ViewPlan getViewPlan(Project project) {
		
		log.info("> ViewProjectServiceImpl.getViewPlan()...");
		
		Plan projectPlan = projectMapper.getProjectPlan(project.getPro_cd()); 
		Policy policy = projectMapper.getPolicy( project.getPro_cd()); 
	
		return new ViewPlan(projectPlan,policy) ; 
		
	} // getViewInfo
	
	

} // ViewProjectServiceImpl
