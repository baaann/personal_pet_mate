<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
}

.container {
	width: 70%;
	min-width: 1000px;
	margin: auto;
	background-color: #ffffff;
}

.filter {
	display: flex;
	justify-content: space-between;
}

.filter-btn-div {
	display: flex;
	justify-content: flex-end;
	margin: 20px 0 20px 0;
}

.filter-btn-div>select {
	margin-left: 20px;
}

.filter>div {
	width: 33%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="filter-btn-div">
			<button class="filter-btn" onclick="toggleFilter()">필터</button>
			<select>
				<option>sort by 조회수</option>
				<option>sort by 인기순</option>
				<option>sort by 좋아요순</option>
			</select>
		</div>
		<div class="filter" id="filterDiv">
			<div class="category1">
				<h3>category1</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo == 0 }">
						<label><input type="checkbox" data-category-no="${list.categoryNo}"> ${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="category2">
				<h3>category2</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo == 2 || list.parentCategoryNo == 3 }">
						<label><input type="checkbox" data-parent-category-no="${list.parentCategoryNo }" data-category-no="${list.categoryNo }"> ${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="category3">
				<h3>category3</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo != 2 && list.parentCategoryNo != 3 && list.parentCategoryNo != 0 }">
						<label><input type="checkbox" data-parent-category-no="${list.parentCategoryNo }" data-category-no="${list.categoryNo }"> ${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<script>document.addEventListener('DOMContentLoaded', function() {
			    const topCategoryCheckboxes = document.querySelectorAll('.category1 input[type="checkbox"]');
			    const secondCategoryCheckboxes = document.querySelectorAll('.category2 input[type="checkbox"]');
			    const thirdCategoryCheckboxes = document.querySelectorAll('.category3 input[type="checkbox"]');

			    topCategoryCheckboxes.forEach(checkbox => {
			        checkbox.addEventListener('change', function() {
			            if (this.checked) {
			                topCategoryCheckboxes.forEach(otherCheckbox => {
			                    if (otherCheckbox !== this) otherCheckbox.disabled = true;
			                });

			                const categoryNo = this.getAttribute('data-category-no');

			                secondCategoryCheckboxes.forEach(secondCheckbox => {
			                    if (secondCheckbox.getAttribute('data-parent-category-no') === categoryNo) {
			                        secondCheckbox.disabled = false;
			                    } else {
			                        secondCheckbox.disabled = true;
			                        secondCheckbox.checked = false;
			                    }
			                });

			                thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                    thirdCheckbox.disabled = true;
			                    thirdCheckbox.checked = false;
			                });
			            } else {
			                topCategoryCheckboxes.forEach(otherCheckbox => otherCheckbox.disabled = false);
			                secondCategoryCheckboxes.forEach(secondCheckbox => secondCheckbox.disabled = false);
			                thirdCategoryCheckboxes.forEach(thirdCheckbox => thirdCheckbox.disabled = false);
			            }
			        });
			    });

			    secondCategoryCheckboxes.forEach(checkbox => {
			        checkbox.addEventListener('change', function() {
			            let activeCategory2 = [];
			            secondCategoryCheckboxes.forEach(secondCheckbox => {
			                if (secondCheckbox.checked) {
			                    activeCategory2.push(secondCheckbox.getAttribute('data-category-no'));
			                }
			            });

			            thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                if (activeCategory2.includes(thirdCheckbox.getAttribute('data-parent-category-no'))) {
			                    thirdCheckbox.disabled = false;
			                } else {
			                    thirdCheckbox.disabled = true;
			                    thirdCheckbox.checked = false;
			                }
			            });
			        });
			    });
			});
		</script>
		</div>
	</div>
</body>
</html>