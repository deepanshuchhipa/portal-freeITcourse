<%@ Page 
    Title="Programming Tutorials & Developer Courses | FreeITLearning.com" 
    ValidateRequest="false" 
    Language="C#" 
    MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" 
    CodeFile="course.aspx.cs" 
    Inherits="_course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --text-dark: #0f172a;
            --text-light: #64748b;
            --bg-gradient: linear-gradient(135deg, #f8fafc 0%, #eff6ff 100%);
            --card-shadow: 0 10px 25px rgba(0,0,0,0.03);
            --card-hover-shadow: 0 30px 60px rgba(37, 99, 235, 0.15);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        .course-page-wrapper {
            background: var(--bg-gradient);
            padding-bottom: 100px;
            font-family: 'Plus Jakarta Sans', sans-serif;
            min-height: 100vh;
        }

        /* Animations */
        @keyframes revealUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-on-load {
            opacity: 0;
            animation: revealUp 0.8s cubic-bezier(0.2, 0.8, 0.2, 1) forwards;
        }

        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.25s; }
        .delay-3 { animation-delay: 0.4s; }
        .delay-4 { animation-delay: 0.55s; }

        /* Layout Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Breadcrumb */
        .breadcrumb-section { padding-top: 120px; margin-bottom: 20px; }
        .breadcrumb-glass {
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            padding: 10px 24px;
            border-radius: 50px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        .breadcrumb-item { text-decoration: none; color: var(--text-light); font-size: 13px; font-weight: 600; transition: 0.3s; }
        .breadcrumb-item:hover { color: var(--primary); }
        .breadcrumb-item.active { color: var(--text-dark); font-weight: 800; }

        /* Header */
        .page-header { margin-bottom: 60px; }
        .page-header h1 { font-size: 3.2rem; font-weight: 800; color: var(--text-dark); letter-spacing: -1.5px; margin-bottom: 12px; }
        .page-header p { color: var(--text-light); font-size: 1.1rem; }

        /* Grid */
        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        /* Card Structure */
        .course-card {
            background: white;
            border-radius: 28px;
            border: 1px solid #f1f5f9;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: all 0.5s cubic-bezier(0.23, 1, 0.32, 1);
            box-shadow: var(--card-shadow);
        }

        .course-card:hover {
            transform: translateY(-12px);
            box-shadow: var(--card-hover-shadow);
            border-color: var(--primary);
        }

        /* Visual Header of Card */
        .course-visual {
            height: 210px;
            margin: 12px;
            border-radius: 20px;
            overflow: hidden;
            position: relative;
        }

        .course-img { width: 100%; height: 100%; object-fit: cover; transition: 0.6s ease; }
        .course-card:hover .course-img { transform: scale(1.1); }

        .visual-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.5), transparent);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: 0.4s;
        }
        .course-card:hover .visual-overlay { opacity: 1; }
        .visual-overlay i { color: white; font-size: 50px; transform: scale(0.8); transition: 0.4s; }
        .course-card:hover .visual-overlay i { transform: scale(1) rotate(-5deg); }

        /* Card Content Body */
        .course-body { padding: 8px 24px 24px; flex-grow: 1; display: flex; flex-direction: column; }
        
        .badge-group { display: flex; gap: 8px; margin-bottom: 15px; }
        .badge-tag { font-size: 10px; font-weight: 800; padding: 6px 14px; border-radius: 50px; background: #f1f5f9; color: #64748b; text-transform: uppercase; }
        .tag-free { background: var(--primary); color: white; }

        .course-title { font-size: 22px; font-weight: 800; color: var(--text-dark); margin-bottom: 10px; line-height: 1.3; }
        .course-desc { color: var(--text-light); font-size: 14px; line-height: 1.6; margin-bottom: 20px; }

        /* Card Footer */
        .course-footer {
            margin-top: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px dashed #f1f5f9;
            padding-top: 20px;
        }

        .price-box .label { display: block; font-size: 10px; color: #94a3b8; text-transform: uppercase; font-weight: 700; }
        .price-box .val { font-size: 24px; font-weight: 900; color: var(--primary); }

        .btn-enroll {
            background: var(--text-dark);
            color: white !important;
            height: 48px;
            width: 48px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            overflow: hidden;
            white-space: nowrap;
        }

        .btn-enroll span { display: none; font-size: 14px; font-weight: 700; margin-right: 10px; }

        .course-card:hover .btn-enroll { width: 150px; background: var(--primary); }
        .course-card:hover .btn-enroll span { display: inline-block; }

        @media (max-width: 768px) {
            .page-header h1 { font-size: 2.5rem; }
            .course-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="course-page-wrapper">
        
        <!-- Breadcrumb Section -->
        <div class="container breadcrumb-section animate-on-load">
            <nav class="breadcrumb-glass">
                <a href="Default.aspx" class="breadcrumb-item"><i class="fas fa-home"></i> Home</a>
                <span style="opacity:0.3">/</span>
                <span class="breadcrumb-item active">Free Courses</span>
            </nav>
        </div>

        <!-- Header Section -->
        <header class="container page-header animate-on-load delay-1">
            <h1>Free Learning Paths</h1>
            <p>Upgrade your skills with our industry-recognized free certified courses.</p>
        </header>

        <!-- Course Grid Section -->
        <section class="container">
    
    <div class="course-grid">

        <asp:Repeater ID="rptCourses" runat="server">

            <ItemTemplate>

                <article class="course-card animate-on-load">

                    <div class="course-visual">
                        <img src='<%# ResolveUrl(Eval("course_image").ToString()) %>' 
                             alt='<%# Eval("course_name") %>' 
                             class="course-img" />
                    </div>

                    <div class="course-body">

                        <div class="badge-group">
                            <span class="badge-tag tag-free">Free</span>
                        </div>

                        <h2 class="course-title">
                            <%# Eval("course_name") %>
                        </h2>

                        <p class="course-desc">
                            <%# Eval("short_description") %>
                        </p>

                        <div class="course-footer">

                            <div class="price-box">
                                <span class="label">Course Fee</span>
                                <span class="val">FREE</span>
                            </div>

                            <a href='coursedetail.aspx?id=<%# Eval("id") %>' class="btn-enroll">
                                <span>Enroll Now</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>

                        </div>

                    </div>

                </article>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</section>
    </div>
</asp:Content>