<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>


		
		<!-- BODY  -->
		<div
			class="ProjectIntroduction__ProjectIntroductionBackground-sc-1o2ojgb-0 hklIjO">
			<div class="Container-gci8y7-0 cXaiVs">
				<div
					class="ProjectIntroduction__ProjectIntroductionWrapper-sc-1o2ojgb-1 uWOBe">
					<div
						class="ProjectIntroduction__ProjectOutline-sc-1o2ojgb-2 isPUOq">
						<div
							class="ProjectIntroduction__ProjectOutlineInner-sc-1o2ojgb-3 kaynwN">
							<a ><span	class="ProjectIntroduction__ProjectCategory-sc-1o2ojgb-4 jXHjuM">${viewInfo.detailCategory.dtl_ctg_name}</span></a>
							<h1 class="ProjectIntroduction__ProjectTitle-sc-1o2ojgb-5 kqbFTJ">${viewInfo.pro_long}</h1>
						</div>
							<script>
								function pageGoPost(d) {
									var insdoc = "";
								
									for (var i = 0; i < d.vals.length; i++) {
										insdoc += "<input type='hidden' name='"+ d.vals[i][0] +"' value='"+ d.vals[i][1] +"'>";
									}
								
									var goform = $("<form>", {
										method : "post",
										action : d.url,
										target : d.target,
										html : insdoc
									}).appendTo("body");
								
									goform.submit();
								} // pageGoPost
						
								$("div.hklIjO div a span").on("click", function(event) {
									//      location.href = "/tumblbug/listProject.do?searchCondition=1&searchWord="+ $(this).text();
									pageGoPost({
										url : "/tumblbug/listProject.do", //이동할 페이지
										target : "_self",
										vals : [ //전달할 인수들
										[ "searchCondition", 2 ], [ "searchWord", $(this).text() ] ]
									}); // pageGoPost
								}); // click
							</script>
					</div>
					
					

					
					<!--  
						1) forEach로 뽑으면서 현재 페이지, 다음페이지 속성 부여 
						2) 그 다음에 버튼 눌러서 슬라이드 바뀌는건 스크립트로 처리 
					그냥 출력만하고 함수 실행 
					준비물 : 전체 슬라이드를 감싸는 div / 이미지 하나를 감싸는 div 
					 -->
					<div class="ProjectIntroduction__ProjectIntroductionMainColumn-sc-1o2ojgb-6 fRlUoX">
						<figure class="ProjectIntroduction__ProjectCoverImageFigure-sc-1o2ojgb-7 fgDPID">
							<div class="IntroVisualSlider__StyledIntroVisualSliderWrapper-pp5lw8-0 eDUSLX">
								
								<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
									<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
									
										<!--
										<div class="swiper-slide swiper-slide-active" style="width: 594px;">
											<div class="IntroVisualSlider__ProjectCoverImage-pp5lw8-2 hkjzEV">
												<img src="" alt="프로젝트 커버 이미지">
											</div>
										</div>
										
										<div class="swiper-slide swiper-slide-next"	style="width: 594px;">
											<div class="IntroVisualSlider__ProjectCoverImage-pp5lw8-2 hkjzEV">
												<img src="" alt="프로젝트 커버 이미지">
											</div>
										</div>
										-->
										
										<c:forEach var="image" items="${imageFiles}" varStatus="status">								
											<div class="swiper-slide"	style="width: 594px;">
												<div class="IntroVisualSlider__ProjectCoverImage-pp5lw8-2 hkjzEV">
													<img src="${image.af_path}" alt="프로젝트 커버 이미지">
												</div>
											</div>
										</c:forEach>
									</div>
									<!-- pagination : 아래 ...  -->
									<div class="swiper-pagination swiper-pagination-bullets">
										<!-- <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
												<span	class="swiper-pagination-bullet"> </span> -->
										<c:forEach var="image" items="${imageFiles}" varStatus="status">								
											<span	class="swiper-pagination-bullet" onclick="dotSlide(${status.index})"> </span>
										</c:forEach>
									</div>
								</div>
								<!--  prev, next 버튼  -->
								<div class="swiper-button-prev"  onclick="changeSlide(-1)">
									<div name="arrow1-left" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs">
										<svg viewBox="0 0 48 48">	<path fill-rule="evenodd" clip-rule="evenodd" d="M32.8912 45.3014L12 23.913L32.8912 2.52471C33.5866 1.8251 34.7804 1.8251 35.4777 2.52471C36.1741 3.22333 36.1741 4.42368 35.4777 5.22224L17.1731 23.913L35.4777 42.7018C36.1741 43.4024 36.1741 44.6018 35.4777 45.4013C35.0788 45.8011 34.6819 46 34.1845 46C33.7855 45.9011 33.2881 45.7002 32.8912 45.3014Z"></path></svg>
									</div>
								</div>
								
								<div class="swiper-button-next" onclick="changeSlide(1)">
									<div name="arrow1-right"
										class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs">
										<svg viewBox="0 0 48 48">
											<path fill-rule="evenodd" clip-rule="evenodd"	d="M13.9071 46C13.4118 46 12.9164 45.8001 12.6192 45.4003C11.9257 44.7007 11.9257 43.5014 12.6192 42.7019L30.8493 24.0125L12.5201 5.22317C11.8266 4.52357 11.8266 3.32425 12.5201 2.5247C13.2136 1.8251 14.3034 1.8251 15.096 2.5247L36 24.0125L15.195 45.4003C14.7988 45.8001 14.3034 46 13.9071 46Z"></path></svg>
									</div>
								</div>
								<script>
								var size = ${imageFiles}.size()
								showSlides(0);
								function showSlides(slideIndex) { 
									// 모두 초기화 하는 함수 
									$(".swiper-wrapper .swiper-slide").css("display", "none");
									// 전체 감싸고 있는 div 태그 
									$(".swiper-pagination-bullets span.swiper-pagination-bullet").removeClass("swiper-pagination-bullet-active"); 
									
									// 0번째 슬라이드만 나타나게끔 
									$(".swiper-wrapper .swiper-slide")
										.eq(slideIndex)
										.css("display", "block"); 
									$(".swiper-pagination-bullets span.swiper-pagination-bullet")
										.eq(slideIndex)
										.addClass("swiper-pagination-bullet-active");
								} // showSlides
								
								// <> 
								function changeSlide(value) { // prev를 누르면 -1이, next를 누르면 1이 넘어감 
									slideIndex += value; 
									var size = <%= ((ArrayList)request.getAttribute("imageFiles")).size()%>
									if(slideIndex == size+1) slideIndex=0;
									else if(slideIndex == -1) slideIndex=2;
									
									showSlides(slideIndex);
								}
									
								// ooo 
								function dotSlide(value) {
									slideIndex = value; 
									showSlides(slideIndex);
								}
								
								</script>
								
							</div>
						</figure>
					</div>
					
					
					<aside
						class="ProjectIntroduction__ProjectIntroductionSubColumn-sc-1o2ojgb-10 golXvD">
						<div
							class="ProjectIntroduction__FundingStatus-sc-1o2ojgb-11 ksxAKQ">
							<div class="ProjectIntroduction__Metric-sc-1o2ojgb-12 jCWvvC">
								<div
									class="ProjectIntroduction__StatusTitle-sc-1o2ojgb-13 deuGqH">모인금액</div>
								<div
									class="ProjectIntroduction__StatusValue-sc-1o2ojgb-14 gMNqnP">
									<span class="ProjectIntroduction__Price-sc-1o2ojgb-15 jSZJkM">
										<fmt:formatNumber value="${viewInfo.paySum}" pattern="#,###" />
										<span	class="ProjectIntroduction__Small-sc-1o2ojgb-17 jICRKo">원</span>
									</span>
									<span	class="ProjectIntroduction__FundingRate-sc-1o2ojgb-16 hcxUDh">${viewInfo.ach_rate}%</span>
								</div>
							</div>
							<div class="ProjectIntroduction__Metric-sc-1o2ojgb-12 jCWvvC">
								<div
									class="ProjectIntroduction__StatusTitle-sc-1o2ojgb-13 deuGqH">남은시간</div>
								<div
									class="ProjectIntroduction__StatusValue-sc-1o2ojgb-14 gMNqnP"> ${viewInfo.left_days}
									<span class="ProjectIntroduction__Small-sc-1o2ojgb-17 jICRKo">일</span>
								</div>
							</div>
							<div class="ProjectIntroduction__Metric-sc-1o2ojgb-12 jCWvvC">
								<div
									class="ProjectIntroduction__StatusTitle-sc-1o2ojgb-13 deuGqH">후원자</div>
								<div
									class="ProjectIntroduction__StatusValue-sc-1o2ojgb-14 gMNqnP">${viewInfo.pro_sup}<span
										class="ProjectIntroduction__Small-sc-1o2ojgb-17 jICRKo">명</span>
								</div>
							</div>
						</div>
						
						<div class="FundingInformation__Wrap-cjd67l-0 knPpdw">
							<div class="FundingInformation__InfoWrap-cjd67l-1 iFJnVr">
								<dl class="FundingInformation__InfoItem-cjd67l-2 jpWwDl">
									<dt class="FundingInformation__Title-cjd67l-3 hyqDdj">목표금액</dt>
									<dd class="FundingInformation__Desc-cjd67l-4 hiQvph">
										<fmt:formatNumber value="${viewInfo.pro_price}" pattern="#,###" /> 원
									</dd>
								</dl>
								<dl class="FundingInformation__InfoItem-cjd67l-2 jpWwDl">
									<dt class="FundingInformation__Title-cjd67l-3 hyqDdj">펀딩	기간</dt>
									<dd class="FundingInformation__Desc-cjd67l-4 hiQvph">
											<fmt:formatDate value="${viewInfo.pro_start}" pattern="yyyy.MM.dd" />
												~
											<fmt:formatDate value="${viewInfo.pro_end}" pattern="yyyy.MM.dd" />
										<span	class="FundingInformation__DdayLabel-cjd67l-5 hyEFUc">${viewInfo.left_days}일 남음</span>
									</dd>
								</dl>
								<dl class="FundingInformation__InfoItem-cjd67l-2 jpWwDl">
									<dt class="FundingInformation__Title-cjd67l-3 hyqDdj">결제</dt>
									<dd class="FundingInformation__Desc-cjd67l-4 hiQvph">
										목표금액 달성시 
										<fmt:formatDate value="${viewInfo.pay_date}" pattern="yyyy.MM.dd" />
										에 결제 진행
									</dd>
								</dl>
							</div>
						</div>
						

</body>
</html>