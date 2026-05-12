<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="coursedet.aspx.cs" Inherits="_coursedet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* CSS Variables */
        :root {
            --theme-primary: #2928E8;
            --theme-header: #140B43;
            --theme-text: #514A74;
            --theme-bg-soft: #FAF7F0;
            --theme-accent: #FFB800;
        }

        body {
            font-family: "Lexend Deca", sans-serif;
            background-color: #fff;
            color: var(--theme-text);
        }

        /* --- Updated Hero Section with Background Image --- */
        .ixl-hero-section {
            padding: 100px 0 80px;
            /* Yahan apni image ka path lagayein */
            background: linear-gradient(rgba(20, 11, 67, 0.85), rgba(20, 11, 67, 0.85)), url('https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1400&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
        }

            .ixl-hero-section h1 {
                color: #ffffff !important;
                font-size: 3.5rem;
            }

        .breadcrumb-item, .breadcrumb-item.active {
            color: rgba(255, 255, 255, 0.7) !important;
            font-size: 14px;
        }

            .breadcrumb-item + .breadcrumb-item::before {
                color: rgba(255, 255, 255, 0.5);
            }

        .course-meta-top {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-top: 25px;
            flex-wrap: wrap;
        }

        .meta-item {
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 8px 20px;
            border-radius: 50px;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-weight: 500;
        }

        /* --- Content Card Styling --- */
        .content-section-wrap {
            padding: 80px 0;
            background-color: #fcfcfc;
        }

        .ixl-card-premium {
            background: #fff;
            border: 1px solid #E0E0E0;
            border-radius: 24px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.02);
        }

        /* --- Sidebar Form --- */
        .side-form-panel {
            background: #fff;
            border: 1px solid #E0E0E0;
            border-radius: 24px;
            padding: 35px;
            position: sticky;
            top: 100px;
            box-shadow: 0px 20px 40px rgba(20, 11, 67, 0.08);
        }

            .side-form-panel h4 {
                color: var(--theme-header);
                font-weight: 700;
                margin-bottom: 10px;
                font-size: 22px;
            }

        .form-label-custom {
            font-size: 12px;
            font-weight: 700;
            color: var(--theme-header);
            margin-bottom: 8px;
            display: block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control-custom {
            width: 100%;
            padding: 12px 18px;
            border: 1px solid #E0E0E0;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 15px;
            transition: 0.3s;
        }

            .form-control-custom:focus {
                outline: none;
                border-color: var(--theme-primary);
                box-shadow: 0 0 0 4px rgba(41, 40, 232, 0.1);
            }

        .btn-submit-form {
            background: var(--theme-primary);
            color: #fff;
            border: none;
            padding: 16px;
            border-radius: 12px;
            font-weight: 700;
            width: 100%;
            cursor: pointer;
            transition: 0.3s;
        }

            .btn-submit-form:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(41, 40, 232, 0.2);
            }

        /* --- Curriculum --- */
        .curriculum-number {
            min-width: 40px;
            height: 40px;
            background: var(--theme-primary);
            color: #fff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 14px;
        }

        .curriculum-item {
            border-bottom: 1px solid #F1F1F1;
            padding: 20px 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <!-- New Hero Section -->
        <section class="ixl-hero-section">
        <div class="container">
            <nav aria-label="breadcrumb"
                style="background: url('images/breadcrumb-bg.jpg') center/cover no-repeat; padding: 40px 25px; border-radius: 12px;">
            </nav>

            <div class="row">
                <div class="col-lg-8">
                    <h1 class="fw-bold">Web Development Masterclass</h1>
                    <p class="lead" style="color: rgba(255,255,255,0.8);">Become a full-stack developer by working on real-world cloud projects and modern UI frameworks.</p>

                    <div class="course-meta-top">
                        <div class="meta-item">
                            📅 Updated: <strong>May 2026</strong>
                        </div>
                        <div class="meta-item">
                            🌐 Language: <strong>English / Hindi</strong>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content Section -->
    <section class="content-section-wrap">

    <div class="container">

        <div class="row">

            <!-- Left Content -->
            <div class="col-lg-8">

                <div class="ixl-card-premium">

                    <h2 class="fw-bold mb-4" style="color: var(--theme-header);">
                        About This Course
                    </h2>

                    <p style="line-height: 1.8; font-size: 16px;">

                        <asp:Literal ID="litFullDescription" runat="server"></asp:Literal>

                    </p>

                </div>

            </div>

            <!-- Right Sidebar -->
            <div class="col-lg-4">

                <div class="side-form-panel">

                    <h4>Enrollment Inquiry</h4>

                    <p class="text-muted small mb-4">
                        Interested in this course? Fill out the form and we'll contact you.
                    </p>

                    <div class="form-group">
                        <label class="form-label-custom">Full Name</label>
                        <input type="text" class="form-control-custom" placeholder="Enter your name" required />
                    </div>

                    <div class="form-group">
                        <label class="form-label-custom">Email Address</label>
                        <input type="email" class="form-control-custom" placeholder="example@mail.com" required />
                    </div>

                    <div class="form-group">
                        <label class="form-label-custom">Phone Number</label>
                        <input type="tel" class="form-control-custom" placeholder="+91 00000 00000" required />
                    </div>

                    <button type="submit" class="btn-submit-form">
                        Request a Call Back
                    </button>

                </div>

            </div>

        </div>

    </div>

</section>
</asp:Content>

