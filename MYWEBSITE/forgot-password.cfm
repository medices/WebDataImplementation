<!---
1. Who are you? (form with email and last name)
2. (verify who the person is and get their personid) --> Choose a password
3. Change the password and either log them or send them to the login page.
--->
<!---<cfdump var="#application#"/>--->
<cfif form.keyexists("newpassword")>
    <cfset updatePassword()>
    <cflocation url="#cgi.script_name#?p=login" />
<cfelseif form.keyExists("lastname")>
    <cfset accountid = hasAccount(form)>
    <cfif accountid neq ''>
        <cfset showNewPasswordForm(accountid)>
    <cfelse>
        The Account was not found. 
        <cfset whoareyou()>
    </cfif>
    <cfdump var="#accountid#">
<cfelse>
    <cfset whoareyou()>
</cfif>






<cffunction name="hasAccount">
    <cfquery name="isin" datasource="#application.dsource#">
        select * from people where email='#form.email#' and lastname='#form.lastname#'
    </cfquery>

    <cfreturn isin.personid[1]>
    <cfdump var="#isin#">


</cffunction>




<cffunction name="whoareyou">
    <cfoutput>
        <form action="#cgi.script_name#?p=forgot-password"
            method="post"
            class="form-horizontal">

    <!-------------Email Address----------->
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email"
                       class="form-control"
                       value=""
                       name="email"
                       required/>
            </div>
    <!-------------------First Name-------->
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" value="" required/>
            </div>
    <!--------------Last Name---------->
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" name="lastName" id="lastName" value="" required/>
            </div>
    <!--------------Submit Button--------->
            <div class="form-group">
                <button class="btn btn-primary">Find Account</button>
            </div>
        </form>
    </cfoutput>
</cffunction>



<cffunction name="showNewPasswordForm">
    <cfargument name="personid" />
    <!-----------Forget Password javascript------------->
    <script type="text/javascript">
        function verifyPassword(){
        var resetPassword = document.getElementById('createNewPassword').value;
        console.dir(resetPassword);
        var confirmPassword = document.getElementById('confirmNewPassword').value;
        console.dir(confirmPassword);

        if(resetPassword === confirmPassword){
            document.getElementById("passwordConfirm").click()
        }
        else{
            document.getElementById("message").innerHTML="The passwords do not match.";
        }

    }
    </script>




    <cfoutput>
        <div id="message"></div>
        <form action="#cgi.script_name#?p=forgot-password" method="post" class="form-horizontal">
            <input type="text" value="#personid#" name="personid" />
            <div class="form-group">
                <label for="createNewPassword">Create New Password</label>
                <input type="password" name="newpassword" id="createNewPassword">
            </div>

            <div class="form-group">
                <label for="confirmNewPassword">Confirm New Password</label>
                <input type="password" id="confirmNewPassword">
            </div>

            <button id="passwordConfirmButton"
                    type="button"
                    class="btn btn-warning"
                    onclick="verifyPassword()"
            >Confirm New Account</button>
        <input type="submit" id="passwordConfirm" style="display:none"/>
    </form>
        </cfoutput>
</cffunction>


<cffunction name="updatePassword">
    <cfquery name="updatePassword" datasource="#application.dsource#">
        update passwords set password='#hash(form.newpassword,"SHA-256")#'
        where userid='#form.personid#'
    </cfquery>

    <cfquery name="allpass" datasource="#application.dsource#">
        select * from passwords
    </cfquery>
    <cfdump var="#allpass#">
</cffunction>

