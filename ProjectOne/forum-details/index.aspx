<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.forum_details.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <section class="ds section_padding_70 columns_padding_25">
                        <div class="container">
                           <div class="row">
                                <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Forum Details</span></h2>
                                </div>
                              <div class="col-sm-7 col-md-8 col-lg-8">
                                 <article>
                                 <div  id="forum_img" runat="server">
                                    <%--<div class="entry-thumbnail bottommargin_40">
                                       <img src=""  alt="Allykat" title="Allykat">
                                    </div>--%>
                                  </div>
                                            
                                    <header class="entry-header">
                                <div id="forum_details" runat="server">
                                      <%-- <div class="entry-meta item-meta">
                                          <span class="author greylinks">
                                          By
                                          <a href="#">Admin</a>
                                          </span>
                                          <span class="date">
                                          <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                          Jan 10, 2016
                                          </time>
                                          </span>
                                       </div>
                                       <!-- .entry-meta -->
                                       <h1 class="entry-title">
                                          <a href="#" rel="bookmark">Post With Large Image</a>
                                       </h1>--%>
                                </div>
                                    </header>
                                    <!-- .entry-header -->
                                    <div class="entry-content" id="forum_desc" runat="server">
                                      <%-- <p class="big-first-letter">
                                          Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut wisi enim ad
                                          minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
                                       </p>
                                       <p>
                                          Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel
                                          <a href="#">illum dolore eu feugiat</a> nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. At vero eos et accusam et justo duo.
                                       </p>--%>
                                    </div>
                                    <!-- .entry-content -->
                                 </article>
                              </div>
                              <!--eof .col-sm-8 (main content)-->

                                          <!-- sidebar -->
                              <aside class="col-sm-5 col-md-4 col-lg-4">


                       
                                 <div class="with_background with_padding">

                                    <div class="widget widget_popular_entries">

                                       <h3 class="widget-title">Resent News</h3>
                                     <div id="forum_desc1" runat="server">
                                      <%-- <ul class="media-list darklinks">
                                          <li class="media">
                                             <a class="media-left" href="#">
                                                <img class="media-object" src="images/recent_post5.jpg" alt="Allykat" title="Allykat">
                                             </a>
                                             <div class="media-body">
                                                
                                                <p>
                                                   <a href="#">Eod tempor invidunt labore dolore magna</a>
                                                </p>
                                                
                                             </div>
                                          </li>

                                          <li class="media">
                                             <a class="media-left" href="#">
                                                <img class="media-object" src="images/recent_post5.jpg" alt="Allykat" title="Allykat">
                                             </a>
                                             <div class="media-body">
                                                
                                                <p>
                                                   <a href="#">Aliquyam erat, sed voluptua vero eos </a>
                                                </p>
                                               

                                             </div>
                                          </li>

                                          <li class="media">
                                             <a class="media-left" href="#">
                                                <img class="media-object" src="images/recent_post5.jpg" alt="Allykat" title="Allykat">
                                             </a>
                                             <div class="media-body">
                                                
                                                <p>
                                                   <a href="#">Et justo duo dolores et ea rebum</a>
                                                </p>
                                              

                                             </div>
                                          </li>

                                          <li class="media">
                                             <a class="media-left" href="#">
                                                <img class="media-object" src="images/recent_post5.jpg" alt="Allykat" title="Allykat">
                                             </a>
                                             <div class="media-body">
                                                
                                                <p>
                                                   <a href="#">Stetclita kasd gubergren no sea takimata</a>
                                                </p>
                                                

                                             </div>
                                          </li>

                                          <li class="media">
                                             <a class="media-left" href="#">
                                                <img class="media-object" src="images/recent_post5.jpg" alt="Allykat" title="Allykat">
                                             </a>
                                             <div class="media-body">

                                                <p>
                                                   <a href="#">Lorem ipsum dolor sitmet amet consetetur </a>
                                                </p>
                                               

                                             </div>
                                          </li>

                                       </ul>--%>
                                    </div>
                                    </div>

                                 </div>


                              </aside>
                              <!-- eof aside sidebar -->

                           </div>
                        </div>
                     </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
