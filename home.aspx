<%@ Page
    Title="IT Courses, Coding Classes  | FreeITLearning.com"
    Language="C#"
    MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true"
    CodeFile="home.aspx.cs"
    Inherits="_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* --- Root & Reset --- */
        :root {
            --bg-body: #f8fbff;
            --primary-blue: #0070f3;
            --primary-hover: #0056b3;
            --text-main: #0f172a;
            --text-sub: #4b5563;
            --border-color: #e5e7eb;
            --card-bg: #ffffff;
            --white: #ffffff;
        }

        /* SEARCH BOX */
        .hero-search-box {
            position: relative;
            z-index: 9999;
        }

        .suggestion-box {
            position: absolute;
            top: 72px;
            left: 0;
            width: 100%;
            background: #fff;
            border-radius: 20px;
            padding: 8px 0;
            display: none;
            z-index: 99999;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            border: 1px solid #eee;
            max-height: 300px;
            overflow-y: auto;
        }

            .suggestion-box li {
                padding: 14px 22px;
                cursor: pointer;
                font-size: 15px;
                transition: 0.3s;
            }

                .suggestion-box li:hover {
                    background: #f3f7ff;
                    color: #0070f3;
                }

        #searchInput {
            border-radius: 60px !important;
        }


        /* --- Header Section --- */
        .header {
            margin-top: 5%;
            text-align: center;
            padding: 0 20px;
            margin-bottom: 40px;
        }

            .header h2 {
                font-size: clamp(28px, 5vw, 42px); /* Responsive font size */
                color: var(--text-main);
                letter-spacing: -1px;
                font-weight: 800;
            }

        /* --- Testimonial Slider (Marquee) --- */
        .slider-wrapper {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 40px 0;
            position: relative;
            overflow: hidden; /* Prevent horizontal scroll on body */
        }

            .slider-wrapper::before,
            .slider-wrapper::after {
                content: "";
                position: absolute;
                top: 0;
                width: 10%; /* Percentage based for responsiveness */
                min-width: 50px;
                height: 100%;
                z-index: 10;
                pointer-events: none;
            }

            .slider-wrapper::before {
                left: 0;
                background: linear-gradient(to right, var(--bg-body), transparent);
            }

            .slider-wrapper::after {
                right: 0;
                background: linear-gradient(to left, var(--bg-body), transparent);
            }

        .slider-container {
            display: flex;
            width: 100%;
            overflow: hidden;
        }

        .marquee-content {
            display: flex;
            gap: 20px;
            animation: scroll-left 40s linear infinite;
            padding: 10px 0;
        }

        .reverse .marquee-content {
            animation-direction: reverse;
        }

        .marquee-content:hover {
            animation-play-state: paused;
        }

        @keyframes scroll-left {
            0% {
                transform: translateX(0);
            }

            100% {
                transform: translateX(-50%);
            }
        }

        /* Card Design */
        .card {
            flex-shrink: 0;
            width: clamp(300px, 80vw, 430px); /* Responsive width */
            background: var(--card-bg);
            border: 1px solid #f1f5f9;
            border-radius: 24px;
            padding: 60px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            transition: all 0.3s ease;
        }

            .card:hover {
                transform: translateY(-5px);
                border-color: var(--primary-blue);
                box-shadow: 0 10px 30px rgba(59, 130, 246, 0.08);
            }

        .feedback {
            color: var(--text-sub);
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
            border-top: 1px solid #f8fafc;
            padding-top: 15px;
        }

            .user-info img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                object-fit: cover;
            }

            .user-info h4 {
                font-size: 14px;
                color: var(--text-main);
                margin: 0;
            }

            .user-info p {
                font-size: 12px;
                color: #94a3b8;
                margin: 2px 0 0 0;
            }

        /* --- FAQ & Info Section Layout --- */
        .main-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            width: 95%;
            gap: 50px;
            align-items: flex-start;
            padding: 60px 20px;
        }

        .faq-section {
            flex: 1.2;
            width: 100%;
        }

        .info-section {
            flex: 1;
            width: 100%;
        }

        .badge {
            display: inline-block;
            background: var(--white);
            border: 1px solid var(--border-color);
            padding: 6px 14px;
            border-radius: 100px;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 20px;
            color: var(--primary-blue);
        }

        .faq-card {
            background: var(--white);
            border: 1px solid var(--border-color);
            border-radius: 14px;
            margin-bottom: 12px;
            transition: 0.3s;
        }

            .faq-card:hover {
                border-color: var(--primary-blue);
            }

        summary {
            padding: 20px;
            list-style: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            color: var(--text-main);
        }

            summary::-webkit-details-marker {
                display: none;
            }

        .chevron {
            width: 10px;
            height: 10px;
            border-right: 2px solid #9ca3af;
            border-bottom: 2px solid #9ca3af;
            transform: rotate(45deg);
            transition: 0.3s;
        }

        details[open] .chevron {
            transform: rotate(-135deg);
            border-color: var(--primary-blue);
        }

        .content {
            padding: 0 20px 20px 20px;
            color: var(--text-sub);
            font-size: 14px;
            line-height: 1.6;
        }

        /* Info Content */
        .info-section h1 {
            font-size: clamp(32px, 4vw, 48px);
            font-weight: 800;
            color: var(--text-main);
            line-height: 1.1;
            margin-bottom: 20px;
        }

        .info-section p {
            font-size: 17px;
            line-height: 1.7;
            color: var(--text-sub);
            margin-bottom: 25px;
        }

        .feature-list {
            list-style: none;
            padding: 0;
            margin-bottom: 30px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
            font-weight: 500;
            color: var(--text-main);
        }

        .check-icon {
            width: 22px;
            height: 22px;
            background: var(--primary-blue);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            flex-shrink: 0;
        }

        .cta-button {
            display: inline-block;
            background: var(--primary-blue);
            color: white;
            padding: 16px 32px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 10px 20px rgba(0, 112, 243, 0.2);
            transition: 0.3s;
        }

            .cta-button:hover {
                background: var(--primary-hover);
                transform: translateY(-3px);
                box-shadow: 0 15px 30px rgba(0, 112, 243, 0.3);
            }

        /* --- Responsive Queries --- */

        /* Tablets */
        @media (max-width: 1024px) {
            .main-container {
                gap: 30px;
                padding: 40px 20px;
            }
        }

        /* Mobile Phones */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column-reverse; /* Info comes first on mobile */
                text-align: left;
            }

            .header h2 {
                font-size: 30px;
            }

            .info-section h1 {
                font-size: 34px;
            }

            .slider-wrapper::before, .slider-wrapper::after {
                width: 50px;
            }

            .card {
                width: 280px; /* Smaller cards for mobile */
                padding: 20px;
            }

            .cta-button {
                width: 100%;
                text-align: center;
                box-sizing: border-box;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- hero section start -->
    <section class="ixl-hero-one bg-cover"
        style="background: url('assets/images/home-v1/hero/hero-bg.png');">
        <div class="container">
            <div class="ixl-hero-one">
                <div class="row gy-4 align-items-center justify-content-center justify-content-xl-between">

                    <!-- LEFT CONTENT -->
                    <div class="col-12 col-lg-12 col-xl-5">

                        <div class="ixl-hero-one-wrapper">

                            <h1 class="text-anime-style-2">Learn IT Skills & Build Your Career
                            </h1>

                            <p data-aos="fade-up">
                                Search and explore the best IT courses like Web Development,
                AI, Data Science and more.
                            </p>

                            <!-- SEARCH BOX -->
                            <div class="hero-search-box mt-4 position-relative"
                                data-aos="fade-up">

                                <div class="input-group shadow-lg rounded-pill position-relative">
                                    <!-- SEARCH INPUT -->
                                    <input type="text"
                                        id="searchInput"
                                        name="course"
                                        class="form-control border-0 px-4 py-3"
                                        placeholder="Search courses..."
                                        onkeyup="showSuggestions(this.value)" />



                                    <!-- SUGGESTION BOX -->
                                    <ul id="suggestionBox"
                                        class="suggestion-box list-unstyled">
                                    </ul>

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- RIGHT IMAGES -->
                    <div class="col-12 col-lg-10 col-xl-6">

                        <div class="ixl-hero-one-images">

                            <img src="assets/images/home-v1/hero/hero-main.png"
                                class="main-img"
                                data-aos="zoom-in-up"
                                alt="hero image">

                            <img src="assets/images/home-v1/hero/hero-one.png"
                                class="img-1"
                                data-aos="zoom-in-left"
                                data-aos-delay="400"
                                data-aos-duration="1200">

                            <img src="assets/images/home-v1/hero/hero-two.png"
                                class="img-2"
                                data-aos="zoom-in-left"
                                data-aos-delay="600"
                                data-aos-duration="1400">

                            <img src="assets/images/home-v1/hero/hero-04.png"
                                class="img-3"
                                data-aos="zoom-in-right"
                                data-aos-delay="800"
                                data-aos-duration="1600">

                            <img src="assets/images/home-v1/hero/hero-03.png"
                                class="img-4"
                                data-aos="zoom-in-right"
                                data-aos-delay="1000"
                                data-aos-duration="1800">

                            <img src="assets/images/home-v1/hero/hero-shape.svg"
                                class="img-5"
                                data-aos="zoom-in-up"
                                data-aos-delay="1200"
                                data-aos-duration="2000">
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- feature section start -->
    <section class="ixl-feaure-wrap pt-120">
        <div class="container">
            <div class="ixl-featue-one position-relative">
                <div class="row align-items-center justify-content-center">

                    <!-- Heading -->
                    <div class="col-lg-7 col-xl-5 d-flex align-items-center justify-content-center">
                        <h2 class="ixl-heading-xl ixl-feature-heading-one text-anime-style-2">Learn In-Demand IT Skills for Free
                        </h2>
                    </div>

                    <div class="col-12">
                        <div class="row align-items-center justify-content-center">

                            <!-- Feature 1 -->
                            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="300">
                                <div class="ixl-feature-item-one">
                                    <div class="icon">
                                        <img src="assets/images/home-v1/feature/feature-01.svg"
                                            alt="Web Development" class="img-fluid">
                                    </div>

                                    <div class="content">
                                        <a href="#">
                                            <h3 class="ixl-heading-md bg-line-underline">Web Development
                                            </h3>
                                        </a>

                                        <p>
                                            Learn HTML, CSS, JavaScript, ASP.NET, and modern web technologies
                                        with practical projects and real-world examples.
                                        </p>

                                        <a href="course.aspx">Explore Courses
                                        <i class="fa-regular fa-arrow-right-long"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Feature 2 -->
                            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="600">
                                <div class="ixl-feature-item-one">
                                    <div class="icon">
                                        <img src="assets/images/home-v1/feature/feature-02.svg"
                                            alt="Programming" class="img-fluid">
                                    </div>

                                    <div class="content">
                                        <a href="#">
                                            <h3 class="ixl-heading-md bg-line-underline">Programming Skills
                                            </h3>
                                        </a>

                                        <p>
                                            Master C++, C#, SQL Server, and coding fundamentals through
                                        beginner-friendly tutorials and hands-on practice.
                                        </p>

                                        <a href="course.aspx">Start Learning
                                        <i class="fa-regular fa-arrow-right-long"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Feature 3 -->
                            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="900">
                                <div class="ixl-feature-item-one">
                                    <div class="icon">
                                        <img src="assets/images/home-v1/feature/feature-03.svg"
                                            alt="Career Growth" class="img-fluid">
                                    </div>

                                    <div class="content">
                                        <a href="#">
                                            <h3 class="ixl-heading-md bg-line-underline">Career Growth
                                            </h3>
                                        </a>

                                        <p>
                                            Build industry-ready skills, create portfolio projects, and prepare
                                        yourself for internships and IT job opportunities.
                                        </p>

                                        <a href="course.aspx">Read More
                                        <i class="fa-regular fa-arrow-right-long"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Shape -->
                <img src="assets/images/home-v1/feature/shape.svg"
                    class="fature-one-shape img-fluid parallax-move-left"
                    alt="feature-shape">
            </div>
        </div>
    </section>


    <!--about section start-->
    <section class="ixl-about-one pt-120">
        <div class="container">
            <div class="ixl-about-one-wrapper">
                <div class="row justify-content-between">

                    <!-- Left Images -->
                    <div class="col-lg-6">
                        <div class="ixl-about-one-images">

                            <img src="assets/images/home-v1/about/about-line.png"
                                class="image-01"
                                alt="about-line">

                            <img src="assets/images/home-v1/about/about-01.png"
                                class="image-02 parallax-img-down"
                                alt="IT Course">

                            <img src="assets/images/home-v1/about/about-02.png"
                                class="image-03"
                                alt="Learning">

                            <!-- Small Box -->
                            <div class="img-box parallax-move-left">
                                <div class="icon">
                                    <img src="assets/images/home-v1/about/about-icon-03.svg"
                                        alt="Students">
                                </div>

                                <div class="img-box-content">
                                    <p class="ixl-heading-sm mb-2">10K+ Students</p>
                                    <span>Learning Daily Online</span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Right Content -->
                    <div class="col-lg-5">
                        <div class="ixl-about-one-right">

                            <h1 class="ixl-heading-xl text-anime-style-2">Start Your IT Journey with Free Online Courses
                            </h1>

                            <p>
                                Learn modern technology skills from beginner to advanced level with
                            free online IT courses. Explore web development, programming,
                            databases, software development, and real-world projects designed
                            to help students build strong technical careers.
                            </p>

                            <!-- Info Box -->
                            <div class="ixl-about-info-wrapper">

                                <div class="ixl-about-info"
                                    data-aos="fade-up"
                                    data-aos-duration="1200">

                                    <img src="assets/images/home-v1/about/about-icon-01.svg"
                                        alt="Practical Learning">

                                    <h2 class="ixl-heading-sm">Practical Learning with Real Projects
                                    </h2>
                                </div>

                                <div class="ixl-about-info"
                                    data-aos="fade-up"
                                    data-aos-duration="1500">

                                    <img src="assets/images/home-v1/about/about-icon-02.svg"
                                        alt="Career Support">

                                    <h2 class="ixl-heading-sm">Build Skills for IT Career Growth
                                    </h2>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section>

        <div class="header">
            <h2>What Our Students Are Saying</h2>
        </div>

        <div class="slider-wrapper">

            <!-- FIRST SLIDER -->
            <div class="slider-container">
                <div class="marquee-content">

                    <asp:Repeater ID="rptTestimonials1" runat="server">
                        <ItemTemplate>

                            <div class="card">

                                <p class="feedback">
                                    "<%# Eval("feedback") %>"
                                </p>

                                <div class="user-info">

                                    <!-- STATIC IMAGE -->
                                    <img src='https://ui-avatars.com/api/?name=<%# Eval("student_name") %>&background=random&color=fff'
                                        alt="student">

                                    <div>
                                        <h4><%# Eval("student_name") %></h4>
                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

            <!-- SECOND SLIDER -->
            <%--            <div class="slider-container reverse">
                <div class="marquee-content">

                    <asp:Repeater ID="rptTestimonials2" runat="server">
                        <ItemTemplate>

                            <div class="card">

                                <p class="feedback">
                                    "<%# Eval("feedback") %>"
                                </p>

                                <div class="user-info">

                                    <!-- STATIC IMAGE -->
                                    <img src='https://ui-avatars.com/api/?name=<%# Eval("student_name") %>&background=random&color=fff'
                                        alt="student">

                                    <div>
                                        <h4><%# Eval("student_name") %></h4>
                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>--%>
        </div>

    </section>

    <!-- contact form-->
    <section class="ixl-contact-one mt-120">
        <div class="container">

            <div class="ixl-contact-wrapper ptb-120">

                <div class="row">

                    <!-- LEFT CONTENT -->
                    <div class="col-lg-4">

                        <h2 class="ixl-heading-xl text-anime-style-2 mb-2 mb-lg-4">Contact For Urgent Service
                        </h2>

                        <p class="mb-3 mb-lg-0">
                            It is a long established fact that a reader
                        will be distracted by the readable content
                        </p>

                    </div>

                    <!-- FORM SECTION -->
                    <div class="col-lg-8"
                        data-aos="fade-up"
                        data-aos-delay="400">

                        <div class="form-style-two">

                            <div class="row">

                                <!-- NAME -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtName"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Name"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- EMAIL -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtEmail"
                                            runat="server"
                                            TextMode="Email"
                                            CssClass="form-control"
                                            placeholder="Email"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- DATE -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtDate"
                                            runat="server"
                                            TextMode="Date"
                                            CssClass="form-control"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- ADDRESS -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtAddress"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Your Address"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- PHONE -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtPhone"
                                            runat="server"
                                            CssClass="form-control"
                                            MaxLength="10"
                                            placeholder="Phone Number"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- COURSE DROPDOWN -->
                                <div class="col-6 col-md-6 col-lg-4 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:DropDownList ID="ddlCourse"
                                            runat="server"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                    </div>

                                </div>

                                <!-- MESSAGE -->
                                <div class="col-12 mb-4">

                                    <div class="ixl-contact-form-group">

                                        <asp:TextBox ID="txtMessage"
                                            runat="server"
                                            TextMode="MultiLine"
                                            Rows="5"
                                            CssClass="form-control"
                                            placeholder="Your Message"></asp:TextBox>

                                    </div>

                                </div>

                                <!-- BUTTON -->
                                <div class="col-12">

                                    <asp:Button ID="btnSubmit"
                                        runat="server"
                                        Text="Send Message"
                                        CssClass="btn-style-4"
                                        OnClick="btnSubmit_Click"
                                        OnClientClick="return validateForm();" />

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- SHAPES -->
                <img src="<%= ResolveUrl("~/assets/images/home-v1/form/shape-02.png") %>"
                    alt="contact-page-shape"
                    class="parallax-move-left d-none d-lg-flex ixl-contact-shape-02">

                <img src="<%= ResolveUrl("~/assets/images/home-v1/form/shape-01.png") %>"
                    alt="contact-page-shape"
                    class="parallax-move-right d-none d-lg-flex ixl-contact-shape-01">
            </div>

        </div>
    </section>

    <!-- VALIDATION SCRIPT -->
    <script>

        function validateForm() {

            var name = document.getElementById('<%= txtName.ClientID %>').value.trim();

        var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();

        var date = document.getElementById('<%= txtDate.ClientID %>').value.trim();

        var address = document.getElementById('<%= txtAddress.ClientID %>').value.trim();

        var phone = document.getElementById('<%= txtPhone.ClientID %>').value.trim();

        var course = document.getElementById('<%= ddlCourse.ClientID %>').value;

        var message = document.getElementById('<%= txtMessage.ClientID %>').value.trim();

        // NAME
        if (name == "") {
            alert("Please enter your name");
            return false;
        }

        // EMAIL
        if (email == "") {
            alert("Please enter your email");
            return false;
        }

        // EMAIL FORMAT
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
            alert("Please enter valid email");
            return false;
        }

        // DATE
        if (date == "") {
            alert("Please select date");
            return false;
        }

        // ADDRESS
        if (address == "") {
            alert("Please enter address");
            return false;
        }

        // PHONE
        if (phone == "") {
            alert("Please enter phone number");
            return false;
        }

        // PHONE VALIDATION
        if (phone.length != 10 || isNaN(phone)) {
            alert("Please enter valid 10 digit mobile number");
            return false;
        }

        // COURSE
        if (course == "0") {
            alert("Please select course");
            return false;
        }

        // MESSAGE
        if (message == "") {
            alert("Please enter message");
            return false;
        }

        // SUCCESS ALERT
        alert("Your enquiry form has been submitted successfully");

        return true;
    }

    </script>

    <!-- blog posts -->
    <section class="ixl-blog-post pt-120">
        <div class="container">
            <div class="ixl-blog-posts-wrapper">
                <div class="row">

                    <asp:Repeater ID="rptBlog" runat="server">

                        <ItemTemplate>

                            <div class="col-md-6 col-xl-4">
                                <article class="ixl-blog-item"
                                    data-aos="fade-up"
                                    data-aos-delay="400"
                                    data-aos-duration="1000">

                                    <div class="img image-hover-effect">

                                        <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>'
                                            alt="blog-image"
                                            class="img-fluid" />

                                        <span>
                                            <%# Convert.ToDateTime(Eval("CreatedDate")).ToString("MMMM dd, yyyy") %>
                                        </span>

                                    </div>

                                    <div class="content">

                                        <div class="meta">
                                            <span>
                                                <i class="fa-regular fa-user"></i>
                                                By Admin
                                            </span>
                                        </div>

                                        <a class="link-title"
                                            href='blogdetail.aspx?id=<%# Eval("BlogID") %>'>

                                            <h2 class="ixl-heading-md bg-line-underline">
                                                <%# Eval("Title") %>
                                            </h2>

                                        </a>

                                        <a href='blogdetail.aspx?id=<%# Eval("BlogID") %>'
                                            class="read-more">Read More
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

    <div class="main-container">

        <!-- FAQ SECTION -->
        <div class="faq-section">

            <div class="badge">
                Common Questions
            </div>

            <asp:Repeater ID="rptFaq" runat="server">

                <ItemTemplate>

                    <details class="faq-card"
                        <%# Container.ItemIndex == 0 ? "open" : "" %>>

                        <summary>
                            <%# Eval("question") %>

                            <div class="chevron"></div>
                        </summary>

                        <div class="content">
                            <%# Eval("answer") %>
                        </div>

                    </details>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- RIGHT INFO SECTION -->
        <div class="info-section">

            <h1>Start Learning IT Skills with Practical Experience.
            </h1>

            <p>
                Learn modern web development, programming, database management,
            and software development through free beginner-friendly IT courses
            and real-world practical projects.
            </p>

            <div class="feature-list">

                <div class="feature-item">
                    <div class="check-icon">✓</div>
                    Beginner Friendly IT Tutorials
                </div>

                <div class="feature-item">
                    <div class="check-icon">✓</div>
                    Real Projects & Practical Learning
                </div>

                <div class="feature-item">
                    <div class="check-icon">✓</div>
                    Free Web Development Courses
                </div>

            </div>

            <a href="#" class="cta-button">Explore Courses
            </a>

        </div>

    </div>

    <!-- Cta -->
    <section class="ixl-cta-section">
        <div class="container">
            <div class="ixl-cta-wrappper">
                <img src="assets/images/home-v1/cta/cta.png" class="img-fluid" alt="cta">
                <div class="content">
                    <h2 class="ixl-heading-xl text-anime-style-2">Our Passion Outstanding Results</h2>
                    <p class="desc ">
                        It is a long established fact that a reader will be
                                    distracted by the readable
                                    content of a page when looking at its layout
                    </p>
                    <div class="btn-grp">
                        <a href="contact.aspx" class="btn-style-4"><span>Contact Now</span></a>
                        <a class="pricing-btn btn-style-1 mt-2 " href="contact.aspx">Get a Quote</a>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <script>

        async function showSuggestions(value) {

            const box = document.getElementById("suggestionBox");

            box.innerHTML = "";

            // EMPTY INPUT
            if (value.trim() === "") {

                box.style.display = "none";
                return;
            }

            try {

                const response =
                    await fetch("CourseSuggestion.ashx?term=" + encodeURIComponent(value));

                const courses = await response.json();

                // NO DATA
                if (courses.length === 0) {

                    box.style.display = "none";
                    return;
                }

                // CREATE SUGGESTIONS
                courses.forEach(function (item) {

                    let li = document.createElement("li");

                    li.className = "suggestion-item";

                    // SHOW COURSE NAME
                    li.innerHTML = item.course_name;

                    // CLICK SUGGESTION
                    li.onclick = function () {

                        // INPUT ME NAME SET
                        document.getElementById("searchInput").value =
                            item.course_name;

                        // BOX HIDE
                        box.style.display = "none";

                        // REDIRECT
                        window.location.href =
                            "coursedetail.aspx?id=" + item.id;
                    };

                    box.appendChild(li);
                });

                box.style.display = "block";
            }
            catch (error) {

                console.log(error);
            }
        }

        // SEARCH BUTTON CLICK
        function searchCourse() {

            let value =
                document.getElementById("searchInput").value;

            if (value.trim() !== "") {

                window.location.href =
                    "coursedetail.aspx?course=" + encodeURIComponent(value);
            }
        }

        // ENTER KEY SEARCH
        document.getElementById("searchInput")
            .addEventListener("keypress", function (e) {

                if (e.key === "Enter") {

                    e.preventDefault();

                    searchCourse();
                }
            });

        // OUTSIDE CLICK HIDE
        document.addEventListener("click", function (e) {

            const searchBox =
                document.querySelector(".hero-search-box");

            const box =
                document.getElementById("suggestionBox");

            if (!searchBox.contains(e.target)) {

                box.style.display = "none";
            }
        });

    </script>

</asp:Content>

