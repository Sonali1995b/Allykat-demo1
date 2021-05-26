<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.news.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--02 Nov 2020 Edited By Samrat/Amitava-->
    <style>
     /*   .row{
            margin-left:0 !important;
        }*/
        .page_portfolio{
            width:100%;
        }
        .post{
            height:550px;
        }
        h3.entry-title a{
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height:65px;
        }
        /*Test*/
        .item-content.entry-content p{
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds page_portfolio section_padding_70">
                        <div class="container">
                           <div class="row">
                                <div class="col-lg-12 text-center">                              
                                <h2><span class="big">News and Announcements</span></h2>
                                </div>
                              <div class="col-sm-12">
                                 <div class="isotope_container isotope row masonry-layout" id="news_list" runat="server">
                                    <%--<div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="<%= Page.ResolveClientUrl("~/news-details/")%>" rel="bookmark">Consetetur elitr tempor</a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/02.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Diam nonumy eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/03.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Eirmod elitr diam nonumy tempor</a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/04.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Tempor elitr diam nonumy</a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Consetetur elitr diam eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/06.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Nonumy onsetetur elitr diam eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/08.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Tempor consetetur elitr diam nonumy eirmod </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/08.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Consetetur elitr diam nonumy eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/09.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Eirmod tempor consetetur elitr diam nonumy </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/10.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Diam nonumy consetetur elitr eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/11.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Consetetur elitr diam nonumy eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis veliesse molestie consequat vel illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>
                                    <div class="isotope-item col-lg-4 col-md-6 col-sm-12">
                                       <article class="vertical-item mosaic-post post format-standard text-center muted_background">
                                          <div class="item-media entry-thumbnail">
                                             <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/12.jpg")%>" alt="Allykat" title="Allykat">
                                             <div class="media-links">
                                                <a class="abs-link" title="" href="#"></a>
                                             </div>
                                          </div>
                                          <div class="item-content entry-content">
                                             <header class="entry-header">
                                                <h3 class="entry-title">
                                                   <a href="#" rel="bookmark">Elitr diam nonumy consetetur eirmod tempor </a>
                                                </h3>
                                                <span class="date main_bg_color">
                                                <time datetime="2016-01-10T15:05:23+00:00" class="entry-date">
                                                Jan 10, 2016
                                                </time>
                                                </span>
                                             </header>
                                             <!-- .entry-header -->
                                             <p>Duis autem eumre dolor hendrerit vulputate illum dolore at vero eros et accumsan et iusto odio dignissim.</p>
                                          </div>
                                          <!-- .item-content.entry-content -->
                                       </article>
                                    </div>--%>
                                 </div>
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
        document.getElementById('news_menu').classList.add('active');
        document.getElementById('pages_menu').classList.add('active');
    </script>
</asp:Content>
