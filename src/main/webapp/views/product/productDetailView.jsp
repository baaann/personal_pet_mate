<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel=“stylesheet”
	href=“https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css”>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>제품 상세페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/style.css"
	type="text/css">
</head>
<style>
body {
	background-color: white;
	font-family: 'Cairo', sans-serif;
}

.product-details {
	padding: 30px 0;
}

.product__details__pic__item--large{
	max-width: 100%;
	height: 475px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
    overflow: hidden;
}

.product__details__text {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.product__details__text h3 {
	font-size: 36px;
	color: #333;
	margin-bottom: 10px;
}

.product__details__productName h4{
	font-size: 24px; /* 제품 가격 텍스트 크기를 줄입니다. */
    margin-top: 10px; /* 아래로 조금 내립니다. */
}

.product__details__text ul {
	list-style: none;
	padding: 0;
}

.product__details__text ul li {
    font-size: 16px;
    color: black;
    margin-bottom: 10px;
    position: relative;
}

.nav-tabs .nav-link {
	font-size: 16px;
	color: #333;
	border: none;
	padding: 15px 20px;
	border-radius: 0;
}

.nav-tabs .nav-link.active {
	background-color: #e74c3c;
	color: #fff;
}

.tab-pane {
	padding: 20px;
	background-color: #fff;
	border: 1px solid #e7e7e7;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	margin-top: 20px;
}

.product__details__tab .nav-link {
    background-color: transparent;
    color: rgb(137, 114, 91);
    border: none;
    transition: background-color 0.3s, color 0.3s;
}

.product__details__tab .nav-link.active {
    background-color: transparent;
    color: #677E52
}

#productPrice {
    color: #B7CA79;
    font-size: 24px;
}

.product__details__tab {
	padding: 0;
}

.col-lg-12{
	margin-top:40px;
}

#subImg{
	width:100%;
	height:auto;
}
.check-img{
	margin-right:10px;
	width:16px;
	height:16px;
}

</style>

<body>
	 <%@include file="../common/menubar.jsp"%>
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
						
						<c:forEach items="${phList }" var="ph" varStatus="vs">
							<c:if test="${vs.index eq 0 }">
									<img id="mainImg" class="product__details__pic__item--large"
										src="${contextPath}${ph.filePath}${ph.changeName}" alt="상품이미지">
							</c:if>			
						</c:forEach>
						
						</div>			
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${p.productBrand }</h3>
						<!-- 별점 -->
						<!-- <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div> -->
                        <br>
						<div class="product__details__productName">
							<h4>${p.productName }</h4>
						</div>
						<ul>
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품가격</b>
								<div>${p.productPrice }원</div></li>
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품성분</b>
								<div>${p.productIngredient }</div></li>
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품설명</b>
								<div>${p.productInfo }</div></li>
						</ul>
					</div>
				</div>
				
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">
									제품 상세</a></li>
							<li class="nav-item"><a class="nav-link" 
								data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">
									제품 리뷰</a></li>		
						</ul>
						<div align="right"><button>리뷰 작성</button></div>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab">
								
								<c:forEach items="${phList }" var="ph" varStatus="vs">
									<c:if test="${vs.index eq 1 }">
										<img id="subImg"
										src="${contextPath}${ph.filePath}${ph.changeName}" alt="상품상세이미지">
									</c:if>	
								</c:forEach>	
								
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__review__tab">
									<c:forEach items="${prList }" var="pr">
										<div class="tab-content">
										${pr.reviewContent }
										<c:if test="${pr.imgSrc != null }">
										
										<img id="subImg" src="${contextPath}${pr.imgSrc}">
										</c:if>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
	<script>
	//이미지를 읽어줄 함수 
            function loadImg(inputFile,num){
                //inputFile : 이벤트가 발생된 요소 객체 
                console.log(inputFile.files);
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면 
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    var reader = new FileReader();
                    //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
                    //해당 파일을 읽어서 고유한 url을 부여해주는 메소드 
                    //반환받은 url을 미리보기 화면에 넣어주면 된다. 
                    reader.readAsDataURL(inputFile.files[0]);

                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                        console.log(e);
                        //이벤트 객체에서 reader가 부여한 고유 url 정보 
                        //event.target.result 
                        console.log(e.target.result);

                        switch(num){
                            case 1: $("#subImg").attr("src",e.target.result); break;
                        }

                    }

                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#subImg").attr("src",null); break;
                        }

                }
            }

	</script>
	<!-- Js Plugins -->
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery-3.3.1.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/bootstrap.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery.nice-select.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery-ui.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery.slicknav.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/mixitup.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/owl.carousel.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/main.js"></script>


</body>

</html>

