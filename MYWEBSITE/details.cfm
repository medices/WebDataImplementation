<cfparam  name="searchme" default="" />

<cfset bookinfo = makeQuery()>
<cfoutput>
  <cfif bookinfo.recordcount eq 0>
    #noResults()#
    <cfelseif bookinfo.recordcount eq 1>
      #oneResult()#
    <cfelse>
      #manyResults()#
  </cfif>
</cfoutput>

<!-----<cfdump  var="#bookinfo#">----->

<!--- Functions --->
<cffunction  name="makeQuery">
  <cfquery name="bookinfo" datasource="#application.dsource#">
    select * from books
	inner join publishers on books.publisher = publishers.name
        where books.title like '%#trim(searchme)#%' or books.ISBN13='#searchme#' or books.publisher='#searchme#' 
    
  </cfquery>
<cfreturn bookinfo>
</cffunction>

<cffunction  name="noResults">
  <div>There are no results matching your search.</div>
</cffunction>

<cffunction  name="oneResult">
  <div>There is one result matching your search:</div>
    <cfoutput>
      <div>
        <img src="images/#bookinfo.image#" style="width: 150px; float: left">
        <br>
        <span>Title: #bookinfo.title[1]#</span>
        <br>
        <!---<a href="#cgi.script_name#?p=details&searchme=#bookinfo.publisher#">--->
          <span>Publisher: #bookinfo.name[1]#</span>
        <!---</a>--->
        <br>
        <span>Price: #numberformat(bookinfo.price,"$_.__")#</span>
        <br> 
        <span>Description: #bookinfo.description[1]#</span>
        <br>
	
      </div>
    </cfoutput>
</cffunction>

<cffunction  name="manyResults">
  <cfoutput>
    <div>
      There are #bookinfo.recordcount# results matching your search:
    </div>
    <div>
      <ul class="nav flex-column">
        <cfloop query="bookinfo">
          <li class="nav-item">
            <a href="#cgi.script_name#?p=details&searchme=#ISBN13#" class="nav-link">#trim(title)#</a>
          </li>
        </cfloop>
      </ul>
    </div> 
  </cfoutput>
</cffunction>