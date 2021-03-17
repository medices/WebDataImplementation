<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <link href="../includes/css/class.css" rel="stylesheet" />
    <link href="../includes/css/mycss.css" rel="stylesheet" />
</head>
<cfinclude template="stateinfo.cfm">

    <body>
        <!---<cfparam name="p" default="carousel">--->
            <div id="wrapper" class="container" style="margin-top: 2em; margin-bottom: 2em">
                <div id="top-header" class="row" style="text-align: center; font-size: xx-large; padding-top: 0.5em">
                    <cfinclude template="header.cfm">
                </div>
                <div id="horizontalnav" class="row" style="margin-bottom: 1em">
                    <cfinclude template="horizontalnav.cfm">
                </div>
                <div id="main-content" class="row">


                    <div id="center" class="col-sm-9 order-last" style="text-align: center">

                        <legend>Event information may be out of date due to the coronavirus (COVID-19). Confirm details
                            with
                            event organizers.</legend>
                        <div>
                            <p>
                            <h3>Events</h3>
                            </p>

                            <p><img class="eventslist-image__img"
                                    src="https://d2p7wwv96gt4xt.cloudfront.net/S/events/events_mind_the_gap_dash_and_lily.jpg"
                                    alt="Rachel Cohn &amp; David Levithan: Mind the Gap, Dash &amp; Lily">
                            </p>

                            <p></p>
                            <h4>Rachel Cohn &amp; David Levithan: Mind the
                                Gap, Dash &amp; Lily</h4>
                            </p>

                            <p>Monday November 09
                                08:00PM-09:00PM ET</p>
                            <p>Join us for a virtual event on Crowdcast with
                                bestselling authors Rachel Cohn and David Levithan for the launch of their new
                                book Mind the Gap, Dash &amp; Lily. The event will take place on Crowdcast and
                                be live-streamed on Bookworm's Facebook Page.</p>

                            <a href="https://calendar.google.com/calendar/u/0/r/eventedit?text=Your+Event+Name&dates=20140127T224000Z/20140320T221500Z&details=For+details,+link+here:+http://www.example.com&location=Waldorf+Astoria,+301+Park+Ave+,+New+York,+NY+10022&sf=true&output=xml&pli=1" style="font-size: large">
                                Add event to my calendar</a>
                            
                        </div>

                    </div>

                    <div id="leftgutter" class="col-sm-3 order-first">
                        <cfinclude template="genrenav.cfm">
                    </div>
                </div>
                <div id="footer" class="row bg-light text-dark"
                    style="text-align: center; margin-top: 1em; padding-top: 1em; padding-bottom: 1em">
                    <cfinclude template="footer.cfm">
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
                crossorigin="anonymous"></script>
    </body>

</html>