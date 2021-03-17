<!----
1. Allow us to add a new book.
2. Allow us to search for a book to edit
-by searching for the title and showing potential matches
for us to choose.
3. Needs to take the book we are editing and
put it into the database.------->

<cfparam name="book" default="" />
<cfparam name="qterm" default="" />

<cfset processForms()>
    <div class="col-3">
        <cfset sideNav()>
    </div>
    <div class="col-9">
        <cfif book neq ''>
            <cfset mainForm()>
        </cfif>
    </div>

    <!----------------------------------Main Form------------------------------------------------->

    <cffunction name="mainForm">


        <!-------------------Gets Genres on to display----------------->
        <cfif book neq ''>
            <cfquery name="allGenres" datasource="#application.dsource#">
                select * from genres
                order by genreName
            </cfquery>

            <cfquery name="bookGenres" datasource="#application.dsource#">
                select * from genrestobooks
                where bookID='#book#'
            </cfquery>



            <!-------------Get all the details about this book to edit------------>
            <cfquery name="thisbook" datasource="#application.dsource#">
                select * from books where isbn13='#book#'
            </cfquery>


            <!------------Do we need this?------------->
            <!---<cfdump var="#thisbook#" />--->


            <!--------Get all the publishers out of the database-------->
            <cfquery name="allpublishers" datasource="#application.dsource#">

                select * from publishers order by name
            </cfquery>

            <!---<cfdump var="#allpublishers#" />--->

            <cfoutput>
                <form action="#cgi.script_name#?tool=addedit" method="post" enctype="multipart/form-data">
                    <div class="form-group row">


                        <label for="isbn13" class="col-sm-2 col-form-label">ISBN13:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="isbn13" name="isbn13"
                                value="#thisbook.isbn13[1]#" placeholder="Enter ISBN13" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="title" class="col-sm-2 col-form-label">Title:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" name="title" value="#thisbook.title[1]#"
                                placeholder="Enter Title of the Book" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="year" class="col-sm-2 col-form-label">Year</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="year" name="year" value="#thisbook.year[1]#"
                                placeholder="Year" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="weight" class="col-sm-2 col-form-label">Weight</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="weight" name="weight"
                                value="#thisbook.weight[1]#" placeholder="Enter Book Weight(lbs)" />
                        </div>
                    </div>

                    <!---------Binding----------->

                    <div class="form-group row">
                        <label for="binding" class="col-sm-2 col-form-label">Binding</label>
                        <div class="col-sm-10">
                            <select id="binding" name="binding">
                                <option value=""></option>
                                <option value="Hardcover" #thisbook.binding[1] eq "hardcover" ? "selected" : "" #>
                                    Hardcover</option>
                                <option value="Paperback" #thisbook.binding[1] eq "paperback" ? "selected" : "" #>
                                    Paperback</option>
                                <option value="PDF" #thisbook.binding[1] eq "PDF" ? "selected" : "" #>PDF</option>
                                <option value="ePub" #thisbook.binding[1] eq "ePub" ? "selected" : "" #>ePub</option>
                                <option value="Trade Paperback" #thisbook.binding[1] eq "Trade Paperback" ? "selected"
                                    : "" #>Trade Paperback</option>
                            </select>
                            <input type="text" class="form-control" id="binding" name="binding"
                                value="#thisbook.binding[1]#" placeholder="Enter Binding Type" />
                        </div>
                    </div>

                    <!-------------Publisher---------------->
                    <div class="form-group row">
                        <label for="publisher" class="col-sm-2 col-form-label">Publisher</label>
                        <div class="col-sm-10">
                            <select id="publisher" name="publisher">
                                <option value=""></option>

                                <cfloop query="allpublishers">
                                    <cfset sel=thisbook.publisher[1] eq publisherid ? 'selected' : ''>
                                        <cfset sel=''>
                                            <cfif thisbook.publisher[1] eq publisherid>
                                                <cfset sel='selected' />
                                            </cfif>

                                            <option value="#publisherid#" #sel#>#name#</option>
                                </cfloop>
                            </select>
                            <input type="text" class="form-control" id="publisher" name="publisher"
                                value="#thisbook.publisher[1]#" placeholder="Enter Publisher" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="pages" class="col-sm-2 col-form-label">Pages</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="pages" name="pages"
                                value="#thisbook.pages[1]#" placeholder="Pages" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ISBN" class="col-sm-2 col-form-label">ISBN</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="ISBN" name="isbn" value="#thisbook.isbn[1]#"
                                placeholder="ISBN" />
                        </div>
                    </div>



                    <!-----Price(need to add to db)
<div class="form-group row">
    <label for="price" 
           class="col-sm-2 col-form-label">Price:</label>
    <div class="col-sm-10">
        <input type="number"
               step="any"
                  class="form-control"   
               id="price"
               name="price"
               value="#thisbook.price[1]#"
               placeholder="Enter Price"
         />
    </div>
