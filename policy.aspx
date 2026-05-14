<%@ Page Title="Privacy Policy - SkillStack IT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="policy.aspx.cs" Inherits="_policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary-blue: #2563eb;
            --text-heading: #0f172a;
            --text-body: #475569;
            --text-nav: #64748b;
            --bg-light: #f8fafc;
            --glass-white: rgba(255, 255, 255, 0.95);
        }

        /* Layout Container matching image_add6e2.png */
        .policy-wrapper {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 60px;
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 24px;
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }

        /* Sticky Sidebar Navigation */
        .policy-sidebar {
            position: sticky;
            top: 100px;
            height: fit-content;
        }

        .policy-sidebar h4 {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: var(--text-nav);
            margin-bottom: 24px;
            font-weight: 600;
        }

        .policy-sidebar ul {
            list-style: none;
            padding: 0;
            border-left: 1.5px solid #e2e8f0;
        }

        .policy-sidebar li a {
            display: block;
            padding: 12px 24px;
            color: var(--text-nav);
            text-decoration: none;
            font-size: 0.95rem;
            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin-left: -1.5px;
            border-left: 1.5px solid transparent;
        }

        .policy-sidebar li a:hover {
            color: var(--primary-blue);
            border-left-color: var(--primary-blue);
            background: linear-gradient(90deg, rgba(37, 99, 235, 0.05) 0%, transparent 100%);
        }

        /* Main Content Glassmorphism Card */
        .policy-main-card {
            background: var(--glass-white);
            padding: 60px;
            border-radius: 32px;
            border: 1px solid rgba(226, 232, 240, 0.8);
            box-shadow: 0 20px 50px -12px rgba(0, 0, 0, 0.03);
        }

        .policy-header {
            margin-bottom: 48px;
        }

        .badge-legal {
            background: #eff6ff;
            color: var(--primary-blue);
            padding: 6px 14px;
            border-radius: 100px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 20px;
        }

        .policy-header h1 {
            font-size: 3rem;
            font-weight: 800;
            color: var(--text-heading);
            letter-spacing: -0.02em;
            margin-bottom: 16px;
        }

        .update-tag {
            color: var(--text-nav);
            font-size: 1rem;
        }

        /* Section Styling */
        section {
            margin-top: 48px;
            scroll-margin-top: 120px;
        }

        section h2 {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--text-heading);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 16px;
        }

        section h2::before {
            content: "";
            width: 4px;
            height: 28px;
            background: var(--primary-blue);
            border-radius: 10px;
        }

        section p, section li {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--text-body);
        }

        /* Mobile Adjustments */
        @media (max-width: 968px) {
            .policy-wrapper { grid-template-columns: 1fr; margin: 40px auto; }
            .policy-sidebar { display: none; }
            .policy-main-card { padding: 32px; border-radius: 20px; }
            .policy-header h1 { font-size: 2.2rem; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="policy-wrapper">
        <aside class="policy-sidebar">
            <h4>Contents</h4>
            <ul>
                <li><a href="#intro">Introduction</a></li>
                <li><a href="#collection">Data Collection</a></li>
                <li><a href="#usage">Usage Policy</a></li>
                <li><a href="#security">Security Protocol</a></li>
                <li><a href="#contact">Contact Details</a></li>
            </ul>
        </aside>

        <main class="policy-main-card">
            <header class="policy-header">
                <span class="badge-legal">Legal Document</span>
                <h1>Privacy Policy</h1>
                <p class="update-tag">Effective Date: <strong>May 14, 2026</strong> • Version 2.0</p>
            </header>

            <section id="intro">
                <h2>Introduction</h2>
                <p>At SkillStack IT, we prioritize your digital sovereignty. This policy details how your data is collected, stored, and safeguarded within our ecosystem. By interacting with our services, you consent to the refined data practices described herein.</p>
            </section>

            <section id="collection">
                <h2>Information We Collect</h2>
                <p>We adhere to strict data minimization principles. We only process data required for core functionality:</p>
                <ul style="margin-top: 15px;">
                    <li><strong>Identity:</strong> Securely hashed credentials and profile metadata.</li>
                    <li><strong>Context:</strong> IP localization and browser environment for security.</li>
                    <li><strong>Session:</strong> Temporary cookies to maintain persistent authenticated states.</li>
                </ul>
            </section>

            <section id="security">
                <h2>Security Protocol</h2>
                <p>Your information is stored behind <strong>AES-256 encryption</strong> layers. We utilize <strong>TLS 1.3</strong> for all data in transit, ensuring that your connection to SkillStack IT remains private and tamper-proof.</p>
            </section>

            <section id="contact">
                <h2>Contact</h2>
                <p>For data portability requests or privacy inquiries, contact our team at <strong>privacy@SkillStack IT.com</strong>.</p>
            </section>
        </main>
    </div>
</asp:Content>