<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.voting.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds section_padding_70 gorizontal_padding">
                        <div class="container-fluid">
                           <div class="row">
                                <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Image Voting</span></h2>
                                </div>
                              <div class="col-sm-12">
                                 <div class="row" id="voting_list" runat="server">
                                   <%-- <div class="col-md-3 col-sm-6 col-sm-6 col-xs-6">
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
                                    <div class="rateInner" id="incallrate_list" runat="server">
                                  <%--     <div class="ratesSubtitle">
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
                               <%--        <div class="ratesSubtitle">
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
                                 <br><br>
                                 <div class="owl-carousel blog-carousel theme-owl-carousel" data-margin="30" data-nav="false" data-dots="true" data-center="true" data-loop="true" data-items="5" data-autoplay="false" data-responsive-xs="1" data-responsive-sm="2" data-responsive-md="2"
                                    data-responsive-lg="3" data-responsive-xlg="5" id="news_list" runat="server">
                                    <%--<article class="vertical-item post format-standard text-center">
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
    <script>
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
</asp:Content>
