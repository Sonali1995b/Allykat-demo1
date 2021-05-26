<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.calender.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <%-- <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/style.css")%>" />--%>
      <link href="<%=Page.ResolveClientUrl("~/main-assets/fullcalendar/lib/main.css")%>" rel='stylesheet' />
    <%-- /*# calender---31-10-20-------*#/--%>
    

    <script>
        function my_fun() {
            //debugger;
            var dt = document.getElementById('<%=hf_day.ClientID %>').value;

            getmenu(dt);
        }
        function my_js_function() {

            my_fun();

        }
    </script>
     
    <script>
        function popup() {
            swal({
                title: "Successful!",
                text: "Your Booking request is submitted!.",
                icon: "success",
                button: "Ok",
            });
        }
        function popupduplicatedata() {
            swal({
                title: "Server Error!",
                text: "Your Booking is already exists!",
                icon: "error",
                button: "Ok",
            });
        }
    </script>
      

 <style>
  /*      .modal {
 
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1050;
    display: none;
    width: 50%;
    height: 100%;
    overflow: hidden;
    outline: 0;
}
*/

.modal-dialog {
    position: relative;
    width: auto;
    margin: .5rem;
    pointer-events: none;
}

.modal-content {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 100%;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: .25rem;
    box-shadow: 0 .25rem .5rem rgba(0,0,0,.1);
    outline: 0;
}

.modal-header {
    position: relative;
    border-top-left-radius: .1875rem;
    border-top-right-radius: .1875rem;
}

.modal-title {
    margin-bottom: 0;
    line-height: 1.5385;
}

.modal-header .close {
    color: inherit;
	/*padding: 1.25rem 1.25rem;*/
margin: -1.25rem -1.25rem -1.25rem auto;
position:relative;
top:-40px;

}

.modal-body {
    position: relative;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
}

.form-group {
    margin-bottom: 1.25rem;
}

.modal-footer {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 1.25rem;
        padding-top: 1.25rem;
    border-top: 1px solid rgba(0,0,0,.125);
        border-top-width: 1px;
    border-bottom-right-radius: .25rem;
    border-bottom-left-radius: .25rem;
}

.btn-link {
    font-weight: 400;
    color: #2196f3;
    text-decoration: none;
}

