<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectOne.offer.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <style>
        .top_section{
            margin-top:3em;
        }
        @media (min-width:1440px){
            .top_section{
                margin-top:7em;
            }
        }
        .row{
            margin-left:0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <%-- <section class="ds column_margin_0 section_padding_bottom_80 top_section">--%>
     <section class="ds page_portfolio section_padding_70">
                  <div class="container">
                  <div class="row text-center">
                  <h2>
                  <span class="big">Exciting Offers</span>
                  <br>
                  <span class="highlight muellerhoff">Offers Quotes</span>
                  </h2>
                  <br><br>
                  <div class="col-sm-12">
                  <div class="flexslider banner-slider">
                  <ul class="slides">
                  <li class="gradient_bg_goriz">
                  <div class="bg_overlay"></div>
                  <img id="offer_img" alt='Allykat' title='Allykat' runat="server"/>
                  <div class="media-links">
                  <a class="abs-link" href="#"></a>
                  </div>
                 <%-- </li>
                  <li class="gradient_bg_goriz">
                  <div class="bg_overlay"></div>
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/banner_slide_02.jpg")%>" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <a class="abs-link" href="#"></a>
                  </div>
                  </li>--%>
                  </ul>
                  </div>
                  </div>
                  </div>
                  </div>
                  </section >
                       <section class="ds padding-t-b-70" id="rate_bgimg" runat="server">
                        <div class="container">
                           <div class="row">
                              <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-0" id="offer_desc" runat="server">
                                 <div class="row">
                                    <%--<div class="col-sm-12 bottommargin_40">
                                       <div class="side-item event-item content-padding with_background">
                                          <div class="row">
                                             <div class="col-md-4">
                                                <div class="item-media">
                                                   <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/01.jpg")%>" alt="Allykat" title="Allykat">
                                                   <div class="media-links">
                                                      <a class="abs-link" title="" href="#"></a>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="col-md-8">
                                                <div class="item-content">
                                                   <h3 class="entry-title topmargin_0">
                                                      <a href="#">25% off Sediam nonumy eirmod</a>
                                                   </h3>
                                                   <p>Lorem ipsum dolorame consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt labore dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                                                 <p>Lorem ipsum dolorame consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt labore dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="col-sm-12 bottommargin_40">
                                       <div class="side-item event-item content-padding with_background">
                                          <div class="row">
                                             <div class="col-md-4">
                                                <div class="item-media">
                                                   <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/02.jpg")%>" alt="Allykat" title="Allykat">
                                                   <div class="media-links">
                                                      <a class="abs-link" title="" href="#"></a>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="col-md-8">
                                                <div class="item-content">
                                                   <h3 class="entry-title topmargin_0">
                                                      <a href="#">50% off Tempor invidunt labore dolore</a>
                                                   </h3>
                                                   <p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore olores.</p>
                                                 <p>Lorem ipsum dolorame consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt labore dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>--%>
                                    
                                 </div>
                              </div>
                              <!--eof .col-sm-* (main content)-->
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
                                 <%--<div class="owl-carousel blog-carousel theme-owl-carousel" data-margin="30" data-nav="false" data-dots="true" data-center="true" data-loop="true" data-items="5" data-autoplay="false" data-responsive-xs="1" data-responsive-sm="2" data-responsive-md="2"
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <script>
        var menus = document.getElementsByClassName('menus');
        for (var i = 0; i < menus.length; i++) {
            menus[i].classList.remove('active');
        }
        document.getElementById('spcl_offr_menu').classList.add('active');
    </script>
</asp:Content>
