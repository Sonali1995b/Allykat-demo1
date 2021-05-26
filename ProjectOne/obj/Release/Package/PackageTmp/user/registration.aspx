<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="ProjectOne.user.registration" %>

<!DOCTYPE html>

<!--[if lt IE 7]>      
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
   <![endif]-->
<!--[if IE 7]>         
   <html class="no-js lt-ie9 lt-ie8">
      <![endif]-->
<!--[if IE 8]>         
      <html class="no-js lt-ie9">
         <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head runat="server">
    <title>:: AllyKat ::</title>

    <link rel="icon" type="image/png" sizes="32x32" href="<%= Page.ResolveClientUrl("~/main-assets/images/Favicon_Ally-Kat.png")%>" />
    <link rel="icon" type="image/png" sizes="16x16" href="<%= Page.ResolveClientUrl("~/main-assets/images/Favicon_Ally-Kat.png")%>" />
    <meta charset="utf-8">
    <!--[if IE]>
               <meta http-equiv="X-UA-Compatible" content="IE=edge">
               <![endif]-->
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/main.css")%>" id="color-switcher-link">
    <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/animations.css")%>">
    <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/fonts.css")%>">
    <script src="<%=Page.ResolveClientUrl("~/main-assets/js/vendor/modernizr-2.6.2.min.js")%>"></script>
    <!--[if lt IE 9]>
               <script src="<%=Page.ResolveClientUrl("~/main-assets/js/vendor/html5shiv.min.js")%>"></script>
               <script src="<%=Page.ResolveClientUrl("~/main-assets/js/vendor/respond.min.js")%>"></script>
               <![endif]-->


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function popup() {
            swal({
                title: "Successful!",
                text: "Your registration is successfull !! Please Check your registered email.",
                icon: "success",
                button: "Ok",
            });
        }
        function popuperror() {
            swal("Oops", "Please provide proper Email Address !", "error")
        }
        function popupservererror() {
            swal({
                title: "Server Error!",
                text: "Server error ! Try again later.",
                icon: "error",
                button: "Ok",
            });
        }
        function popuppasswordmatch() {
            swal({
                title: "Registration Error!",
                text: "Both the password not matched!!",
                icon: "error",
                button: "Ok",
            });
        }
        function popupduplicatedata() {
            swal({
                title: "Data Already Exists!",
                text: "You are already registered with us.Please Login!!",
                icon: "error",
                button: "Ok",
            });
        }
    </script> 
