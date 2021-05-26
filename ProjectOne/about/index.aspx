<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.about.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
        <section class="ds section_padding_70 about-content">
                        <div class="container">
                           <div class="row">
                              <div class="col-sm-12">
                                 <article class="post format-small-image with_background">
                                    <div class="side-item content-padding">
                                       <div class="row">
                                          <div class="col-md-6">
                                             <div class="item-media entry-thumbnail" id="about_img" runat="server">
                                                <%--<img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/18.jpg")%>" alt="Allykat" title="Allykat">--%>
                                             </div>
                                          </div>
                                          <div class="col-md-6">
                                             <div class="item-content .about-content">
                                             <div id="about_desc" runat="server">
                                               <%-- <h2 class="big topmargin_0 bottommargin_30">
                                                   About Ally Kat
                                                </h2>
                                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing esed diam nonumy eirmod tempor invidunt ut labore et dolore magna.</p>
                                                <p>
                                                   At vero eos et accusam et justo duo dolores et ea rebum. Stet gubergren no sea takimata sanctus est Lorem ipsum dolor sit amet ipsumlor eut consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt labore et dolore magna liquyam erat.
                                                </p>--%>
                                               </div>
                                                <div class="row">
                                                   <div class="col-sm-6" id="phone_desc" runat="server">
                                                      <%--<ul class="list1 no-bullets">
                                                         <li>
                                                            <i class="highlight rt-icon2-phone5"></i>
                                                            <span class="grey">Phone:</span>
                                                            +1 232 3235 324
                                                         </li>
                                                         <li>
                                                            <i class="highlight rt-icon2-pen"></i>
                                                            <span class="grey">Fax:</span>
                                                            +1 232 3235 324
                                                         </li>
                                                      </ul>--%>
                                                   </div>
                                                   <div class="col-sm-6" id="email_desc" runat="server">
                                                      <%--<ul class="list1 no-bullets">
                                                         <li>
                                                            <i class="highlight rt-icon2-mail"></i>
                                                            <span class="grey">Email:</span>
                                                            <a href="#">
                                                            <em>youremail@domain.com</em>
                                                            </a>
                                                         </li>
                                                         <li>
                                                            <i class="highlight rt-icon2-world"></i>
                                                            <span class="grey">Website:</span>
                                                            <a href="#">
                                                            <em>allykat.com.au</em>
                                                            </a>
                                                         </li>
                                                      </ul>--%>
                                                   </div>
                                                </div>
                                                <div class="page_social_icons topmargin_20" id="social_desc" runat="server">
                                                   <%--<a class="social-icon color-bg-icon soc-facebook" href="www.facebook.com" title="Facebook"></a>
                                                   <a class="social-icon color-bg-icon soc-twitter" href="www.twitter.com" title="Twitter"></a>
                                                   <a class="social-icon color-bg-icon soc-instagram" href="www.instagram.com." title="instagram"></a>--%>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </article>
                              </div>
                           </div>
                        </div>
                     </section>
                     <section class="ds parallax calltoaction section_padding_100" id="rate_bgimg" runat="server">
                        <div class="container">
                           <div class="row topmargin_60 bottommargin_60">
                              <h2 style="text-align: center;">
                                 <span class="big">Rates</span>
                              </h2>
                              <br><br>
                              <div class="row">
                                 <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="rateInner">
                                       <div class="ratesSubtitle">
                                          <h3>Incall</h3>
                                       </div>
                                        <div id="incallrate_desc" runat="server">
                                            <%-- <table class="table table-hover">
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
                                 </div>
                                 <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="rateInner">
                                       <div class="ratesSubtitle">
                                          <h3>Outcall</h3>
                                       </div>
                                      <div id="outcallrate_desc" runat="server">
                                       <%--<table class="table table-hover">
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
        document.getElementById('about_menu').classList.add('active');
    </script>
</asp:Content>