.bg-primary {
    background-color: #2196f3 !important;
}

    </style>
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <style>
        #maincontent_news_desc{
            margin-left:15px;
        }
        @media (min-width:2560px){
            #maincontent_news_desc{
                margin-left:626px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds parallax  section_padding_100" style="background-image: url('/main-assets/images/parallax/call_to_action_2.jpg')"><%--calltoaction--%>
       
                        <%--<div class="container">                           
                           <div class="row topmargin_60 bottommargin_60">
                              <div class="main-wrapper">
                                 <div class="sidebar-wrapper z-depth-2 side-nav fixed" id="sidebar">
                                    <div class="sidebar-title">
                                       <h4>Events</h4>
                                       <h5 id="eventDayName">Date</h5>
                                    </div>
                                    <div class="sidebar-events" id="sidebarEvents">
                                       <div></div>
                                    </div>
                                 </div>
                                 <div class="content-wrapper">
                                    <div class="">
                                       <div class="calendar-wrapper z-depth-2">
                                          <div class="header-background">
                                             <div class="calendar-header">
                                                <a class="prev-button" id="prev">
                                                <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                </a>
                                                <a class="next-button" id="next">
                                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                </a>
                                                <div class=" header-title">
                                                   <div class="header-text">
                                                      <h3 style="color: white;" id="month-name">February</h3>
                                                      <h5 id="todayDayName">Today is Friday 7 Feb</h5>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="calendar-content">
                                             <div id="calendar-table" class="calendar-cells">
                                                <div id="table-header">
                                                   <div class="row">
                                                      <div class="col">Mon</div>
                                                      <div class="col">Tue</div>
                                                      <div class="col">Wed</div>
                                                      <div class="col">Thu</div>
                                                      <div class="col">Fri</div>
                                                      <div class="col">Sat</div>
                                                      <div class="col">Sun</div>
                                                   </div>
                                                </div>
                                                <div id="table-body" class="">
                                                </div>
                                             </div>
                                          </div>
                                        <div class="calendar-footer">
                                             <div class="emptyForm" id="emptyForm">
                                                <h4 id="emptyFormTitle">No events now</h4>
                                                <a class="addEvent" id="changeFormButton">Add new</a>
                                             </div>
                                             <div class="addForm" id="addForm">
                                                <h4>Add new event</h4>
                                                <div class="row">
                                                   <div class="input-field col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                      <label for="eventTitleInput">Title</label>
                                                      <input id="eventTitleInput" type="text" class="validate">
                                                   </div>
                                                   <div class="input-field col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                      <label for="eventDescInput">Description</label>
                                                       <input id="eventDescInput" type="text" class="validate">
                                                   </div>
                                                </div>
                                                <div class="addEventButtons">
                                                   <a class="waves-effect waves-light btn blue lighten-2" id="addEventButton">Add</a>
                                                   <a style="color: black;" class="waves-effect waves-light btn grey lighten-2" id="cancelAdd">Cancel</a>
                                                </div>
                                             </div>
                                             </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>--%>
          <div class="container main-wrapper">
              
                            <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Book Your Appointment</span></h2>
                                </div>
                  <div class="col col-lg-8 col-md-12  offset-md-0  col-lg-offset-2 calenderwrapper_outer">
                        <div class="content-wrapper">
                            <div id='calendar'></div>  
                        </div>
                        <!-- Modal -->
                      <div class="popupouter">
                        <div class="popupinner">
                            <span class="closeit">x</span>
                              <!-- Modal content-->
                              <div class="popup-content">  
                                  <h2>Appointment</h2>
                                 <%-- <form>--%>
                                      <p class="popspcl"><b>Date: </b><span class="dateonly">20-03-2020</span></p>
                                      <%--<p class="popspcl"><b>Day: </b><span class="dayonly" id="txt_day" runat="server">Sunday</span></p> --%>                                     
                                      <p  class="popspcl pricetag"><b>Price:</b><span id="price" runat="server"></span> <%-- $2000.00--%></p>
                                       
                                     
                                      <div class="checkbox-outer row"> 
                                            <p class="popspcl col-md-12"><b>Select Time Slot:</b></p>
                                          <div class="checkbox-outer row" id="timeslot_list" runat="server">
                                            <%--<div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1">
                                                <label class="form-check-label" for="inlineCheckbox1">10:00AM - 12:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2">
                                                <label class="form-check-label" for="inlineCheckbox2">12:00PM - 02:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3">
                                                <label class="form-check-label" for="inlineCheckbox3">02:00PM - 04:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4">
                                                <label class="form-check-label" for="inlineCheckbox4">04:00PM - 06:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5">
                                                <label class="form-check-label" for="inlineCheckbox5">06:00PM - 08:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6">
                                                <label class="form-check-label" for="inlineCheckbox6">08:00PM - 10:00PM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox7">
                                                <label class="form-check-label" for="inlineCheckbox7">10:00PM - 12:00AM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox8">
                                                <label class="form-check-label" for="inlineCheckbox8">11:00AM - 02:00AM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox9">
                                                <label class="form-check-label" for="inlineCheckbox9">02:00AM - 04:00AM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox10">
                                                <label class="form-check-label" for="inlineCheckbox10">04:00AM - 06:00AM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox11">
                                                <label class="form-check-label" for="inlineCheckbox11">06:00AM - 08:00AM</label>
                                            </div>
                                            <div class="form-check col-md-6">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox12">
                                                <label class="form-check-label" for="inlineCheckbox12">08:00AM - 10:00AM</label>
                                            </div>--%>
                                        </div>
                                      </div>
                                      <div class="form-group popmsg">
                                        <label >Type Your Message here</label>
                                        <textarea class="form-control" rows="3" placeholder="Type here..." id="txt_desc" runat="server"></textarea>
                                      </div>
                                        <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Submit" OnClick="btn_submit_Click"/> <%--OnClick="btn_submit_Click"--%>
                                      <%--<input type="submit" name="" value="Submit" class="btn btn-primary submitbutton" id="btnSave" runat="server"  önclick="ShowAlert();">--%>
                                 <%-- </form>--%>
                              </div>
                          
  
                        </div>
                      </div>
                     <!-- Modal -->
                      <br />
                    </div>
                 </div>
                     </section>

                     <section class="ds ms section_padding_top_80 columns_padding_0">
                        <div class="container-fluid">
                           <div class="row">
                              <div class="col-sm-12">
                                 <h2 style="text-align: center;">
                                    <span class="big">News and Announcement</span>
                                 </h2>
                                 <br><br>
                                <div id="news_desc" runat="server">
                                <%-- <div class="owl-carousel blog-carousel theme-owl-carousel" data-margin="30" data-nav="false" data-dots="true" data-center="true" data-loop="true" data-items="5" data-autoplay="false" data-responsive-xs="1" data-responsive-sm="2" data-responsive-md="2"
                                    data-responsive-lg="3" data-responsive-xlg="5">
                                    <article class="vertical-item post format-standard text-center">
                                       <div class="item-media entry-thumbnail">
                                          <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/03.jpg")%>" alt="Allykat" title="Allykat">
                                          <div class="media-links">
                                             <a class="abs-link" title="" href="#"></a>
                                          </div>
                                       </div>
                                       <div class="item-content entry-content">
                                          <h4 class="topmargin_0 bottommargin_20">
                                             <a href="#">Aliquyam erat, sed diam voluptua vero eoset</a>
                                          </h4>
                                          <span class="entry-meta text-uppercase fontsize_12">
                                          <span class="author">Admin</span> |
                                          <time datetime="2016-09-03T15:05:23+00:00">24 December 2015</time>
                                          </span>
                                       </div>
                                       <!-- .item-content.entry-content -->
                                    </article>
                                    <article class="vertical-item post format-standard text-center">
                                       <div class="item-media entry-thumbnail">
                                          <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/04.jpg")%>" alt="Allykat" title="Allykat">
                                          <div class="media-links">
                                             <a class="abs-link" title="" href="#"></a>
                                          </div>
                                       </div>
                                       <div class="item-content entry-content">
                                          <h4 class="topmargin_0 bottommargin_20">
                                             <a href="#">Lorem ipsum dolor sitamet lorem ipsum dolor sit amet</a>
                                          </h4>
                                          <span class="entry-meta text-uppercase fontsize_12">
                                          <span class="author">Admin</span> |
                                          <time datetime="2016-09-03T15:05:23+00:00">11 December 2015</time>
                                          </span>
                                       </div>
                                       <!-- .item-content.entry-content -->
                                    </article>
                                    <article class="vertical-item post format-standard text-center">
                                       <div class="item-media entry-thumbnail">
                                          <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                                          <div class="media-links">
                                             <a class="abs-link" title="" href="#"></a>
                                          </div>
                                       </div>
                                       <div class="item-content entry-content">
                                          <h4 class="topmargin_0 bottommargin_20">
                                             <a href="#">Et justo duo dolores et ea rebum clita kasd gubergren</a>
                                          </h4>
                                          <span class="entry-meta text-uppercase fontsize_12">
                                          <span class="author">Admin</span> |
                                          <time datetime="2016-09-03T15:05:23+00:00">17 December 2015</time>
                                          </span>
                                       </div>
                                       <!-- .item-content.entry-content -->
                                    </article>
                                    <article class="vertical-item post format-standard text-center">
                                       <div class="item-media entry-thumbnail">
                                          <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                                          <div class="media-links">
                                             <a class="abs-link" title="" href="#"></a>
                                          </div>
                                       </div>
                                       <div class="item-content entry-content">
                                          <h4 class="topmargin_0 bottommargin_20">
                                             <a href="#">Aliquyam erat, sed diam voluptua vero eoset</a>
                                          </h4>
                                          <span class="entry-meta text-uppercase fontsize_12">
                                          <span class="author">Admin</span> |
                                          <time datetime="2016-09-03T15:05:23+00:00">24 December 2015</time>
                                          </span>
                                       </div>
                                       <!-- .item-content.entry-content -->
                                    </article>
                                    <article class="vertical-item post format-standard text-center">
                                       <div class="item-media entry-thumbnail">
                                          <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/06.jpg")%>" alt="Allykat" title="Allykat">
                                          <div class="media-links">
                                             <a class="abs-link" title="" href="#"></a>
                                          </div>
                                       </div>
                                       <div class="item-content entry-content">
                                          <h4 class="topmargin_0 bottommargin_20">
                                             <a href="#">Lorem ipsum dolor sitamet lorem ipsum dolor sit amet</a>
                                          </h4>
                                          <span class="entry-meta text-uppercase fontsize_12">
                                          <span class="author">Admin</span> |
                                          <time datetime="2016-09-03T15:05:23+00:00">11 December 2015</time>
                                          </span>
                                       </div>
                                       <!-- .item-content.entry-content -->
                                    </article>
                                 </div>--%>
                              </div>
                              </div>
                           </div>
                        </div>
                     </section>

    

        <asp:HiddenField ID="hf_date" runat="server" Value="" />
        <asp:HiddenField ID="hf_checkbox" runat="server" Value="" />
        <asp:HiddenField ID="hf_price" Value="" runat="server"/>
        <asp:HiddenField ID="hf_day" Value="" runat="server"/>
        <asp:HiddenField ID="hf_DTLS_APPOINTMENT_KEY" Value="" runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
     <%-- <script>
          function get() {
              var dt = document.getElementById("eventDayName").innerHTML;
              document.getElementById('<%=hf_date.ClientID %>').value = dt;

          }
      </script>
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <script>
        var menus = document.getElementsByClassName('menus');
        for (var i = 0; i < menus.length; i++) {
            menus[i].classList.remove('active');
        }
        document.getElementById('calendar_menu').classList.add('active');
    </script>--%>
<script src="<%=Page.ResolveClientUrl("~/main-assets/fullcalendar/lib/main.js")%>"></script>
<%--<script src="<%=Page.ResolveClientUrl("~/main-assets/js/nicescroll.js")%>"></script>--%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

  
<script type="text/javascript">
    $(window).on("load", function () {
        getall();
       
        getmenu(mydata);
        $(".fc-day").click(function () {
            $(".popupouter").show("");
        });

        $(".closeit").click(function () {
            $(".popupouter").hide("");
        });

        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth'
        });

        //$(".fc-scroller-liquid-absolute").niceScroll({
        //    cursorcolor: "#cccccc",
        //    cursorwidth: "3px",
        //    background: "#3a3843",
        //    cursorborder: "0px solid #eee",
        //    cursorborderradius: 2
        //});

        calendar.render();
    });

