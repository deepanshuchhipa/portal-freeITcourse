<%@ Page Title="Manage Blogs" ValidateRequest="false" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ablog.aspx.cs" Inherits="Admin_ablog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Layout Fix - Master page handles the margin */
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
            grid-template-columns: 1fr 1fr; /* Divide into two equal columns */
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

        /* GridView Styling */
        .cms-table-res { overflow-x: auto; width: 100%; }
        .cms-grid { width: 100%; border-collapse: collapse; min-width: 600px; }
        .cms-grid th { background: #f8fafc; color: #4a5568; padding: 12px 16px; text-align: left; font-size: 12px; text-transform: uppercase; border-bottom: 2px solid #e2e8f0; }
        .cms-grid td { padding: 12px 16px; border-bottom: 1px solid #edf2f7; font-size: 14px; color: #2d3748; }
        .cms-badge-img { width: 50px; height: 35px; border-radius: 4px; object-fit: cover; border: 1px solid #e2e8f0; }

        /* Modal Preview */
        .preview-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.7); display: flex; justify-content: center; align-items: center; z-index: 2000; padding: 20px; }
        .preview-box { background: #fff; width: 100%; max-width: 800px; border-radius: 12px; max-height: 90vh; overflow-y: auto; position: relative; }
        .close-btn { position: absolute; right: 15px; top: 15px; background: #e53e3e; color: #fff; border: none; border-radius: 50%; width: 30px; height: 30px; cursor: pointer; font-weight: bold; }

        /* Responsive Breakpoints */
        @media (max-width: 850px) {
            .cms-form-grid { grid-template-columns: 1fr; } /* Single column on tablets/mobile */
            .cms-actions { grid-column: span 1; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cms-main-wrapper">
        <div class="cms-form-container">
            
            <div class="cms-header-section">
                <h2>Manage Blogs</h2>
                <p>Create, update, or remove your blog posts with a professional layout.</p>
            </div>

            <div class="cms-card">
                <asp:HiddenField ID="hfBlogID" runat="server" Value="0" />

                <div class="cms-form-grid">
                    <!-- LEFT COLUMN -->
                    <div class="cms-left-col">
                        <div class="cms-form-group">
                            <label>Blog Title</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="cms-input" placeholder="Enter blog title"></asp:TextBox>
                        </div>

                        <div class="cms-form-group">
                            <label>Cover Image</label>
                            <div class="cms-upload-box">
                                <asp:FileUpload ID="fuImage" runat="server" CssClass="cms-input" />
                                <asp:Image ID="imgPrev" runat="server" Visible="false" Style="margin-top:10px; width:100%; max-width:150px; border-radius:8px;" />
                            </div>
                        </div>

                        <div class="cms-form-group">
                            <label style="display:flex; align-items:center; gap:8px; cursor:pointer;">
                                <asp:CheckBox ID="chkPublished" runat="server" Checked="true" /> Publish Immediately
                            </label>
                        </div>
                    </div>

                    <!-- RIGHT COLUMN -->
                    <div class="cms-right-col">
                        <div class="cms-form-group">
                            <label>Content Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="cms-input" Rows="8"></asp:TextBox>
                        </div>
                    </div>

                    <!-- BUTTONS (Spans both columns or moves to bottom) -->
                    <div class="cms-actions">
                        <asp:Button ID="btnCancel" runat="server" Text="Discard" CssClass="cms-btn cms-btn-secondary" CausesValidation="false" />
                        <asp:Button ID="btnSave" runat="server" Text="Save Blog Post" CssClass="cms-btn cms-btn-primary" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>

            <!-- Existing Blogs Grid -->
            <div class="cms-card" style="padding: 0; overflow: hidden;">
                <div style="padding: 15px 20px; border-bottom: 1px solid #e2e8f0;">
                    <h3 style="margin:0; font-size:16px; font-weight:600;">Existing Blogs</h3>
                </div>
                <div class="cms-table-res">
                    <asp:GridView ID="gvBlogs" runat="server" AutoGenerateColumns="False" CssClass="cms-grid" 
                        GridLines="None" DataKeyNames="BlogID" OnRowCommand="gvBlogs_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' class="cms-badge-img" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span style='<%# "font-weight:600; color:" + (Convert.ToBoolean(Eval("IsPublished")) ? "#38a169" : "#e53e3e") %>'>
                                        <%# Convert.ToBoolean(Eval("IsPublished")) ? "● Published" : "● Draft" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnView" runat="server" CommandName="ViewBlog" CommandArgument='<%# Eval("BlogID") %>' style="color:#5d5fef; font-weight:600; margin-right:10px;">View</asp:LinkButton>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditBlog" CommandArgument='<%# Eval("BlogID") %>' style="color:#5d5fef; font-weight:600; margin-right:10px;">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteBlog" CommandArgument='<%# Eval("BlogID") %>' style="color:#e53e3e; font-weight:600;" OnClientClick="return confirm('Delete this blog?');">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

    <!-- Details Modal -->
    <asp:Panel ID="pnlPreview" runat="server" Visible="false">
        <div class="preview-overlay">
            <div class="preview-box">
                <asp:Button ID="btnClosePreview" runat="server" Text="&times;" CssClass="close-btn" OnClick="btnClosePreview_Click" />
                <div style="padding:30px;">
                    <h2 style="margin-bottom:15px; color:#1a202c;"><asp:Literal ID="litTitle" runat="server"></asp:Literal></h2>
                    <img id="previewImage" runat="server" style="width:100%; border-radius:12px; margin-bottom:15px; border: 1px solid #e2e8f0;" />
                    <div class="preview-text" style="line-height:1.6; color:#4a5568;">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script>CKEDITOR.replace('<%= txtDescription.ClientID %>');</script>
</asp:Content>