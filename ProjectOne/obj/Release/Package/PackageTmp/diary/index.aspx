<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.diary.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds section_padding_70 section_padding_bottom_60 columns_padding_25">
                        <div class="container">
                           <div class="row">
                               <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Diary</span></h2>
                                </div>
                              <div class="col-sm-10 col-sm-push-1" id="diary_desc" runat="server">
<%--                                 <div class="row">
                                    <div class="col-sm-12 bottommargin_40">
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
                                                      <a href="<%= Page.ResolveClientUrl("~/diary-details/")%>">Sediam nonumy eirmod</a>
                                                   </h3>
                                                   <p>Lorem ipsum dolorame consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt labore dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                                                   <p class="item-meta grey">
                                                      <i class="rt-icon2-calendar4 highlight"></i> Feb 12, 2016
                                                      <i class="rt-icon2-world highlight"></i> Conference Hall, LA
                                                   </p>
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
                                                      <a href="<%= Page.ResolveClientUrl("~/diary-details/")%>">Tempor invidunt labore dolore</a>
                                                   </h3>
                                                   <p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore olores.</p>
                                                   <p class="item-meta grey">
                                                      <i class="rt-icon2-calendar4 highlight"></i> Feb 12, 2016
                                                      <i class="rt-icon2-world highlight"></i> Conference Hall, LA
                                                   </p>
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
                                                   <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/03.jpg")%>" alt="Allykat" title="Allykat">
                                                   <div class="media-links">
                                                      <a class="abs-link" title="" href="#"></a>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="col-md-8">
                                                <div class="item-content">
                                                   <h3 class="entry-title topmargin_0">
                                                      <a href="<%= Page.ResolveClientUrl("~/diary-details/")%>">Consetetur sadipscing elitr</a>
                                                   </h3>
                                                   <p>At vero eos et accusam et justo duo dolores ea rebum stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolorame consetetur sadipscing elitr.</p>
                                                   <p class="item-meta grey">
                                                      <i class="rt-icon2-calendar4 highlight"></i> Feb 12, 2016
                                                      <i class="rt-icon2-world highlight"></i> Conference Hall, LA
                                                   </p>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>--%>
                              </div>
                              <!--eof .col-sm-* (main content)-->
                           </div>
                        </div>
                     </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
