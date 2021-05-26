<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.tour.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>

        function show_modal() {
            $("#modal_default").css('display', 'block');
            //   alert('ok');
        }

        function openalert() {
            alert('ok');
        }

        function close_modal() {
            $("#modal_default").css('display', 'none');
        }

        function my_fun() {

            var dt = document.getElementById("eventDayName").innerHTML;

            PageMethods.GetEvent(dt, OnSuccess);

        }

        function OnSuccess(response, userContext, methodName) {
            // alert(response);



            let emptyMessage = document.createElement("div");
            emptyMessage.className = "empty-message";
            emptyMessage.innerHTML = response;
            sidebarEvents.appendChild(emptyMessage);
            let emptyFormMessage = document.getElementById("emptyFormTitle");
            emptyFormMessage.innerHTML = "No events now";
        }



        function my_js_function() {
            my_fun();
        }

        function popup() {
            swal({
                title: "Good Job!",
                text: "Data submited successfully",
                icon: "success",
                button: "close",
            });
        }
    </script>
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <style>
        .row{
            margin-right:-15px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds section_padding_70 about-content">
        <div class="container">
            <div class="row">
                 <div class="col-lg-12 text-center">                              
                <h2><span class="big">Tour</span></h2>
                </div>
                <div class="col-sm-12">
                    <div class="tour-box aos-init aos-animate" data-aos="fade-up" data-aos-delay="">
                        <div class="sec-title">
                            <h2 class="section-title">Tour</h2>
                            <p>
                                Offering content producers the very best environment, showcasing world-class 
                                          content. Powering your content with Artificial Intelligence and Machine Learning 
                                          to our global audience.
                            </p>
                        </div>
                        <div class="tourSubtitle">
                            <h3>Australian Tours</h3>
                            <p>
                                I'm planning a potenical visit to Melb. Depending on amount of hours you'd 
                                          desire to book me for
                            </p>
                        </div>
                        <div id="tour_list" runat="server">
                            <%-- <table class="table table-hover">
                                       <thead>
                                          <tr>
                                             <th scope="col">To</th>
                                             <th scope="col">From</th>
                                             <th scope="col">Untill</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>Brisbane</td>
                                             <td>1st April</td>
                                             <td>30th June</td>
                                          </tr>
                                          <tr>
                                             <td>Melbourne</td>
                                             <td>16th July</td>
                                             <td>31st July</td>
                                          </tr>
                                       </tbody>
                                    </table>--%>
                        </div>
                        <div class="subscribeTour pt-3">
                            <h3>SUBSCRIBE TO MY TOURS IN YOUR CITY</h3>
                            <p>Be notified when Angle tours to your selected cities</p>
                            <%-- <button type="button" class="btn btn-tour sbubutton">Subscribe to my tours</button>
                            <button type='button' id='btn_Add_Menu' class='btn btn-tour sbubutton' onclick='show_modal();'>Subscribe to my tours</button>--%>
                            <button type="button" class="theme_button color1 topmargin_20" data-toggle="modal" data-target="#myModal">Subscribe to my tours</button>
                        </div>
                        <!--modal-->
                        <%--<div id="modal_default" class="modal" tabindex="-1" style="display: none; max-height: 50%; overflow: hidden;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Enter Your Email & Select the City</h5>
                                    <button type="button" onclick="close_modal()" class="close cls" data-dismiss="modal">&times;</button>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">
                                            Enter the Email</label>
                                        <div class="col-lg-8">

                                            <asp:TextBox ID="txt_EMAIL" runat="server" Style="position: relative; top: -10px;" class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">
                                            Select the city</label>
                                        <div class="col-lg-8">
                                            <asp:DropDownList ID="ddl_CITY" runat="server" class="form-control"></asp:DropDownList>

                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" onclick="close_modal()" class="btn btn-link cls" data-dismiss="modal">Close</button>
                                    <input type="button" id="btn_Save_Menu" runat="server" onserverclick="btn_Save_Menu_ServerClick" class="btn bg-primary" value="Submit" />
                                </div>
                            </div>
                        </div>
                    </div>--%>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Enter Your Email and select the city</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-inline" action="">
                                            <div class="row">
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label">
                                                        Enter the Email</label>
                                                    <div class="col-lg-8">

                                                        <asp:TextBox ID="txt_EMAIL" runat="server" Style="position: relative; top: -10px;" class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group row">
                                                    <label class="col-lg-4 col-form-label">
                                                        Select the city</label>
                                                    <div class="col-lg-8">
                                                        <asp:DropDownList ID="ddl_CITY" runat="server" class="form-control"></asp:DropDownList>

                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <%--<div class="modal-footer">
                                        <button type="submit" class="btn btn-default" data-dismiss="modal">Submit</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>--%>
                                    <div class="modal-footer">
                                        <button type="button" onclick="close_modal()" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <input type="button" id="btn_Save_Menu" runat="server" onserverclick="btn_Save_Menu_ServerClick" class="btn btn-default" value="Submit" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <section class="ds parallax calltoaction section_padding_100" style="background-image: url('/main-assets/images/parallax/call_to_action_2.jpg')">
        <div class="container">
            <div class="row topmargin_60 bottommargin_60">
                <h2 style="text-align: center;">
                    <span class="big">Rates</span>
                </h2>
                <br>
                <br>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="rateInner" id="incallrate_list" runat="server">
                            <%--    <div class="ratesSubtitle">
                                          <h3>Incall</h3>
                                       </div>
                                       <table class="table table-hover">
                                          <thead>
                                             <tr>
                                                <th scope="col">Hours</th>
                                                <th scope="col">Rate</th>
                                                <th scope="col">Additional Hours</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>30 min</td>
                                                <td>$300</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>1 Hour</td>
                                                <td>$500</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>1.5 Hours</td>
                                                <td>$650</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                             </tr>
                                             <tr>
                                                <td>2 Hours</td>
                                                <td>$900</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>3 Hours</td>
                                                <td>$ 1300</td>
                                                <td>Extra</td>
                                             </tr>
                                          </tbody>
                                       </table>--%>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="rateInner" id="outcallrate_list" runat="server">
                            <%--<div class="ratesSubtitle">
                                          <h3>Outcall</h3>
                                       </div>
                                       <table class="table table-hover">
                                          <thead>
                                             <tr>
                                                <th scope="col">Hours</th>
                                                <th scope="col">Rate</th>
                                                <th scope="col">Additional Hours</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>30 min</td>
                                                <td>$300</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>1 Hour</td>
                                                <td>$500</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>1.5 Hours</td>
                                                <td>$750</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>2 Hours</td>
                                                <td>$1000</td>
                                                <td>Extra</td>
                                             </tr>
                                             <tr>
                                                <td>3 Hours</td>
                                                <td>$ 1500</td>
                                                <td>Extra</td>
                                             </tr>
                                          </tbody>
                                       </table>--%>
                        </div>
                    </div>
                </div>
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
                    <br>
                    <br>
                    <div class="owl-carousel blog-carousel theme-owl-carousel" data-margin="30" data-nav="false" data-dots="true" data-center="true" data-loop="true" data-items="5" data-autoplay="false" data-responsive-xs="1" data-responsive-sm="2" data-responsive-md="2"
                        data-responsive-lg="3" data-responsive-xlg="5" id="news_list" runat="server">
                        <%-- <article class="vertical-item post format-standard text-center">
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
                                    </article>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <script>
        var menus = document.getElementsByClassName('menus');
        for (var i = 0; i < menus.length; i++) {
            menus[i].classList.remove('active');
        }
        document.getElementById('tour_menu').classList.add('active');
    </script>
</asp:Content>
