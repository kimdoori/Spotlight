<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/calendar.css">

</head>
<body> <!-- You need this skin class -->
<div id="v-cal">
			<div class="vcal-header">
				

				<div class="vcal-header__label" data-calendar-label="month">
					March 2017
				</div>


				
			</div>
			<div class="vcal-week">
				<span>Mon</span>
				<span>Tue</span>
				<span>Wed</span>
				<span>Thu</span>
				<span>Fri</span>
				<span>Sat</span>
				<span>Sun</span>
			</div>
			<div class="vcal-body" data-calendar-area="month"></div>
		</div>

		<p class="demo-picked">
			<span data-calendar-label="picked"id="selected-date" hidden="true"></span>
		</p>

		
	</div>
	<script src="js/calendar.js" type="text/javascript"></script>
	<script>
		window.addEventListener('load', function () {
			vanillaCalendar.init({
				disablePastDays: true
			});
		})
	</script>
</body>
</html>