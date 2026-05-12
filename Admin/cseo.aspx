<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="cseo.aspx.cs" Inherits="Admin_cseo" %>

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
            
            <!-- Header Section -->
            <div class="cms-header-section">
                <h2>Course SEO Management</h2>
                <p>Assign and manage search keywords for specific courses to improve visibility.</p>
            </div>

            <!-- Form Card -->
            <div class="cms-card">
                <div class="cms-form-grid">
                    
                    <!-- Left Side: Basic Info -->
                    <div class="cms-left-col">
                        <div class="cms-form-group">
                            <label>Select Course</label>
                            <asp:DropDownList ID="ddlCourses" runat="server" CssClass="cms-input">
                                <asp:ListItem Text="-- Select Course --" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>

                        <div class="cms-form-group">
                            <label>Keyword Name</label>
                            <asp:TextBox ID="txtKeywordName" runat="server" CssClass="cms-input" placeholder="e.g. Best Python Course for Beginners"></asp:TextBox>
                          
                        </div>
                    </div>

                    <!-- Right Side: Status & Helper -->
                    <div class="cms-right-col">
                        <div class="cms-form-group">
                            <label>Keyword Status</label>
                            <div style="padding: 10px 0;">
                                <asp:CheckBox ID="chkIsActive" runat="server" Checked="true" Text="&nbsp; Mark as Active" Font-Size="14px" />
                            </div>
                        </div>

                        <div class="cms-upload-box">
                            <p style="font-size: 13px; color: #718096; line-height: 1.5; text-align: left; margin: 0;">
                                <strong>💡 SEO Tip:</strong> Use keywords that students are likely to type in search engines. 
                                Link keywords specifically to the most relevant course.
                            </p>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="cms-actions">
                        <asp:HiddenField ID="hfKeywordID" runat="server" Value="0" />
                        <asp:Button ID="btnCancel" runat="server" Text="Reset Form" CssClass="cms-btn cms-btn-secondary" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnSave" runat="server" Text="Save SEO Keyword" CssClass="cms-btn cms-btn-primary" 
                            ValidationGroup="vgSeo" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>

            <!-- List View Card -->
            <div class="cms-card">
                <div class="cms-header-section" style="margin-bottom: 15px;">
                    <h3 style="font-size: 18px; color: #2d3748;">Active Course Keywords</h3>
                </div>
                <div class="cms-table-res">
                    <asp:GridView ID="gvSeoKeywords" runat="server" AutoGenerateColumns="False" CssClass="cms-grid" 
                        DataKeyNames="KeywordID" OnRowCommand="gvSeoKeywords_RowCommand" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="KeywordID" HeaderText="ID" ItemStyle-Width="50px" />
                            <asp:BoundField DataField="CourseName" HeaderText="Course" /> <%-- Assuming you join with Course table --%>
                            <asp:BoundField DataField="KeywordName" HeaderText="Keyword" />
                            
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='<%# Convert.ToBoolean(Eval("IsActive")) ? "cms-edit" : "cms-delete" %>' 
                                          style="padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: bold;">
                                        <%# Convert.ToBoolean(Eval("IsActive")) ? "ACTIVE" : "INACTIVE" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="UpdatedAt" HeaderText="Last Updated" DataFormatString="{0:dd-MMM-yyyy}" />
                            
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditRow" 
                                        CommandArgument='<%# Eval("KeywordID") %>' CssClass="cms-action-btn cms-edit">
                                        <i class="fa fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRow" 
                                        CommandArgument='<%# Eval("KeywordID") %>' CssClass="cms-action-btn cms-delete"
                                        OnClientClick="return confirm('Are you sure you want to remove this keyword?');">
                                        <i class="fa fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 20px; text-align: center; color: #718096;">
                                No keywords assigned yet.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