</div>----->



                    <!---------------Cover Image------------------------->
                    <div class="form-group row">
                        <label for="image" class="col-sm-2 col-form-label">Cover:</label>

                        <div class="col-sm-10">
                            <!----------------Show icon upload-image when nothing has been uploaded--------------->
                            <cfif (thisbook.image[1] eq '' )>
                                <img src="/nmank76334/MYWEBSITE/images/upload-image-icon.png" class="img-thumbnail"
                                    width="20%" height="20%">
                                <cfelse>
                                    <img src="/nmank76334/MYWEBSITE/images/#thisbook.image[1]#">
                                    <input type="hidden" name="image" value="#thisbook.image[1]#">
                            </cfif>
                            <input type="file" class="form-control" id="uploadimage" name="uploadimage" />
                        </div>
                    </div>

                    <!---------------------Add description: WYSIWIG-------------------->

                    <div class="form-group">
                        <label for="bookdesk">Description</label>
                        <textarea id="bookdesc" name="description">
                    #trim(thisbook.description[1])#
                </textarea>

                        <!-----replaces text area with javascript CKEditor----->
                        <script>
                            ClassicEditor.create(document.querySelector('##bookdesc'));
			    <!---CKEDITOR.replace("bookdesk");--->	
                        </script>

                    </div>


                    <!-----Genre links----->
                    <cfloop query="allgenres">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="genre" value="#genreID#"
                                id="genre#genreID#">

                            <label class="form-check-label" for="">
                                #genrename#
                            </label>
                        </div>
                    </cfloop>

                    <cfloop query="bookgenres">
                        <script type="text/javascript">
                            document.getElementById("genre#genreID#").checked = true;
                        </script>
                    </cfloop>


                    <!--------------Submit Button--------------------->

                    <div>
                        <!--------------<label>&nbsp;</label>----------------->
                        <button type="submit" class="btn btn-primary" style="width: 100%; margin-bottom: 2em">
                            Add Book
                        </button>
                    </div>
                </form>
            </cfoutput>
        </cfif>
    </cffunction>



    <!------------------Process Form-------------------------->

    <cffunction name="processForms">
        <cfif form.keyExists('isbn13')>
            <cfdump var="#form#" />

            <cfif form.keyExists('uploadimage') and form.uploadimage neq ''>
                <cffile action="upload" filefield="uploadimage" destination="#expandPath("
                    /nmank76334/MYWEBSITE/images/")#" nameconflict="makeunique" />

                <cfset form.image=cffile.serverfile>
                    <cfdump var="#cffile#" />
            </cfif>

            <cfquery name="putbookin" datasource="#application.dsource#">

                if not exists(select * from books where isbn13='#form.isbn13#')
                insert into books (isbn13,title)
                values ('#form.isbn13#','#form.title#');
                update books set
                title='#form.title#',
                weight='#form.weight#',
                year='#form.year#',
                isbn='#form.isbn#',
                pages='#form.pages#',
                binding='#form.binding#',
                <!--------------price='#form.price#',----------------------->
                publisher='#form.publisher#',
                image='#form.image#',
                description='#form.description#'
                where isbn13='#form.isbn13#'
            </cfquery>


            <cfif form.keyExists("genre") and form.genre neq ''>
                <cfquery name="deleteGeresForBook" datasource="#application.dsource#">
                    delete from genrestobooks 
                    where bookID='#form.isbn13#'
                </cfquery>
                
                
                <cfloop list="#form.genre#" index="i">
                    <cfquery name="putingenre" datasource="#application.dsource#">
                        insert into genrestobooks (bookID,genreID)
                        values
                        ('#form.isbn13#','#i#')
                    </cfquery>
                </cfloop>
            </cfif>



        </cfif>
    </cffunction>

    <!------------------------------------Side Nav-------------------------------------------------------->

    <cffunction name="sideNav">
        <cfoutput>
            <form action="#cgi.script_name#?tool=addedit" method="post" class="form-inline">
                <div class="form-group">
                    <input placeholder="Find a Book" type="text" class="form-control" id="qterm" name="qterm"
                        value="#qterm#" />
                    <button type="submit" class="btn btn-outline-success">Search</button>
                </div>
            </form>

        </cfoutput>


        <cfdump var="#qterm#" />

        <cfif qterm neq ''>
            <cfquery name="allbooks" datasource="#application.dsource#">
                select * from books

                where title like '%#qterm#%'

                order by title
            </cfquery>
            <!---------<cfdump var="#allbooks#" />---------->
        </cfif>
        

        <cfoutput>
            <div>Book List</div>
            <ul class=" nav flex-column">

                <li class="nav-item">
                    <a class"nav-link" href="#cgi.script_name#?tool=addedit&book=new">New Book</a>
                    <!-----Changed class nav-link----->
                </li>
                <cfif isdefined("allbooks")>
                    <cfloop query="allbooks">
                        <li class="nav-item">
                            <a class="nav-link"
                                href="#cgi.script_name#?tool=addedit&book=#isbn13#&qterm=#qterm#">#title#</a>
                        </li>
                    </cfloop>
                </cfif>
            </ul>
        </cfoutput>
    </cffunction>

    <!--------<cfdump var="#allbooks#"/>------------->