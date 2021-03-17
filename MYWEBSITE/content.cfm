<!---<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>New Content</title>
</head>

<body>
<!---<div>Title</div>
<div>Article Text</div>--->
	<cfparam name="contentid" default="">

		<cfquery name="whatContent" datasource="#application.dsource#">
		select * from content where contentid='#contentid#'
		</cfquery>

		<cfif contentid neq '' and whatContent.recordcount gt 0>
			<cfoutput>
				<legend style="text-align: center">#whatContent.title[1]#</legend>
				<div style="text-align: center">#whatContent.description[1]#</div>
			</cfoutput>
		<cfelse>
		<div style="text-align: center">Sorry, we couldn't find what you were looking for. Please Try again.</div>
		</cfif> 
	
</body>
</html>--->

<cfparam name="content" default="" />

<cfif content neq ''>
    <cfquery name="article" datasource="#application.dsource#">
        select * from content where contentid='#content#'
    </cfquery>

    <cfoutput>
        <div>
            #article.title#
        </div>
        <div>
            #article.description#
        </div>
    </cfoutput>
<cfelse>
    Please, see our books.
</cfif>
