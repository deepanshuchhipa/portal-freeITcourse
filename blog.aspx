<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="_blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <!-- breadcrumb -->
                <section class="ixl-breadcrumb" style="background: url(assets/images/breadcrumb.png);">
                    <div class="container">
                        <div class="ixl-breadcrumb-wrapper">
                            <div class="row">
                                <div class="col-12">
                                    <div class="ixl-breadcrumb">
                                        <h1 class="ixl-heading-xl text-anime-style-2" data-aos="fade-up"
                                            data-aos-delay="400" data-aos-duration="1500">Blog</h1>
                                        <ul data-aos="fade-up" data-aos-delay="600" data-aos-duration="1500">
                                            <li class="ixl-heading-sm"><a href="index.aspx">Home</a> <i
                                                    class="fa-solid fa-angle-right"></i> </li>
                                            <li class="ixl-heading-sm">Blog</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- blog posts -->
                <section class="ixl-blog-post pt-120">
                    <div class="container">
                        <div class="ixl-blog-posts-wrapper">
                            <div class="row">
                                <section class="ixl-blog-post pt-120">
    <div class="container">
        <div class="ixl-blog-posts-wrapper">

            <div class="row gy-4">

                <asp:Repeater ID="rptBlog" runat="server">
                    <ItemTemplate>

                        <div class="col-md-6 col-xl-4">

                            <article class="ixl-blog-item"
                                data-aos="fade-up"
                                data-aos-delay="400"
                                data-aos-duration="1000">

                                <!-- IMAGE -->
                                <div class="img image-hover-effect">

                                   <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>'
     alt="blog-image"
     class="img-fluid" />

                                    <span>
                                        <%# Convert.ToDateTime(Eval("CreatedDate")).ToString("MMMM dd, yyyy") %>
                                    </span>

                                </div>

                                <!-- CONTENT -->
                                <div class="content">

                                    <!-- STATIC -->
                                    <div class="meta">
                                        <span>
                                            <i class="fa-regular fa-user"></i>
                                            (BL Soni)
                                        </span>

                                       
                                    </div>

                                    <!-- TITLE -->
                                    <a class="link-title"
                                        href='blogdetail.aspx?id=<%# Eval("BlogID") %>'>

                                        <h2 class="ixl-heading-md bg-line-underline">
                                            <%# Eval("Title") %>
                                        </h2>

                                    </a>

                                    <!-- BUTTON -->
                                    <a href='blog-single.aspx?id=<%# Eval("BlogID") %>'
                                        class="read-more">

                                        Read More
                                        <i class="fa-regular fa-arrow-right-long"></i>

                                    </a>

                                </div>

                            </article>

                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>

        </div>
    </div>
</section>
                                <div class="col-12">
                                    <div class="pagination-wrapper pagination-wrapper-center mt-0" data-aos="fade-up"
                                        data-aos-delay="600" data-aos-duration="1200">
                                        <ul class="pg-pagination">
                                            <li>
                                                <a href="#" aria-label="Previous">
                                                    <i class="fa-solid fa-angle-left"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">1</a></li>
                                            <li class="active"><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li>
                                                <a href="#" aria-label="Next">
                                                    <i class="fa-solid fa-angle-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
</asp:Content>

