<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="csitmap.aspx.cs" Inherits="_csitmap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --glass-bg: rgba(255, 255, 255, 0.95);
            --text-main: #2d3436;
            --accent: #6c5ce7;
        }

        .sitemap-section {
            padding: 60px 20px;
            background: #f8f9fa;
            min-height: 80vh;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        .sitemap-card {
            max-width: 1100px;
            margin: 0 auto;
            background: var(--glass-bg);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.05);
            border: 1px solid rgba(255,255,255,0.3);
        }

        .header-box {
            border-bottom: 2px solid #eee;
            margin-bottom: 30px;
            padding-bottom: 20px;
        }

        .header-box h1 {
            font-size: 2.2rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }

        .keyword-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 15px;
            list-style: none;
            padding: 0;
        }

        .keyword-item a {
            display: block;
            padding: 12px 18px;
            background: #fff;
            border: 1px solid #e1e8ed;
            border-radius: 10px;
            color: var(--text-main);
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .keyword-item a:hover {
            border-color: var(--accent);
            color: var(--accent);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.1);
        }

        .keyword-item a::before {
            content: "•";
            margin-right: 8px;
            color: var(--accent);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .keyword-grid {
                grid-template-columns: 1fr 1fr;
            }
            .sitemap-card {
                padding: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sitemap-section">

    <div class="sitemap-card">

        <div class="header-box">
            <h1>Course SEO Sitemap</h1>
        </div>

        <ul class="keyword-grid">

            <asp:Repeater ID="rptKeywords" runat="server">

    <ItemTemplate>

        <li class="keyword-item">

            <a href='/course-detail/<%# 
Eval("KeywordName").ToString()
.Replace(" ","-")
.ToLower()
%>'>

                <%# Eval("KeywordName") %>

            </a>

        </li>

    </ItemTemplate>

</asp:Repeater>

        </ul>

    </div>

</section>
</asp:Content>

