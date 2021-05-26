<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectOne.testimonials.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    
<section class="pt-5 circle-1" id="clients">


      <div class="container pb-5 position-relative">
                  <div id="demo" class="carousel slide position-relative" data-ride="carousel">
                       <div class="col-lg-12 text-center">                              
                                <h2><span class="big">Testimonials</span></h2>
                                </div>
                     
                       
                        <!-- The slideshow -->
                        <div class="carousel-inner" id="testi_list" runat="server">
                        <%--  <div class="carousel-item active carousel-item-left">
                              <div class="d-flex">
                                    <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column ">
                                          <a href="#" class="introduce pb-3">
                                          <div class="flex-column-1 ">
                                             <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                          </div>
                                          <div class="flex-column-2 d-flex">
                                             <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/01.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                             <div class="information  flex-column pl-3 pt-2">
                                                <p>David Beckham</p>
                                                <p class="text-gray">Managing Director</p>
                                             </div>
                                          </div>
                                          <span></span>
                                       </a>
                                    </div>
                                    <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column ">
                                          <a href="#" class="introduce pb-3">
                                             <div class="flex-column-1 ">
                                                <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                             </div>
                                             <div class="flex-column-2 d-flex">
                                             <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/02.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                                <div class="information  flex-column pl-3 pt-2">
                                                   <p>David Luiz</p>
                                                   <p class="text-gray">Ceo & Founder</p>
                                                </div>
                                             </div>
                                          </a>
                                       </div>
                                    <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column">
                                          <a href="#" class="introduce pb-3">
                                             <div class="flex-column-1 ">
                                                <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                             </div>
                                             <div class="flex-column-2 d-flex">
                                               <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/03.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                                <div class="information  flex-column pl-3 pt-2">
                                                   <p>Donna Karan</p>
                                                   <p class="text-gray">Fashion Designer</p>
                                                </div>
                                             </div>
                                          </a>
                                       </div>
                              </div>

                           </div>   
                           <div class="carousel-item carousel-item-next carousel-item-left">
                                 <div class="d-flex">
                                       <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column ">
                                             <a href="#" class="introduce pb-3">
                                             <div class="flex-column-1 ">
                                                <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                             </div>
                                             <div class="flex-column-2 d-flex">
                                             <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/04.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                                <div class="information  flex-column pl-3 pt-2">
                                                   <p>David Luiz</p>
                                                   <p class="text-gray">Ceo & Founder</p>
                                                </div>
                                             </div>
                                             <span></span>
                                          </a>
                                       </div>
                                       <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column ">
                                             <a href="#" class="introduce pb-3">
                                                <div class="flex-column-1 ">
                                                   <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                                </div>
                                                <div class="flex-column-2 d-flex">
                                               <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/05.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                                   <div class="information  flex-column pl-3 pt-2">
                                                      <p>David Luiz</p>
                                                      <p class="text-gray">Ceo & Founder</p>
                                                   </div>
                                                </div>
                                             </a>
                                          </div>
                                       <div class="col-lg-4 col-sm-12 col-12 d-flex flex-column">
                                             <a href="#" class="introduce pb-3">
                                                <div class="flex-column-1 ">
                                                   <p class="pr-2 pl-3 pt-4">What a Service!!!!!Antony is one of the top Classy designer in the world.Exceeded expectation and designed my website to my requirments.Will be usingfor ongoing work.</p>
                                                </div>
                                                <div class="flex-column-2 d-flex">
                                                  <div class="pic p1">
                                                <img src="<%=Page.ResolveClientUrl("~/main-assets/images/team/06.jpg")%>" alt="Allykat" title="Allykat">
                                             </div>
                                                   <div class="information  flex-column pl-3 pt-2">
                                                      <p>Donna Karan</p>
                                                      <p class="text-gray">Fashion Designer</p>
                                                   </div>
                                                </div>
                                             </a>
                                          </div>
                                 </div>
   
                              </div>--%>
                              
                        </div>
                       
                
            
                       
                       </div>



            </div>
         

   </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
