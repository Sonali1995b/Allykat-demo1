<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectOne.selfie.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <style>
        .row{
            margin-right:-15px !important;
        }
        .page_portfolio{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
     <section class="ds page_portfolio section_padding_70 columns_padding_0">
                        <div class="container-fluid">
                           <div class="row">
                                <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Awesome Selfie's</span></h2>
                                </div>
                              <div class="col-sm-12" id="selfie_list" runat="server">
                                 <%--<div class="isotope_container isotope row masonry-layout" data-filters=".isotope_filters">
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/22.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/22.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/02.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/02.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/03.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/03.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/04.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/04.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/06.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/06.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/22.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/22.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/08.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/08.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/09.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/09.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/21.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/21.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/11.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/11.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6">
                                       <div class="vertical-item gallery-item content-absolute text-center cs">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/12.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/12.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>--%>
                                 <!-- eof .isotope_container.row -->
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
        document.getElementById('selfie_menu').classList.add('active');
    </script>
</asp:Content>
