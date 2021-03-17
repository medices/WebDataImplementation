<cfquery name="allgenres" datasource="#application.dsource#">
    SELECT DISTINCT genres.genreid, genres.genrename, genrestobooks.bookid FROM genrestobooks
    INNER JOIN genres ON genres.genreid = genrestobooks.genreid
    ORDER BY genres.genrename
</cfquery>
<div class="col-sm-12 mt-5" style="font-size: large">
    
        Choose genre
    
</div>
<div class="col-sm-12 mt-3 mb-5">
    <cfoutput query="allgenres">
        <div class="mt-1" style="list-style-type:none;">
            <li><a href="#cgi.Script_NAME#?p=details&searchme=#bookid#" style="font-size: large;">#genrename#</a></li>
        </div>
    </cfoutput>
</div>
