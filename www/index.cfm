<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ACF</title>
</head>
<body>
User Dump it now<p> 
	
<cfquery name="theQuery" datasource="project_db">
	select * from users
</cfquery>

<cfdump var="#theQuery#">

</body>
</html>