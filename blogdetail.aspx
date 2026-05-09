<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blogdetail.aspx.cs" Inherits="_blogdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .form-error {
    display: none;
    font-size: 12px;
    color: #dc2626;
    margin-top: 5px;
}

.input-error {
    border-color: #dc2626 !important;
    background-color: #fff5f5 !important;
}
        /* Optimized Contact Form Styling - Blue Theme */
        .ixl-blog-post .col-lg-4 .card {
            border: none;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px); /* Frosted glass effect */
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05) !important;
            padding: 10px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .ixl-blog-post .card-body {
            padding: 2rem;
        }

        .ixl-blog-post .card-title {
            font-weight: 800;
            color: #1a1a1a;
            font-size: 26px;
            margin-bottom: 25px !important;
            letter-spacing: -0.5px;
        }

            /* Blue Accent Line */
            .ixl-blog-post .card-title::after {
                content: '';
                display: block;
                width: 60px;
                height: 4px;
                background: #007bff; /* Premium Royal Blue Accent */
                margin-top: 8px;
                border-radius: 10px;
            }

        .ixl-blog-post .form-label {
            font-weight: 700;
            font-size: 13px;
            color: #444;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 10px;
        }

        .ixl-blog-post .form-control {
            border-radius: 12px;
            padding: 12px 18px;
            border: 1.5px solid #eee;
            background-color: #f9f9f9;
            font-size: 15px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

            .ixl-blog-post .form-control:focus {
                background-color: #fff;
                border-color: #007bff; /* Focus par Blue border */
                box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.1);
                outline: none;
            }

        /* Button Styling - Royal Blue & Bold */
        .ixl-blog-post .btn-primary {
            background: #007bff;
            border: none;
            padding: 15px;
            font-weight: 800;
            border-radius: 12px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 14px;
            transition: all 0.4s ease;
            margin-top: 10px;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.2);
            color: #ffffff;
            width: 100%; /* Button full width karne ke liye */
        }

            .ixl-blog-post .btn-primary:hover {
                background: #0056b3;
                transform: translateY(-3px);
                box-shadow: 0 12px 25px rgba(0, 123, 255, 0.3);
            }

        /* Compact spacing for inputs */
        .mb-3 {
            margin-bottom: 1.5rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                                    class="fa-solid fa-angle-right"></i></li>
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
                    <div class="col-lg-8">
                        <article class="ixl-blog-item"
    data-aos="fade-up"
    data-aos-delay="600"
    data-aos-duration="1500">

    <div class="thumb">

        <a href='blog-single.aspx?id=<%= Request.QueryString["id"] %>'>

            <asp:Image ID="imgBlog"
                runat="server"
                CssClass="img-fluid"
                AlternateText="blog-image-one" />

        </a>

        <div class="date">

            <span>
                <asp:Label ID="lblDay"
                    runat="server"></asp:Label>
            </span>

            <span>
                <asp:Label ID="lblMonth"
                    runat="server"></asp:Label>
            </span>

        </div>

    </div>

    <div class="content-wrap">

        <ul class="meta">

            <li>
                <a href="#">

                    <i class="fa-solid fa-calendar-days"></i>

                    <asp:Label ID="lblDate"
                        runat="server"></asp:Label>

                </a>
            </li>

           

            <!-- STATIC -->
            <li>
                <a href="#">
                    <i class="fa-regular fa-user"></i>
                    (BL Soni)
                </a>
            </li>

        </ul>

        <!-- TITLE -->
        <h2 class="post-title">

            <a class="ixl-heading-lg bg-line-underline"
                href="#">

                <asp:Label ID="lblTitle"
                    runat="server"></asp:Label>

            </a>

        </h2>

        <!-- DESCRIPTION -->
      <div class="excerpt mb-3"
     id="blogDesc"
     runat="server">
</div>

        <!-- BUTTON -->
        <a class="read-more-btn btn-style-1 mt-2"
            href="#">

            Read More
            <i class="fa-solid fa-arrow-right"></i>

        </a>

    </div>

</article>

                      
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title mb-4">Contact Us</h3>
                                <form id="contactForm" action="#" method="POST">

    <!-- Name -->
    <div class="mb-3">
        <label class="form-label">Full Name</label>
        <input type="text" class="form-control" id="name" placeholder="Your Name">
        <div class="form-error" id="nameError">Please enter at least 3 characters</div>
    </div>

    <!-- Email -->
    <div class="mb-3">
        <label class="form-label">Email Address</label>
        <input type="email" class="form-control" id="email" placeholder="name@example.com">
        <div class="form-error" id="emailError">Enter a valid email</div>
    </div>

    <!-- Subject -->
    <div class="mb-3">
        <label class="form-label">Subject</label>
        <input type="text" class="form-control" id="subject" placeholder="How can we help?">
        <div class="form-error" id="subjectError">Subject is required</div>
    </div>

    <!-- Message -->
    <div class="mb-3">
        <label class="form-label">Message</label>
        <textarea class="form-control" id="message" rows="4" placeholder="Write your message here..."></textarea>
        <div class="form-error" id="messageError">Minimum 10 characters required</div>
    </div>

    <!-- Button -->
    <div class="d-grid">
        <button type="submit" class="btn btn-primary">Send Message</button>
    </div>

</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        document.getElementById("contactForm").addEventListener("submit", function(e) {

            let isValid = true;

            const name = document.getElementById("name");
            const email = document.getElementById("email");
            const subject = document.getElementById("subject");
            const message = document.getElementById("message");

            // Reset
            document.querySelectorAll(".form-error").forEach(el => el.style.display = "none");
            document.querySelectorAll(".form-control").forEach(el => el.classList.remove("input-error"));

            // Name
            if (name.value.trim().length < 3) {
                document.getElementById("nameError").style.display = "block";
                name.classList.add("input-error");
                isValid = false;
            }

            // Email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email.value.trim())) {
                document.getElementById("emailError").style.display = "block";
                email.classList.add("input-error");
                isValid = false;
            }

            // Subject
            if (subject.value.trim() === "") {
                document.getElementById("subjectError").style.display = "block";
                subject.classList.add("input-error");
                isValid = false;
            }

            // Message
            if (message.value.trim().length < 10) {
                document.getElementById("messageError").style.display = "block";
                message.classList.add("input-error");
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault(); // stop form submit
            }
        });
</script>
</asp:Content>


