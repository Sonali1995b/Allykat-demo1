<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%--   <script src="/main-assets/js/compressed.js"></script>--%>
    <script src="/main-assets/js/main.js"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="<%=Page.ResolveClientUrl("~/main-assets/css/style.css")%>" />
      <link href="<%=Page.ResolveClientUrl("~/main-assets/fullcalendar/lib/main.css")%>" rel='stylesheet' />
    <%-- /*# calender---31-10-20-------*#/--%>
    

    
     
    <script>
        function popup() {
            swal({
                title: "Successful!",
                text: "Your Booking is Successful.",
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds ms intro_section page_mainslider">
                     <div class="flexslider">
                        <ul class="slides ds">
                           <li>
                              <div id="banner1" runat="server">
                             <%-- <img src=""  alt="Allykat" title="Allykat">--%></div>
                              <div class="container">
                                 <div class="row">
                                    <div class="col-sm-12">
                                       <div class="slide_description_wrapper">
                                          <div class="slide_description">
                                             <div class="intro-layer" data-animation="expandUp">
                                                <h2 class="highlight text-uppercase">I am Ally Kat</h2>
                                                <h3 class="extra-big text-uppercase">PROFESSIONAL ESCORTS GIRL </h3>
                                             </div>
                                             <div class="intro-layer" data-animation="expandUp">
                                                <div class="model-parameters topmargin_40 bottommargin_40">
                                                   <div>
                                                      <span class="bold">Height</span>
                                                      <br>
                                                      <span>165</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Bust</span>
                                                      <br>
                                                      <span>Dress Size 8</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Body</span>
                                                      <br>
                                                      <span>Petite/Slim</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Hair</span>
                                                      <br>
                                                      <span>Long Blonde</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Eyes </span>
                                                      <br>
                                                      <span>Green</span>
                                                   </div>
                                                </div>
                                                <a href="<%=Page.ResolveClientUrl("/about/")%>" class="theme_button color1">Read More</a>
                                                <a href="<%=Page.ResolveClientUrl("/gallery/")%>" class="theme_button inverse">View Gallery</a>
                                             </div>
                                          </div>
                                          <!-- eof .slide_description -->
                                       </div>
                                       <!-- eof .slide_description_wrapper -->
                                    </div>
                                    <!-- eof .col-* -->
                                 </div>
                                 <!-- eof .row -->
                              </div>
                              <!-- eof .container -->
                           </li>
                           <li>
                              <div id="banner2" runat="server">
                             <%-- <img src=""  alt="Allykat" title="Allykat">--%></div>
                              <div class="container">
                                 <div class="row">
                                    <div class="col-sm-12">
                                       <div class="slide_description_wrapper">
                                          <div class="slide_description">
                                             <div class="intro-layer" data-animation="expandUp">
                                                <h2 class="highlight text-uppercase">I am Ally Kat</h2>
                                                <h3 class="extra-big text-uppercase">PROFESSIONAL ESCORTS GIRL </h3>
                                             </div>
                                             <div class="intro-layer" data-animation="expandUp">
                                                <div class="model-parameters topmargin_40 bottommargin_40">
                                                   <div>
                                                      <span class="bold">Height</span>
                                                      <br>
                                                      <span>165</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Bust</span>
                                                      <br>
                                                      <span>Dress Size 8</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Body</span>
                                                      <br>
                                                      <span>Petite/Slim</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Hair</span>
                                                      <br>
                                                      <span>Long Blonde</span>
                                                   </div>
                                                   <div>
                                                      <span class="bold">Eyes </span>
                                                      <br>
                                                      <span>Green</span>
                                                   </div>
                                                </div>
                                                <a href="<%=Page.ResolveClientUrl("/about/")%>" class="theme_button color1">Read More</a>
                                                <a href="<%=Page.ResolveClientUrl("/gallery/")%>" class="theme_button inverse">View Gallery</a>
                                             </div>
                                          </div>
                                          <!-- eof .slide_description -->
                                       </div>
                                       <!-- eof .slide_description_wrapper -->
                                    </div>
                                    <!-- eof .col-* -->
                                 </div>
                                 <!-- eof .row -->
                              </div>
                              <!-- eof .container -->
                           </li>
                        </ul>
                     </div>
                     <!-- eof flexslider -->
                  </section>
                  <section class="ds page_models models_square gorizontal_padding section_padding_70 columns_padding_0">
                     <div class="container-fluid">
                        <div class="row bottommargin_50 boxed-padding">
                           <div class="col-lg-12 text-center">
                              <%--<div class="filters isotope_filters inline-block margin_0">
                                 <a href="#" data-filter="*" class="selected">All</a>
                                 <a href="#" data-filter=".fashion">Sexy</a>
                                 <a href="#" data-filter=".studio">Hot</a>
                                 <a href="#" data-filter=".session">Dirty</a>
                              </div>--%>
                                <h2>
                                  <span class="big">Gallery</span>
                             
                               </h2>

                           </div>
                           <div class="col-lg-5 text-lg-right">
                           </div>
                        </div>
                         
                        <div class="isotope_container isotope row masonry-layout bottommargin_20" data-filters=".isotope_filters" id="gallery_desc" runat="server">
                         <%--  <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 fashion">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/13.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/13.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 fashion">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/14.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/14.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 fashion">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/15.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/15.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 studio">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/16.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/16.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 studio">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/17.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/17.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 studio">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/18.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/18.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 session">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/19.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/19.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6 session">
                              <div class="vertical-item content-absolute">
                                 <div class="item-media">
                                    <img src="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/20.jpg")%>" alt="Allykat" title="Allykat">
                                    <div class="media-links">
                                    </div>
                                 </div>
                                 <div class="item-content text-center before_cover cs">
                                    <div class="links-wrap">
                                       <a class="p-view prettyPhoto pull-right" title="" data-gal="prettyPhoto[gal]" href="<%=Page.ResolveClientUrl("~/main-assets/images/models_square/20.jpg")%>"></a>
                                    </div>
                                    <div class="bg_overlay"></div>
                                 </div>
                              </div>
                           </div>--%>
                        </div>
                         </div>
                  </section>
                  <section class="ds column_margin_0 section_padding_bottom_80">
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
                  <div id="offerimg" runat="server">
                <%--  <img src="" alt="Allykat" title="Allykat">--%></div>
                  <div class="media-links">
                  <a class="abs-link" href="#"></a>
                  </div>
                  </li>
                 <%-- <li class="gradient_bg_goriz">
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
                  </section>
                  <section class="ds ms page_testimonials section_padding_50">
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center">
                  <h2>
                  <span class="big">My Clients</span>
                  <br>
                  <span class="highlight muellerhoff">Clients Testimonials</span>
                  </h2>
               
              <%--  <div class="testimonials-body" id="testimonial_desc" runat="server">--%>
                    <div id="testimonialslider" class="flexslider">
                           <ul class="slides"  runat="server" id="testimonial_desc">
                <%--  <blockquote class="blockquote-big" data-slide="1">
                  At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy.
                  </blockquote>
                  <blockquote class="blockquote-big" data-slide="2">
                  At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa
                  </blockquote>
                  <blockquote class="blockquote-big" data-slide="3">
                  Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus
                  </blockquote>
                  <blockquote class="blockquote-big" data-slide="4">
                  Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus
                  </blockquote>
                  <blockquote class="blockquote-big" data-slide="5">
                  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
                  </blockquote>--%>
                             </ul>
                  </div>
                
                <%-- <div id="testimonial_desc1" runat="server" class="owl-carousel testimonials-carousel" data-margin="0" data-nav="true" data-loop="true" data-center="true" data-items="3" data-responsive-lg="3" data-responsive-md="3" data-responsive-sm="3" data-responsive-xs="3">--%>
                      <div id="testithumbcarousel" class="flexslider" >
                         <ul class="slides" runat="server" id="testimonial_desc1">
                  <%--   <div class="testimonial">
                  <div class="author-photo">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/01.jpg")%>" alt="Allykat" title="Allykat">
                  </div>
                  <div class="author-meta">
                  <span class="bold highlight">Carl Johnson</span>
                  <br> Manager
                  </div>
                  </div>
                  <div class="testimonial">
                  <div class="author-photo">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/02.jpg")%>" alt="Allykat" title="Allykat">
                  </div>
                  <div class="author-meta">
                  <span class="bold highlight">Carl Johnson</span>
                  <br> Manager
                  </div>
                  </div>
                  <div class="testimonial">
                  <div class="author-photo">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/03.jpg")%>" alt="Allykat" title="Allykat">
                  </div>
                  <div class="author-meta">
                  <span class="bold highlight">Carl Johnson</span>
                  <br> Manager
                  </div>
                  </div>
                  <div class="testimonial">
                  <div class="author-photo">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/04.jpg")%>" alt="Allykat" title="Allykat">
                  </div>
                  <div class="author-meta">
                  <span class="bold highlight">Carl Johnson</span>
                  <br> Manager
                  </div>
                  </div>
                  <div class="testimonial">
                  <div class="author-photo">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/05.jpg")%>" alt="Allykat" title="Allykat">
                  </div>
                  <div class="author-meta">
                  <span class="bold highlight">Carl Johnson</span>
                  <br> Manager
                  </div>
                  </div>
                  </div>
             
                  </div>
                  </div>--%>
                   </ul>
                  </div>
                     
                  </section>
                  <section class="ds intro_section abtsc" id="about_section">
                  <div class="flexslider vertical-nav">
                  <ul class="slides">
                  <li>
                  <div id="aboutimg" runat="server">
                  <%--<img id="about_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <h2 class="big margin_0">About ME</h2>
                  <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">I am Ally Kat</h2>
                  </div>
                  <div class="intro-layer" data-animation="slideExpandUp">
                 
                  <p class="entry-excerpt bottommargin_30">
                  Just Turned 21 YO ANGLE - AUSSIE BLONDE Petite size 8 - D Cup
                  </p>
                <div id="about_desc" runat="server">
                  <%--<p>
                  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata
                  sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.
                  </p>
                  <p>
                  Aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr:
                  </p>--%>
                 </div>
                  <a href="<%= Page.ResolveClientUrl("~/about/")%>" class="theme_button color1 topmargin_20">About Me</a>
                  </div>
                  </div>
                  <!-- eof .slide_description -->
                  </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                  </div>
                  <!-- eof .container -->
                  </li>
                  <li>
                 <div id="quickfactimg" runat="server">
                  <%--<img id="quickfact_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <h2 class="big margin_0">QUICK FACTS</h2>
                  <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">Someting You Need to Know</h2>
                  </div>
                  <div class="intro-layer" data-animation="slideExpandUp">
                 <div id="quickfact_desc" runat="server">
                  <%--<div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Gender </a>
                  </h4>
                  <p class="bottommargin_0">Female</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Sexuality </a>
                  </h4>
                  <p class="bottommargin_0">5" / 165cm</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Hair </a>
                  </h4>
                  <p class="bottommargin_0"> Long Blonde</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Eyes </a>
                  </h4>
                  <p class="bottommargin_0">Green</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Body </a>
                  </h4>
                  <p class="bottommargin_0">Petite/Slim</p>
                  </div>
                  </div>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Bust</a>
                  </h4>
                  <p class="bottommargin_0">Dress Size 8</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Ethnicity</a>
                  </h4>
                  <p class="bottommargin_0">Caucasian</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Language</a>
                  </h4>
                  <p class="bottommargin_0">English</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-left">
                  <div class="service-media"></div>
                  </div>
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a>Category </a>
                  </h4>
                  <p class="bottommargin_0">Escort for Men, Ladies and Couples</p>
                  </div>
                  </div>
                  </div>
                  </div>--%>
                </div>
                  </div>
                  </div>
                  <!-- eof .slide_description -->
                  </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                  </div>
                  <!-- eof .container -->
                  </li>
                  <li>
                  <div id="tourimg" runat="server">
                  <%--<img id="tour_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <!-- <div class="intro-layer" data-animation="slideExpandUp">
                     <h2 class="big margin_0">About Agency</h2>
                     <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">Someting You Need to Know</h2>
                     </div> -->
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <div class="tour-box aos-init aos-animate" data-aos="fade-up" data-aos-delay="">
                  <!--    <div class="sec-title">
                     <h2 class="section-title">Tour</h2>
                     <p>Offering content producers the very best environment, showcasing world-class 
                     content. Powering your content with Artificial Intelligence and Machine Learning 
                     to our global audience.</p>
                     </div> -->
                  <div class="tourSubtitle">
                  <h3>Australian Tours</h3>
                  <p>I'm planning a potenical visit to Melb. Depending on amount of hours you'd 
                  desire to book me for</p>
                  </div>
                <div id="tour_desc" runat="server">
                  <%--<table class="table table-hover">
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
                  <%--<button type="button" class="theme_button color1 topmargin_20">Subscribe to my tours</button>--%>
                  <button type="button" class="theme_button color1 topmargin_20" data-toggle="modal" data-target="#myModal">Subscribe to my tours</button>
                  </div>
                  </div>
                  </div>
                  </div>
                  <!-- eof .slide_description -->
                     
                     <!--modal-->
   

       <%--<div id="modal_default" class="modal" tabindex="-1" style="display: none; max-height:50%; overflow:hidden;">
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
                           
                            <asp:TextBox ID="txt_EMAIL" runat="server" style="position:relative;top:-10px;" class="form-control" placeholder="Enter your Email-id"></asp:TextBox>
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


                      
 <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                      <div class="modal-dialog">
                      
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Enter Your Email and select the city</h4>
                          </div>
                          <div class="modal-body">
                          <%-- <form class="form-inline" action="">--%>
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
                            
                           
                           
                        <%--   </form>--%>
                          </div>
                          <div class="modal-footer">
                                        <button type="button" onclick="close_modal()" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <input type="button" id="btn_Save_Menu" runat="server" onserverclick="btn_Save_Menu_ServerClick" class="btn btn-default" value="Submit" />
                                    </div>
                        </div>
                        
                      </div>
                    </div>





                       </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                  </div>
                  <!-- eof .container -->
                  </li>
                  <li>
                  <div id="diaryimg" runat="server">
                  <%--<img id="diary_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <h2 class="big margin_0">Escort Diary</h2>
                  <br><br>
                  <!-- <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">You can have anything you want in life if you dress for it.</h2> -->
                  </div>
                 <div id="diary_desc" runat="server">
                  <%--<div class="intro-layer" data-animation="slideExpandUp">
                  <div class="media bottommargin_30">
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a href="#">WHAT IS INTIMACY COACHING?</a>
                  </h4>
                  <p class="bottommargin_0">What can an Intimacy coach help you with? An intimacy coach is someone who strives to help you feel safer and more comfortable being close to an intimate partner. Comfort with intimacy in a relationship is something most people learn as children. Unfortunately, many grow up without positive exper...</p>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a href="#">BORED AT HOME?</a>
                  </h4>
                  <p class="bottommargin_0">What can an Intimacy coach help you with? An intimacy coach is someone who strives to help you feel safer and more comfortable being close to an intimate partner. Comfort with intimacy in a relationship is something most people learn as children. Unfortunately, many grow up without positive exper...</p>
                  </div>
                  </div>
                  </div>--%>
                  </div>
                  </div>
                  <!-- eof .slide_description -->
                  </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                  </div>
                  <!-- eof .container -->
                  </li>
                  <li>
                  <div id="availablityimg" runat="server">
                 <%-- <img id="availablity_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <!-- <div class="intro-layer" data-animation="slideExpandUp">
                     <h2 class="big margin_0">About Agency</h2>
                     <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">Someting You Need to Know</h2>
                     </div> -->
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <div class="cnt-mt-box">
                  <div class="meet-title">
                  <h2>When can we meet?</h2>
                  <ul>
                  <li>Available by appointment</li>
                  <li>Please contact me for my availability</li>
                  <li>Available 7 days</li>
                  <li>Flexible hours by appointment</li>
                  </ul>
                  </div>
                <div id="availability_desc" runat="server">
                  <%--<table class="table table-hover">
                  <thead>
                  <tr>
                  <th scope="col">Weekday</th>
                  <th scope="col">From</th>
                  <th scope="col">Untill</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  <td>Monday</td>
                  <td>10:00 AM</td>
                  <td>till late</td>
                  </tr>
                  <tr>
                  <td>Tuesday</td>
                  <td>10:00 AM</td>
                  <td>till late</td>
                  </tr>
                  <tr>
                  <td>Wednesday</td>
                  <td>10:00 AM</td>
                  <td>till late</td>
                  </tr>
                  <tr>
                  <td>Thursday</td>
                  <td>10:00 AM</td>
                  <td>till late</td>
                  </tr>
                  <tr>
                  <td>Saturday</td>
                  <td colspan="2">By appointment</td>
                  </tr>
                  <tr>
                  <td>Sunday</td>
                  <td colspan="2">By appointment</td>
                  </tr>
                  </tbody>
                  </table>--%>
                </div>
                  </div>
                  </div>
                  </div>
                  <!-- eof .slide_description -->
                  </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                     
                  </div>
                  <!-- eof .container -->
                  </li>
                  <li>
                  <div id="forumimg" runat="server">
                  <%--<img id="forum_img" runat="server" alt="Allykat" title="Allykat">--%></div>
                  <div class="container">
                  <div class="row">
                  <div class="col-sm-12 text-center text-md-right">
                  <div class="slide_description_wrapper">
                  <div class="slide_description">
                  <div class="intro-layer" data-animation="slideExpandUp">
                  <h2 class="big margin_0">My Forum</h2>
                  <h2 class="muellerhoff topmargin_5 bottommargin_50 highlight">Someting You Need to Know</h2>
                  </div>
                <div id="forum_desc" runat="server">
                  <%--<div class="intro-layer" data-animation="slideExpandUp">
                  <div class="media bottommargin_30">
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a href="#">OVERNIGHT SPECIALS FOR ALL PRE-BOOKINGS BEFORE MAY</a>
                  </h4>
                  <p class="bottommargin_0">What can an Intimacy coach help you with? An intimacy coach is someone who strives to help you feel safer and more comfortable being close to an intimate partner. Comfort with intimacy in a relationship is something most people learn as children. Unfortunately, many grow up without positive exper...</p>
                  <a href="#" class="theme_button color1 topmargin_20">Read More</a>
                  </div>
                  </div>
                  <div class="media bottommargin_30">
                  <div class="media-body">
                  <h4 class="topmargin_0 bottommargin_5">
                  <a href="#">OVERNIGHT SPECIALS FOR ALL PRE-BOOKINGS BEFORE MAY</a>
                  </h4>
                  <p class="bottommargin_0">What can an Intimacy coach help you with? An intimacy coach is someone who strives to help you feel safer and more comfortable being close to an intimate partner. Comfort with intimacy in a relationship is something most people learn as children. Unfortunately, many grow up without positive exper...</p>
                  <a href="#" class="theme_button color1 topmargin_20">Read More</a>
                  </div>
                  </div>
                  </div>--%>
                </div>
                  </div>
                  <!-- eof .slide_description -->
                  </div>
                  <!-- eof .slide_description_wrapper -->
                  </div>
                  <!-- eof .col-* -->
                  </div>
                  <!-- eof .row -->
                  </div>
                  <!-- eof .container -->
                  </li>
                  </ul>
                  </div>
                  <!-- eof flexslider -->
                  </section>
    
      

         <asp:HiddenField ID="hf_date" runat="server" Value="" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
                </asp:ScriptManager>
    
                 <section class="ds ms page_testimonials section_padding_50">
                  <div class="container text-center">
                     <h2 style="text-align: center;">
                        <span class="big">Things I Prefer In Private</span>
                       
                        </h2>
                     <br><br>
                  <div class="row" id="prefer_desc" runat="server">
                          <%-- <navlist>
                             <ul>
                               <li>
                                Affectionate cuddling <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Affectionate kissing <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Bi twin (double) <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Couples<i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Dinner companion <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Kissing <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li> 
                                 PSE <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Sexy lingerie <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Dirty Talk <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Overnight <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Passionate Kissing <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Toys <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Escort <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li>
                                 Full Service <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                               <li> 
                                 FFM <i class="fa fa-paper-plane" aria-hidden="true"></i>
                                 <span></span><span></span><span></span><span></span></li>
                             </ul>
                           </navlist>--%>
                       </div>
                  </div>
                  </section>
                  <section class="ds parallax calltoaction section_padding_100" id="calender_img" runat="server">
                  <div class="container">
                  <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Book Your Appointment</span></h2>
                                </div>
                  <div class="col col-lg-8 col-md-12  offset-md-0  col-lg-offset-2 calenderwrapper_outer">
                        <div class="content-wrapper">
                            <div id='calendar'></div>  
                        </div>
                  </div>
                      </div>
                  </section>
                  <section class="ds section_padding_70 gorizontal_padding">
                  <div class="container-fluid">
                  <div class="row">
                  <div class="col-sm-12">
                  <h2 style="text-align: center;">
                  <span class="big">Image Voting</span>
                  <br>
                  </h2>
                  <br><br>
                  <div class="row" id="voting_desc" runat="server">
               <%--   <div class="col-md-3 col-sm-6 col-sm-6 col-xs-6">
                  <div class="product-grid2">
                  <div class="product-image2">
                  <a class="vote_icon" href="#" data-tip="Like"><i class="fa fa-thumbs-up" aria-hidden="true"></i><span>46</span></a>
                  <a href="#">
                  <img class="pic-1" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-2.jpg")%>" alt="Allykat" title="Allykat">
                  <img class="pic-2" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-22.jpg")%>" alt="Allykat" title="Allykat">
                  </a>
                  <a class="add-to-cart" href="">Vote Now</a>
                  </div>
                  <!-- <div class="product-content">
                     <h3 class="title"><a href="#">Maria Private Escort</a></h3>
                     
                     </div> -->
                  </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-sm-6 col-xs-6">
                  <div class="product-grid2">
                  <div class="product-image2">
                  <a class="vote_icon" href="#" data-tip="Like"><i class="fa fa-thumbs-up" aria-hidden="true"></i><span>74</span></a>
                  <a href="#">
                  <img class="pic-1" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-3.jpg")%>">
                  <img class="pic-2" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-33.jpg")%>">
                  </a>
                  <a class="add-to-cart" href="">Vote Now</a>
                  </div>
                  <!--  <div class="product-content">
                     <h3 class="title"><a href="#">Maria Private Escort</a></h3>
                     
                     </div> -->
                  </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-sm-6 col-xs-6">
                  <div class="product-grid2">
                  <div class="product-image2">
                  <a class="vote_icon" href="#" data-tip="Like"><i class="fa fa-thumbs-up" aria-hidden="true"></i><span>88</span></a>
                  <a href="#">
                  <img class="pic-1" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-4.jpg")%>">
                  <img class="pic-2" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-44.jpg")%>">
                  </a>
                  <a class="add-to-cart" href="">Vote Now</a>
                  </div>
                  <!-- <div class="product-content">
                     <h3 class="title"><a href="#">Maria Private Escort</a></h3>
                     
                     </div> -->
                  </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-sm-6 col-xs-6">
                  <div class="product-grid2">
                  <div class="product-image2">
                  <a class="vote_icon" href="#" data-tip="Like"><i class="fa fa-thumbs-up" aria-hidden="true"></i><span>90</span></a>
                  <a href="#">
                  <img class="pic-1" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-5.jpg")%>">
                  <img class="pic-2" src="<%=Page.ResolveClientUrl("~/main-assets/img/img-55.jpg")%>">
                  </a>
                  <a class="add-to-cart" href="">Vote Now</a>
                  </div>
                  <!-- <div class="product-content">
                     <h3 class="title"><a href="#">Maria Private Escort</a></h3>
                     
                     </div> -->
                  </div>
                  </div>--%>
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
                  <br><br>
                  <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="rateInner">
                  <div class="ratesSubtitle">
                  <h3>Incall</h3>
                  </div>
                <div id="incallrate_desc" runat="server">
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
                  <td>$650</td>
                  <td>Extra</td>
                  </tr>
                  <tr>
                  </tr><tr>
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


                  <section class="ds page_portfolio section_padding_70 columns_padding_0">
                  <div class="container-fluid">
                  <div class="row">
                  <div class="col-sm-12">
                  <h2 style="text-align: center;">
                  <span class="big">Awesome Selfie's</span>
                  </h2>
                  <br><br>
                <div id="selfie_desc" runat="server">
                  <%--<div class="isotope_container isotope row masonry-layout" data-filters=".isotope_filters">
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
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
                  <div class="isotope-item col-lg-4 col-md-4 col-sm-6 col-xs-6 ">
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
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/03.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/03.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/04.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/04.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/05.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/05.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/06.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/06.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/22.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/22.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/08.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/08.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/09.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/09.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-4 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/21.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/21.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6  ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/11.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/11.jpg"></a>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  <div class="isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6 ">
                  <div class="vertical-item gallery-item content-absolute text-center cs">
                  <div class="item-media">
                  <img src="images/gallery/12.jpg" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <div class="links-wrap">
                  <a class="p-view prettyPhoto " title="" data-gal="prettyPhoto[gal]" href="images/gallery/12.jpg"></a>
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
                  <a class="abs-link" title="" href="blog-single-right.html"></a>
                  </div>
                  </div>
                  <div class="item-content entry-content">
                  <h4 class="topmargin_0 bottommargin_20">
                  <a href="blog-single-right.html">Aliquyam erat, sed diam voluptua vero eoset</a>
                  </h4>
                  <span class="entry-meta text-uppercase fontsize_12">
                  <span class="author">Admin</span> |
                  <time datetime="2016-09-03T15:05:23+00:00">24 December 2015</time>
                  </span>
                  <!-- 	<div class="page_social_icons topmargin_25">
                     <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                     <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                     <a class="social-icon color-bg-icon soc-instagram" href="#" title="instagram"></a>
                     </div> -->
                  </div>
                  <!-- .item-content.entry-content -->
                  </article>
                  <article class="vertical-item post format-standard text-center">
                  <div class="item-media entry-thumbnail">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/04.jpg")%>" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <a class="abs-link" title="" href="blog-single-right.html"></a>
                  </div>
                  </div>
                  <div class="item-content entry-content">
                  <h4 class="topmargin_0 bottommargin_20">
                  <a href="blog-single-right.html">Lorem ipsum dolor sitamet lorem ipsum dolor sit amet</a>
                  </h4>
                  <span class="entry-meta text-uppercase fontsize_12">
                  <span class="author">Admin</span> |
                  <time datetime="2016-09-03T15:05:23+00:00">11 December 2015</time>
                  </span>
                  <!-- 	<div class="page_social_icons topmargin_25">
                     <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                     <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                     <a class="social-icon color-bg-icon soc-instagram" href="#" title="instagram"></a>
                     </div> -->
                  </div>
                  <!-- .item-content.entry-content -->
                  </article>
                  <article class="vertical-item post format-standard text-center">
                  <div class="item-media entry-thumbnail">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <a class="abs-link" title="" href="blog-single-right.html"></a>
                  </div>
                  </div>
                  <div class="item-content entry-content">
                  <h4 class="topmargin_0 bottommargin_20">
                  <a href="blog-single-right.html">Et justo duo dolores et ea rebum clita kasd gubergren</a>
                  </h4>
                  <span class="entry-meta text-uppercase fontsize_12">
                  <span class="author">Admin</span> |
                  <time datetime="2016-09-03T15:05:23+00:00">17 December 2015</time>
                  </span>
                  <!-- 	<div class="page_social_icons topmargin_25">
                     <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                     <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                     <a class="social-icon color-bg-icon soc-instagram" href="#" title="instagram"></a>
                     </div> -->
                  </div>
                  <!-- .item-content.entry-content -->
                  </article>
                  <article class="vertical-item post format-standard text-center">
                  <div class="item-media entry-thumbnail">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/05.jpg")%>" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <a class="abs-link" title="" href="blog-single-right.html"></a>
                  </div>
                  </div>
                  <div class="item-content entry-content">
                  <h4 class="topmargin_0 bottommargin_20">
                  <a href="blog-single-right.html">Aliquyam erat, sed diam voluptua vero eoset</a>
                  </h4>
                  <span class="entry-meta text-uppercase fontsize_12">
                  <span class="author">Admin</span> |
                  <time datetime="2016-09-03T15:05:23+00:00">24 December 2015</time>
                  </span>
                  <!-- <div class="page_social_icons topmargin_25">
                     <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                     <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                     <a class="social-icon color-bg-icon soc-instagram" href="#" title="instagram"></a>
                     </div> -->
                  </div>
                  <!-- .item-content.entry-content -->
                  </article>
                  <article class="vertical-item post format-standard text-center">
                  <div class="item-media entry-thumbnail">
                  <img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/06.jpg")%>" alt="Allykat" title="Allykat">
                  <div class="media-links">
                  <a class="abs-link" title="" href="blog-single-right.html"></a>
                  </div>
                  </div>
                  <div class="item-content entry-content">
                  <h4 class="topmargin_0 bottommargin_20">
                  <a href="blog-single-right.html">Lorem ipsum dolor sitamet lorem ipsum dolor sit amet</a>
                  </h4>
                  <span class="entry-meta text-uppercase fontsize_12">
                  <span class="author">Admin</span> |
                  <time datetime="2016-09-03T15:05:23+00:00">11 December 2015</time>
                  </span>
                  <!-- <div class="page_social_icons topmargin_25">
                     <a class="social-icon color-icon soc-facebook" href="#" title="Facebook"></a>
                     <a class="social-icon color-icon soc-twitter" href="#" title="Twitter"></a>
                     <a class="social-icon color-bg-icon soc-instagram" href="#" title="instagram"></a>
                     </div> -->
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
    <script src="/main-assets/js/main.js"></script>
    <script>
    var testimCarousel = jQuery(".testimonials-carousel");

	testimCarousel.on('initialized.owl.carousel', function(e){
		var currentItem = e.item.index - 2;
		jQuery(".testimonials-body").find("[data-slide='"+ currentItem +"']").fadeIn();
	});

	testimCarousel.on('translate.owl.carousel', function(e){
		var currentItem = e.item.index - 2;
		jQuery(".testimonials-body .blockquote-big").fadeOut();
		jQuery(".testimonials-body").find("[data-slide='"+ currentItem +"']").delay(400).fadeIn();
    });
    </script>
    <script>
        function get() {
            var dt = document.getElementById("eventDayName").innerHTML;
            document.getElementById('<%=hf_date.ClientID %>').value = dt;

        }

        function useranswer(clicked_id) {




            var checking = document.getElementById(clicked_id).getAttribute('data-');
            // alert(checking);


            saveheadmenu(checking);

        }



        function saveheadmenu(values) {
            //$("#inputMenuName").val("");
            $.ajax({
                url: '<%=ResolveUrl("~/voting/index.aspx/GetEvent") %>',
                  data: "{date1: '" + values + "'}",
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (data) {
                      if (data.d != 0) {

                          alert("Thank you for your feedback");
                          location.reload();
                      }
                      else {
                          alert("Please login");
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
    </script>
     <script>

         function show_modal() {
             $("#modal_default").css('display', 'block');
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
     </script>
    <script src="<%=Page.ResolveClientUrl("~/main-assets/fullcalendar/lib/main.js")%>"></script>
    
     <script>
         $(document).ready(function () {
             $(".fc-scroller-liquid-absolute").niceScroll({
                 cursorcolor: "#cccccc",
                 cursorwidth: "3px",
                 background: "#3a3843",
                 cursorborder: "0px solid #eee",
                 cursorborderradius: 2
             });
         })
     </script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
            });
            calendar.render();
        });

    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                selectable: true,
                initialView: 'dayGridMonth',
                //initialDate: '2021-03-07',
                defaultDate: new Date(),
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                dateClick: function (info) {

                    //alert('Date: ' + info.dateStr);
                    location.href = "/calender?date=" + info.dateStr + "";
                },

                events: [

                ]
            });
            var cdate = calendar.getDate();
            var month_int = cdate.getMonth();
            calendar.render();
        });


    </script>
</asp:Content>
