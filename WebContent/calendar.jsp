<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.17.2/build/tabview/assets/skins/night/tabview.css">
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.17.2/build/datatable/assets/skins/night/datatable.css">
<script src="http://yui.yahooapis.com/3.18.1/build/yui/yui-min.js"></script>

</head>
<body> <!-- You need this skin class -->

<div id="demo" class="yui3-skin-sam yui3-g"> <!-- You need this skin class -->

  <div id="leftcolumn" class="yui3-u">
     <!-- Container for the calendar -->
     <div id="mycalendar"></div><br>
           Selected date: <span id="selecteddate"></span>
     
  </div>
  
</div>

<script type="text/javascript">
YUI().use('calendar', 'datatype-date', 'cssbutton',  function(Y) {

    // Create a new instance of calendar, placing it in
    // #mycalendar container, setting its width to 340px,
    // the flags for showing previous and next month's
    // dates in available empty cells to true, and setting
    // the date to today's date.
    var calendar = new Y.Calendar({
      contentBox: "#mycalendar",
      width:'340px',
      showPrevMonth: true,
      showNextMonth: true,
      date: new Date()}).render();

    // Get a reference to Y.DataType.Date
    var dtdate = Y.DataType.Date;

    // Listen to calendar's selectionChange event.
    calendar.on("selectionChange", function (ev) {

      // Get the date from the list of selected
      // dates returned with the event (since only
      // single selection is enabled by default,
      // we expect there to be only one date)
      var newDate = ev.newSelection[0];

      // Format the date and output it to a DOM
      // element.
      Y.one("#selecteddate").setHTML(dtdate.format(newDate));
    });


   
});
</script>
</body>
</html>