</head>
<body>
    <!--[if lt IE 9]>
               <div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="highlight">upgrade your browser</a> to improve your experience.</div>
               <![endif]-->
    <div class="preloader">
        <div class="preloader_image"></div>
    </div>
    <!-- wrappers for visual page editor and boxed version of template -->
    <div id="canvas">
        <div id="box_wrapper">
            <!-- template sections -->
            <!--  <section class="page_topline ds ms gorizontal_padding table_section">
                        <div class="container-fluid with_border">
                           <div class="row">
                              <div class="col-sm-6 col-md-6 col-lg-6 text-xs-center text-left ">
                                 <a href="#">
                                    <em>youremail@domain.com</em>
                                 </a>
                              </div>
                        
                              <div class="col-sm-6 col-md-6 col-lg-6 text-right">
                                 <div class="page_social_icons">
                                    <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                                    <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                                    <a class="social-icon color-icon soc-google" href="#" title="Google"></a>
                                    <a class="social-icon color-icon soc-linkedin" href="#" title="LinkedIn"></a>
                                    <a class="social-icon color-icon soc-pinterest" href="#" title="Pinterest"></a>
                                 </div>
                              </div>
                        
                              
                        
                           </div>
                        </div>
                        </section>
                        -->
            <div class="pagehead header_darkgrey">
                <div class="container-fluid">
                    <div class="row">
                        <i class="fa fa-bars togglemenu"></i>
                        <div class="mainlogoarea text-center" id="logo_img" runat="server">
                            <%--   <a href='#'><img src='http://allykat.com.au/documents/homepage/20201019_072135.png' alt='Allykat' title='Allykat'></a>--%>
                        </div>

                        <nav class="menu_nav">
                            <ul>
                                <li class="active">
                                    <a href="<%= Page.ResolveClientUrl("~/")%>">Home</a>
                                </li>
                                <li>
                                    <a href="<%= Page.ResolveClientUrl("~/about/")%>">About</a>
                                </li>
                                <li>
                                    <a href="<%= Page.ResolveClientUrl("~/gallery/")%>">Gallery</a>
                                </li>
                                <!-- eof pages -->
                                <li>
                                    <a href="<%= Page.ResolveClientUrl("~/diary/")%>">Escort Diary</a>
                                </li>

                                <li>
                                    <a href="#">Pages</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/news/")%>">News & Announcements</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/offer/")%>">Special Offer</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/voting/")%>">Image Voting</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/calender/")%>">Calender</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/selfie/")%>">Selfie</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/tour/")%>">Tour</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/testimonials/")%>">Testimonials</a>
                                        </li>
                                        <li>
                                            <a href="<%= Page.ResolveClientUrl("~/forum/")%>">Escort Forum</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Page.ResolveClientUrl("~/user/registration.aspx")%>">Register</a>
                                </li>
                                <li class="loginres">
                                    <a href="<%= Page.ResolveClientUrl("~/user/login.aspx")%>">Login</a>
                                </li>

                                <!-- contacts -->
                                <li>
                                    <a href="<%= Page.ResolveClientUrl("~/contact/")%>">Contact</a>
                                </li>
                                <!-- eof contacts -->
                            </ul>
                        </nav>
                        <!-- eof main nav -->
                    </div>
                </div>
            </div>

            <section class="ds section_padding_70 about-content customheight-90">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <article class="post format-small-image with_background">
                                <div class="side-item content-padding">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="item-media entry-thumbnail">
                                                <img src="" runat="server" id="regis_img" alt="Allykat" title="Allykat">
                                            </div>
                                        </div>
                                        <div class="col-md-6 regn-page-form">
                                            <h2 style="text-align: center;">
                                                <span class="big">Register</span>
                                            </h2>

                                            <form id="register_list" runat="server">
                                                <div>
                                                    <asp:HiddenField ID="hf_USER_KEY" runat="server" Value="0" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name" class="sr-only">
                                                        Full Name
                                                <span class="required">*</span>
                                                    </label>
                                                    <input type="text" aria-required="true" size="30" runat="server" value="" name="name" id="txt_User_Name" class="form-control text-center" placeholder="Full name">
                                                </div>
                                                <div class="form-group" style="width: 104px;">
                                                       <asp:dropdownlist name="countryCode" id="ddlcountry" EnableViewState="true" class="form-control fldnew fldnew-sel"  style="margin: 8px 0;min-width: auto;" runat="server"></asp:dropdownlist>

                                                    

                                                </div>
                                                <div class="form-group" style="width: calc(100% - 110px); float: right;">
                                                    <input type="text" aria-required="true" size="30" runat="server" value="" name="Phone" id="txt_Phone" class="form-control text-center" style="min-width: auto;" placeholder="Phone Number">
                                                </div>
                                                <%-- <div class="form-group">
                                                <label for="email" class="sr-only">Phone Number
                                                <span class="required">*</span>
                                                </label>
                                                <input type="text" aria-required="true" size="30" runat="server" value="" name="Phone" id="txt_Phone" class="form-control text-center" placeholder="Phone(with Country code)">
                                             </div>--%>

                                                <div class="form-group">
                                                    <label for="password" class="sr-only">
                                                        Password
                                                <span class="required">*</span>
                                                    </label>
                                                    <%--<input type="text" aria-required="true" size="30" runat="server" value="" name="password" id="txt_Password" class="form-control text-center" placeholder="Password">--%>
                                                    <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control text-center" placeholder="Enter your Password" runat="server" required="required"></asp:TextBox>
                                                    <span id="show_password" class="fa fa-eye-slash icon"></span>

                                                </div>
                                                <br />

                                                <%-- <div class="form-group">
                                                <label for="email" class="sr-only">Confirm Password
                                                <span class="required">*</span>
                                                </label>
                                                <input type="password" aria-required="true" size="30" value="" runat="server" name="Confirm" id="Confirm" class="form-control text-center" placeholder="Confirm Password">
                                             </div>--%>
                                                <div class="form-group">
                                                    <button type="submit" id="contact_form_submit" runat="server" onserverclick="btn_signup_Click" name="contact_submit" class="theme_button color1 bottommargin_0">Register</button>
                                                    <a href="<%= Page.ResolveClientUrl("~/user/login.aspx")%>" class="theme_button color1 bottommargin_0">login</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </section>


            <section class="ds page_copyright section_padding_20 gorizontal_padding table_section">
                <div class="container-fluid">
                    <div class="row topmargin_10 bottommargin_10">
                        <div class="col-sm-6 text-center text-md-left">
                            <p class="darklinks">
                                &copy; Ally Kat 2020, All Right Reserved.
                  <i class="rt-icon2-heart highlight"></i>by
                  <a href="#">YourFlow</a>
                            </p>
                        </div>
                        <div class="col-sm-6 text-center text-md-right">
                            <!-- <div class="size_small inline-block">
                     <i class="fa fa-cc-visa"></i>
                     <i class="fa fa-cc-discover"></i>
                     <i class="fa fa-cc-mastercard"></i>
                     <i class="fa fa-cc-amex"></i>
                     <i class="fa fa-cc-paypal"></i>
                     </div> -->
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>



    <script src="<%=Page.ResolveClientUrl("~/main-assets/js/compressed.js")%>"></script>
    <script src="<%=Page.ResolveClientUrl("~/main-assets/js/main.js")%>"></script>
    <!-- <script src="<%=Page.ResolveClientUrl("~/main-assets/js/switcher.js")%>"></script> -->
    <%--<script>
                  var calendar = document.getElementById("calendar-table");
                  var gridTable = document.getElementById("table-body");
                  var currentDate = new Date();
                  var selectedDate = currentDate;
                  var selectedDayBlock = null;
                  var globalEventObj = {};
                  
                  var sidebar = document.getElementById("sidebar");
                  
                  function createCalendar(date, side) {
                  var currentDate = date;
                  var startDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
                  
                  var monthTitle = document.getElementById("month-name");
                  var monthName = currentDate.toLocaleString("en-US", {
                  month: "long"
                  });
                  var yearNum = currentDate.toLocaleString("en-US", {
                  year: "numeric"
                  });
                  monthTitle.innerHTML = `${monthName} ${yearNum}`;
                  
                  if (side == "left") {
                  gridTable.className = "animated fadeOutRight";
                  } else {
                  gridTable.className = "animated fadeOutLeft";
                  }
                  
                  setTimeout(() => {
                  gridTable.innerHTML = "";
                  
                  var newTr = document.createElement("div");
                  newTr.className = "row";
                  var currentTr = gridTable.appendChild(newTr);
                  
                  for (let i = 1; i < startDate.getDay(); i++) {
                    let emptyDivCol = document.createElement("div");
                    emptyDivCol.className = "col empty-day";
                    currentTr.appendChild(emptyDivCol);
                  }
                  
                  var lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
                  lastDay = lastDay.getDate();
                  
                  for (let i = 1; i <= lastDay; i++) {
                    if (currentTr.children.length >= 7) {
                       currentTr = gridTable.appendChild(addNewRow());
                    }
                    let currentDay = document.createElement("div");
                    currentDay.className = "col";
                    if (selectedDayBlock == null && i == currentDate.getDate() || selectedDate.toDateString() == new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()) {
                       selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), i);
                  
                       document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("en-US", {
                          month: "long",
                          day: "numeric",
                          year: "numeric"
                       });
                  
                       selectedDayBlock = currentDay;
                       setTimeout(() => {
                          currentDay.classList.add("blue");
                          currentDay.classList.add("lighten-3");
                       }, 900);
                    }
                    currentDay.innerHTML = i;
                  
                    //show marks
                    if (globalEventObj[new Date(currentDate.getFullYear(), currentDate.getMonth(), i).toDateString()]) {
                       let eventMark = document.createElement("div");
                       eventMark.className = "day-mark";
                       currentDay.appendChild(eventMark);
                    }
                  
                    currentTr.appendChild(currentDay);
                  }
                  
                  for (let i = currentTr.getElementsByTagName("div").length; i < 7; i++) {
                    let emptyDivCol = document.createElement("div");
                    emptyDivCol.className = "col empty-day";
                    currentTr.appendChild(emptyDivCol);
                  }
                  
                  if (side == "left") {
                    gridTable.className = "animated fadeInLeft";
                  } else {
                    gridTable.className = "animated fadeInRight";
                  }
                  
                  function addNewRow() {
                    let node = document.createElement("div");
                    node.className = "row";
                    return node;
                  }
                  
                  }, !side ? 0 : 270);
                  }
                  
                  createCalendar(currentDate);
                  
                  var todayDayName = document.getElementById("todayDayName");
                  todayDayName.innerHTML = "Today is " + currentDate.toLocaleString("en-US", {
                  weekday: "long",
                  day: "numeric",
                  month: "short"
                  });
                  
                  var prevButton = document.getElementById("prev");
                  var nextButton = document.getElementById("next");
                  
                  prevButton.onclick = function changeMonthPrev() {
                  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1);
                  createCalendar(currentDate, "left");
                  }
                  nextButton.onclick = function changeMonthNext() {
                  currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1);
                  createCalendar(currentDate, "right");
                  }
                  
                  function addEvent(title, desc) {
                  if (!globalEventObj[selectedDate.toDateString()]) {
                  globalEventObj[selectedDate.toDateString()] = {};
                  }
                  globalEventObj[selectedDate.toDateString()][title] = desc;
                  }
                  
                  function showEvents() {
                  let sidebarEvents = document.getElementById("sidebarEvents");
                  let objWithDate = globalEventObj[selectedDate.toDateString()];
                  
                  sidebarEvents.innerHTML = "";
                  
                  if (objWithDate) {
                  let eventsCount = 0;
                  for (key in globalEventObj[selectedDate.toDateString()]) {
                    let eventContainer = document.createElement("div");
                    eventContainer.className = "eventCard";
                  
                    let eventHeader = document.createElement("div");
                    eventHeader.className = "eventCard-header";
                  
                    let eventDescription = document.createElement("div");
                    eventDescription.className = "eventCard-description";
                  
                    eventHeader.appendChild(document.createTextNode(key));
                    eventContainer.appendChild(eventHeader);
                  
                    eventDescription.appendChild(document.createTextNode(objWithDate[key]));
                    eventContainer.appendChild(eventDescription);
                  
                    let markWrapper = document.createElement("div");
                    markWrapper.className = "eventCard-mark-wrapper";
                    let mark = document.createElement("div");
                    mark.classList = "eventCard-mark";
                    markWrapper.appendChild(mark);
                    eventContainer.appendChild(markWrapper);
                  
                    sidebarEvents.appendChild(eventContainer);
                  
                    eventsCount++;
                  }
                  let emptyFormMessage = document.getElementById("emptyFormTitle");
                  emptyFormMessage.innerHTML = `${eventsCount} events now`;
                  } else {
                  let emptyMessage = document.createElement("div");
                  emptyMessage.className = "empty-message";
                  emptyMessage.innerHTML = "Sorry, no events to selected date";
                  sidebarEvents.appendChild(emptyMessage);
                  let emptyFormMessage = document.getElementById("emptyFormTitle");
                  emptyFormMessage.innerHTML = "No events now";
                  }
                  }
                  
                  gridTable.onclick = function (e) {
                  
                  if (!e.target.classList.contains("col") || e.target.classList.contains("empty-day")) {
                  return;
                  }
                  
                  if (selectedDayBlock) {
                  if (selectedDayBlock.classList.contains("blue") && selectedDayBlock.classList.contains("lighten-3")) {
                    selectedDayBlock.classList.remove("blue");
                    selectedDayBlock.classList.remove("lighten-3");
                  }
                  }
                  selectedDayBlock = e.target;
                  selectedDayBlock.classList.add("blue");
                  selectedDayBlock.classList.add("lighten-3");
                  
                  selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), parseInt(e.target.innerHTML));
                  
                  showEvents();
                  
                  document.getElementById("eventDayName").innerHTML = selectedDate.toLocaleString("en-US", {
                  month: "long",
                  day: "numeric",
                  year: "numeric"
                  });
                  
                  }
                  
                  var changeFormButton = document.getElementById("changeFormButton");
                  var addForm = document.getElementById("addForm");
                  changeFormButton.onclick = function (e) {
                  addForm.style.top = 0;
                  }
                  
                  var cancelAdd = document.getElementById("cancelAdd");
                  cancelAdd.onclick = function (e) {
                  addForm.style.top = "100%";
                  let inputs = addForm.getElementsByTagName("input");
                  for (let i = 0; i < inputs.length; i++) {
                  inputs[i].value = "";
                  }
                  let labels = addForm.getElementsByTagName("label");
                  for (let i = 0; i < labels.length; i++) {
                  labels[i].className = "";
                  }
                  }
                  
                  var addEventButton = document.getElementById("addEventButton");
                  addEventButton.onclick = function (e) {
                  let title = document.getElementById("eventTitleInput").value.trim();
                  let desc = document.getElementById("eventDescInput").value.trim();
                  
                  if (!title || !desc) {
                  document.getElementById("eventTitleInput").value = "";
                  document.getElementById("eventDescInput").value = "";
                  let labels = addForm.getElementsByTagName("label");
                  for (let i = 0; i < labels.length; i++) {
                    labels[i].className = "";
                  }
                  return;
                  }
                  
                  addEvent(title, desc);
                  showEvents();
                  
                  if (!selectedDayBlock.querySelector(".day-mark")) {
                  selectedDayBlock.appendChild(document.createElement("div")).className = "day-mark";
                  }
                  
                  let inputs = addForm.getElementsByTagName("input");
                  for (let i = 0; i < inputs.length; i++) {
                  inputs[i].value = "";
                  }
                  let labels = addForm.getElementsByTagName("label");
                  for (let i = 0; i < labels.length; i++) {
                  labels[i].className = "";
                  }
                  
                  } 
               </script>--%>
    <script type="text/javascript">  
        $(document).ready(function () {
            $('#show_password').hover(function show() {
                //Change the attribute to text  
                $('#txtPassword').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('#txtPassword').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
            //CheckBox Show Password  
            $('#ShowPassword').click(function () {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>
</body>
</html>
