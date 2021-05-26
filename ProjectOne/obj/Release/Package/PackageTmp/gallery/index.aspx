<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.gallery.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

     <section class="ds page_portfolio section_padding_top_80 section_padding_bottom_50 columns_padding_0 gorizontal_padding">
                        <div class="container-fluid">
                           <div class="row">
                               <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Gallery</span></h2>
                                </div>
                              <div class="col-sm-12">
                                <%-- <div class="filters isotope_filters text-center" >
                                    <a href="#" data-filter="*" class="selected">All</a>
                                    <a href="#" data-filter=".fashion">Sexy</a>
                                    <a href="#" data-filter=".studio">Hot</a>
                                    <a href="#" data-filter=".session">Dirty</a>
                                 </div>--%>
                                  
                                 <div class="isotope_container isotope row masonry-layout" data-filters=".isotope_filters" id="gallery_img" runat="server">
                              
                                   <%-- <div class="isotope-item col-lg-6 col-md-6 col-sm-6  muted_background fashion">
                                       <div class="vertical-item gallery-title-item content-absolute">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                      <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background fashion">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background fashion">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background fashion">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                             
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background studio">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background studio">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                                
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background session">
                                       <div class="vertical-item gallery-title-item content-absolute">
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
                                    <div class="isotope-item col-lg-6 col-md-6 col-sm-6 muted_background session">
                                       <div class="vertical-item gallery-title-item content-absolute">
                                          <div class="item-media">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/12.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <div class="links-wrap">
                                                   <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/12.jpg")%>"></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>--%>
                            </div>
                                </div>
                                 <!-- eof .isotope_container.row -->
                             
                           </div>
                        </div>
                     </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
