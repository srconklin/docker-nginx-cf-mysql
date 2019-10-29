<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ACF</title>
</head>
<body>
User Dump<p> 
	
<cfquery name="theQuery" datasource="dsmysql">
	select * from testtable
</cfquery>

<cfdump var="#theQuery#">

</body>
</html>