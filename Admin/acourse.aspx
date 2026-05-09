<%@ Page Title="Course Management"  ValidateRequest="false" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="acourse.aspx.cs" Inherits="Admin_acourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Layout Fix - Margin removed to work with fluid Master Page */
        .cms-main-wrapper { padding: 10px 0; transition: all 0.3s; }
        .cms-form-container { width: 100%; max-width: 1100px; margin: 0 auto; font-family: 'Inter', sans-serif; }
        
        .cms-header-section { margin-bottom: 25px; }
        .cms-header-section h2 { margin: 0; color: #1a202c; font-size: 22px; font-weight: 700; }
        .cms-header-section p { color: #718096; margin-top: 5px; font-size: 14px; }

        .cms-card { 
            background: #ffffff; padding: 25px; border-radius: 12px; 
            border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,0.05); margin-bottom: 25px; 
        }

        /* Column Division (Two Column Layout) */
        .cms-form-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr; /* Course info left, Descriptions right */
            gap: 25px;
        }

        .cms-form-group { margin-bottom: 18px; }
        .cms-form-group label { display: block; font-weight: 600; margin-bottom: 8px; color: #4a5568; font-size: 13px; }
        
        .cms-input { 
            width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 8px; 
            font-size: 14px; transition: all 0.2s; box-sizing: border-box; background-color: #fff;
        }
        .cms-input:focus { border-color: #5d5fef; outline: none; box-shadow: 0 0 0 3px rgba(93, 95, 239, 0.1); }
        
        .cms-upload-box { 
            padding: 15px; border: 2px dashed #cbd5e0; border-radius: 10px; 
            background: #f8fafc; text-align: center; 
        }
        
        .cms-actions { display: flex; justify-content: flex-end; gap: 12px; margin-top: 15px; grid-column: span 2; }
        
        .cms-btn { padding: 10px 20px; border-radius: 8px; cursor: pointer; font-weight: 600; font-size: 14px; transition: 0.3s; border: none; }
        .cms-btn-primary { background: #5d5fef; color: white; }
        .cms-btn-secondary { background: #edf2f7; color: #4a5568; }

        /* GridView Table Styling */
        .cms-table-res { overflow-x: auto; width: 100%; }
        .cms-grid { width: 100%; border-collapse: collapse; min-width: 700px; }
        .cms-grid th { background: #f8fafc; color: #4a5568; padding: 12px 16px; text-align: left; font-size: 12px; text-transform: uppercase; border-bottom: 2px solid #e2e8f0; }
        .cms-grid td { padding: 12px 16px; border-bottom: 1px solid #edf2f7; font-size: 14px; color: #2d3748; vertical-align: middle; }
        
        .cms-badge-img { width: 55px; height: 38px; border-radius: 4px; object-fit: cover; border: 1px solid #e2e8f0; }
        
        .cms-action-btn { text-decoration: none; padding: 6px 10px; border-radius: 6px; font-weight: 600; font-size: 12px; display: inline-block; }
        .cms-edit { color: #5d5fef; background: #f0f2ff; margin-right: 5px; }
        .cms-delete { color: #e53e3e; background: #fff5f5; }

        /* Mobile Breakpoint */
        @media (max-width: 900px) {
            .cms-form-grid { grid-template-columns: 1fr; }
            .cms-actions { grid-column: span 1; flex-direction: column-reverse; }
            .cms-btn { width: 100%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cms-main-wrapper">
        <div class="cms-form-container">
            
            <div class="cms-header-section">
                <h2>Manage Courses</h2>
                <p>Add or update your training modules using the grid layout.</p>
            </div>

            <div class="cms-card">
                <div class="cms-form-grid">
                    
                    <!-- LEFT COLUMN: Basic Info -->
                    <div class="cms-col-left">
                        <div class="cms-form-group">
                            <label>Course Name</label>
                            <asp:TextBox ID="txtCourseName" runat="server" CssClass="cms-input" placeholder="e.g. Master in Web Design"></asp:TextBox>
                        </div>

                        <div class="cms-form-group">
                            <label>Title Tagline</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="cms-input" placeholder="Course Tagline"></asp:TextBox>
                        </div>

                        <div class="cms-form-group">
                            <label>Upload Thumbnail</label>
                            <div class="cms-upload-box">
                                <asp:FileUpload ID="fuCourseImage" runat="server" />
                                <asp:HiddenField ID="hfExistingImage" runat="server" />
                                <p style="margin-top:8px; font-size:11px; color:#a0aec0;">JPG/PNG (800x600px)</p>
                            </div>
                        </div>
                    </div>

                    <!-- RIGHT COLUMN: Descriptions -->
                    <div class="cms-col-right">
                        <div class="cms-form-group">
                            <label>Short Summary</label>
                            <asp:TextBox ID="txtShortDesc" runat="server" CssClass="cms-input" TextMode="MultiLine" Rows="2" placeholder="Brief summary..."></asp:TextBox>
                        </div>

                     <div class="cms-form-group">
    <label>Full Curriculum Details</label>

    <asp:TextBox 
        ID="txtFullDesc" 
        runat="server" 
        CssClass="cms-input"
        TextMode="MultiLine"
        Rows="7">
    </asp:TextBox>
</div>

                    </div>

                    <!-- ACTIONS -->
                    <div class="cms-actions">
                        <asp:Button ID="btnReset" runat="server" Text="Discard" CssClass="cms-btn cms-btn-secondary" OnClick="btnReset_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save Course" CssClass="cms-btn cms-btn-primary" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>

            <!-- Existing Data Section -->
            <div class="cms-card" style="padding: 0; overflow: hidden;">
                <div style="padding: 15px 20px; border-bottom: 1px solid #e2e8f0; background:#fcfcfc;">
                    <h3 style="margin:0; font-size:16px; font-weight:600;">Active Course List</h3>
                </div>
                <div class="cms-table-res">
                    <asp:GridView ID="gvCourses" runat="server" CssClass="cms-grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gvCourses_RowCommand" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="course_name" HeaderText="Course" />
                            <asp:BoundField DataField="title" HeaderText="Tagline" />
                            <asp:TemplateField HeaderText="Img">
                                <ItemTemplate>
<img src='<%# ResolveUrl(Eval("course_image").ToString()) %>' 
     class="cms-badge-img" 
     alt="course" />                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditRow" CommandArgument='<%# Eval("id") %>' CssClass="cms-action-btn cms-edit">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("id") %>' CssClass="cms-action-btn cms-delete" OnClientClick="return confirm('Permanent delete this course?')">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>
    
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>

<script>
    CKEDITOR.replace('<%= txtFullDesc.ClientID %>');
</script>
</asp:Content>