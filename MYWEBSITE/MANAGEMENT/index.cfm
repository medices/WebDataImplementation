<!DOCTYPE html>
<html>

<head>
    
    
    <link href="../../includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../includes/css/mycss.css" rel="stylesheet" />
    <script src="../../includes/js/jQuery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../includes/bootstrap/js/bootstrap.js" type="text/javascript"></script>

    <!--------for WYSIWYG-------->

    <script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js"></script>
    <!---<script src="/nmank76334/includes/ckeditor/ckeditor.js" type="text/javascript"></script>---> 
    
    <meta charset="utf-8">
    <title>Untitled Document</title>
    
</head>

<body>


    <cfparam name="tool" default="addedit" />
    <div id="wrapper" class="container" style="margin-top: 2em; margin-bottom: 2em">

        <div id="topHeader" class="row" style="padding-top: 0.5em; font-size: xx-large">
            <cfinclude template="header.cfm" />
        </div>


        <div id="toolbar" class="row">
            <cfinclude template="navbar.cfm" />
        </div>

    <br/>

        <div id="main" class="row">
            <cfinclude template="#tool#.cfm" />
        </div>


        <div id="footer" class="row">
            <cfinclude template="footer.cfm" />
        </div>


    </div>


</body>

</html>

