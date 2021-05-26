<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="index.aspx.cs" Inherits="ProjectOne.forum.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!--02 Nov 2020 Edited By Samrat/Amitava-->
	<style>
	 .row{
		 margin-right:-15px !important;
	 }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section class="ds section_padding_70 columns_padding_25">
				<div class="container" id="forum_desc" runat="server">
					<%--<div class="row">

						<div class="col-sm-12 col-md-6 col-lg-6 ">
							<article>
								<div class="entry-thumbnail bottommargin_40">
									<img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
								</div>

								<header class="entry-header">
									<div class="entry-meta item-meta">
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
									</h1>

								</header>
								<!-- .entry-header -->
								<div class="entry-content">
									<p class="big-first-letter">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
									</p>
									
								</div>
							</article>
						</div>
						<!--eof .col-sm-8 (main content)-->

						<div class="col-sm-12 col-md-6 col-lg-6 ">
							<article>
								<div class="entry-thumbnail bottommargin_40">
									<img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
								</div>

								<header class="entry-header">
									<div class="entry-meta item-meta">
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
									</h1>

								</header>
								<!-- .entry-header -->
								<div class="entry-content">
									<p class="big-first-letter">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
									</p>
									
								</div>
							</article>
						</div>
						<!--eof .col-sm-8 (main content)-->

						<div class="col-sm-12 col-md-6 col-lg-6 ">
							<article>
								<div class="entry-thumbnail bottommargin_40">
									<img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
								</div>

								<header class="entry-header">
									<div class="entry-meta item-meta">
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
									</h1>

								</header>
								<!-- .entry-header -->
								<div class="entry-content">
									<p class="big-first-letter">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
									</p>
									
								</div>
							</article>
						</div>
						<!--eof .col-sm-8 (main content)-->

						<div class="col-sm-12 col-md-6 col-lg-6 ">
							<article>
								<div class="entry-thumbnail bottommargin_40">
									<img src="<%=Page.ResolveClientUrl("~/main-assets/images/gallery/01.jpg")%>" alt="Allykat" title="Allykat">
								</div>

								<header class="entry-header">
									<div class="entry-meta item-meta">
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
									</h1>

								</header>
								<!-- .entry-header -->
								<div class="entry-content">
									<p class="big-first-letter">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
									</p>
									
								</div>
							</article>
						</div>
						<!--eof .col-sm-8 (main content)-->

			

					</div>--%>
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
        document.getElementById('escort_for_menu').classList.add('active');
    </script>
</asp:Content>