</script>
    

<script type="text/javascript">

    var mydata;
    var arr;
    var total = 0;

    function getall() {
        $.ajax({
            url: '<%=ResolveUrl("~/calender/index.aspx/GetAllEvent") %>',

            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "",
            success: function (data) {
                mydata = JSON.parse(data.d);
                var vString = "";

                if (mydata != null) {
                    mydata = JSON.parse(data.d);
                    //console.log(mydata);
                    
                    var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                        selectable: true,
                        initialView: 'dayGridMonth',
                        //initialDate: '2021-03-07',
                        defaultDate: new Date(),
                        timeZone: 'local',
                        editable: true,
                        
                        //dateFormat: {
                        //    date: 'dd,MM, yyyy'   //whatever date format you want here
                        //},
                        
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay'
                        },
                        
                        dateClick: function (info) {
                            //debugger;
                            //alert('Date: ' + info.date.getDay());

                            var day = info.date.getDay();
                            document.getElementById('<%=hf_day.ClientID %>').value = day;
                            document.getElementById('<%=hf_date.ClientID %>').value = info.dateStr;
                           
                            my_js_function();
                            $(".popupouter").show("");
                            $(".popspcl .dateonly").text(info.dateStr);

                        },
                        
                    

                        events: mydata,

                    });

                    var cdate = calendar.getDate();
                    var month_int = cdate.getMonth();
                    //alert((month_int + 1)); // March 2020 month will return 3
                    //alert(cdate);
                    //console.log((month_int + 1));

                    calendar.render();

                }
                if (mydata == null) {
                    alert("Sorry!! This is an offday! No Timeslot available today!!");
                }

            },

            error: function (response) {
                console.log(response.responseText);
            },
            failure: function (response) {
                console.log(response.responseText);
            }
        });
    }

   

    function getmenu(MenuName) {
        //$("#inputMenuName").val("");
        //alert('ok');
        $.ajax({
            url: '<%=ResolveUrl("~/calender/index.aspx/GetEvent") %>',

            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{date1: '" + MenuName + "'}",
            success: function (data) {
                
                mydata = JSON.parse(data.d);
               /* checkboxcheck();*/
                var vString = "";
                if (mydata == null) {

                    //document.getElementById("time").innerHTML = "<p>Sorry!! This is an offday! No Timeslot available today!!</p>";
                    alert("Sorry!! This is an offday! No Timeslot available today!!");

                }
                else {
                    //alert("Sorry!!! some error occured");
                    //alert(data.d);
                    mydata = JSON.parse(data.d);
                    for (var i = 0; i < mydata.length - 1; i++) {
                        if (mydata.length - 1 != null) {
                            var obj = mydata[i];
                            document.getElementById("maincontent_price").innerHTML = obj.PRICE;

                            vString += "<div class='form-check col-md-6'><input class='form-check-input' type ='checkbox' name='my_match[]' value='190' onclick='checkboxcheck(this)'  id = '" + obj.DTLS_TIMETABLE_KEY + "'>";
                            vString += "<label class='form-check-label pos' for='inlineCheckbox" + i + "'>" + obj.START_TIME + " - " + obj.END_TIME + "</label></div >";
                        }
                        else {
                            vString+="Offday or Please call for the special appoitment!"
                        }

                    }

                    document.getElementById("maincontent_timeslot_list").innerHTML = vString;
                    document.getElementById('<%=hf_checkbox.ClientID %>').value = obj.DTLS_TIMETABLE_KEY;
                }

            },

            error: function (response) {
                console.log(response.responseText);
            },
            failure: function (response) {
                console.log(response.responseText);
            }
        });
    }
    function checkboxcheck(e) {
        //debugger;
        //console.log(e);
        var bid;
        var obj;
        for (let i in mydata) {

            var d = mydata[i];
            if (d.DTLS_TIMETABLE_KEY == e.id) {
                obj = d;
            }
        }
            
        if (e.checked == true) {
            console.log(e.checked);
            total += obj.PRICE;
            if (arr === undefined)
                arr = ',' + obj.DTLS_TIMETABLE_KEY;                    
            else
                arr = arr + "," + obj.DTLS_TIMETABLE_KEY;
                    
            console.log(arr);
        } else {
            console.log(e.checked);
            total -= obj.PRICE;
            arr = arr.replace(',' + obj.DTLS_TIMETABLE_KEY, '');
            console.log(arr);
        }
            
        document.getElementById("maincontent_price").innerHTML = total;
        document.getElementById('<%=hf_price.ClientID %>').value = total;
        document.getElementById('<%=hf_checkbox.ClientID %>').value = arr;

    }
    
           

</script>

<script>
    function get() {
        var dt = document.getElementById('<%=hf_date.ClientID %>').value;
    }
</script>
</asp:Content>
