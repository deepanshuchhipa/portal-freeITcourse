<%@ Page Title="Terms of Service - SkillStack IT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="terms.aspx.cs" Inherits="_terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary-blue: #2563eb;
            --text-heading: #0f172a;
            --text-body: #475569;
            --text-nav: #64748b;
            --bg-light: #f8fafc;
        }

        .terms-wrapper {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 60px;
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 24px;
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }

        /* Sticky Sidebar */
        .terms-sidebar {
            position: sticky;
            top: 100px;
            height: fit-content;
        }

        .terms-sidebar h4 {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--text-nav);
            margin-bottom: 24px;
            font-weight: 600;
        }

        .terms-sidebar ul {
            list-style: none;
            padding: 0;
            border-left: 1.5px solid #e2e8f0;
        }

        .terms-sidebar li a {
            display: block;
            padding: 12px 24px;
            color: var(--text-nav);
            text-decoration: none;
            font-size: 0.95rem;
            transition: 0.3s ease;
            margin-left: -1.5px;
            border-left: 1.5px solid transparent;
        }

        .terms-sidebar li a:hover {
            color: var(--primary-blue);
            border-left-color: var(--primary-blue);
            background: linear-gradient(90deg, rgba(37, 99, 235, 0.05) 0%, transparent 100%);
        }

        /* Content Card */
        .terms-card {
            background: #ffffff;
            padding: 60px;
            border-radius: 32px;
            border: 1px solid rgba(226, 232, 240, 0.8);
            box-shadow: 0 20px 50px -12px rgba(0, 0, 0, 0.03);
        }

        .terms-header {
            margin-bottom: 48px;
        }

        .badge-terms {
            background: #f1f5f9;
            color: #475569;
            padding: 6px 14px;
            border-radius: 100px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 20px;
        }

        .terms-header h1 {
            font-size: 3rem;
            font-weight: 800;
            color: var(--text-heading);
            letter-spacing: -0.02em;
            margin-bottom: 16px;
        }

        section {
            margin-top: 48px;
            scroll-margin-top: 120px;
        }

        section h2 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-heading);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        section h2::before {
            content: "";
            width: 4px;
            height: 24px;
            background: var(--primary-blue);
            border-radius: 10px;
        }

        section p {
            font-size: 1.05rem;
            line-height: 1.8;
            color: var(--text-body);
        }

        .alert-box {
            background: #fff7ed;
            border-left: 4px solid #f97316;
            padding: 20px;
            border-radius: 12px;
            margin: 30px 0;
            font-size: 0.95rem;
            color: #9a3412;
        }

        @media (max-width: 968px) {
            .terms-wrapper { grid-template-columns: 1fr; margin: 40px auto; }
            .terms-sidebar { display: none; }
            .terms-card { padding: 32px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="terms-wrapper">
        <aside class="terms-sidebar">
            <h4>Navigate</h4>
            <ul>
                <li><a href="#agreement">Agreement</a></li>
                <li><a href="#account">User Accounts</a></li>
                <li><a href="#content">Intellectual Property</a></li>
                <li><a href="#termination">Termination</a></li>
                <li><a href="#liability">Limitation of Liability</a></li>
            </ul>
        </aside>

        <main class="terms-card">
            <header class="terms-header">
                <span class="badge-terms">User Agreement</span>
                <h1>Terms of Service</h1>
                <p style="color: var(--text-nav);">Last Modified: May 14, 2026</p>
            </header>

            <div class="alert-box">
                <strong>Important:</strong> Please read these terms carefully before using SkillStack IT. By accessing our platform, you agree to be bound by these conditions.
            </div>

            <section id="agreement">
                <h2>1. Acceptance of Terms</h2>
                <p>By accessing or using SkillStack IT, you confirm your agreement to be bound by these Terms of Service. If you do not agree to these terms, please do not use the service.</p>
            </section>

            <section id="account">
                <h2>2. User Accounts</h2>
                <p>To access certain features, you must create an account. You are responsible for maintaining the confidentiality of your credentials and for all activities that occur under your account.</p>
            </section>

            <section id="content">
                <h2>3. Intellectual Property</h2>
                <p>All software, design, and content hosted on SkillStack IT are the exclusive property of our company. You are granted a limited, non-exclusive license to use the platform for its intended purposes.</p>
            </section>

            <section id="termination">
                <h2>4. Termination</h2>
                <p>We reserve the right to suspend or terminate your access to the platform at our sole discretion, without notice, for conduct that we believe violates these Terms.</p>
            </section>

            <section id="liability">
                <h2>5. Limitation of Liability</h2>
                <p>In no event shall SkillStack IT be liable for any indirect, incidental, or consequential damages arising out of your use or inability to use the platform.</p>
            </section>
        </main>
    </div>
</asp:Content>