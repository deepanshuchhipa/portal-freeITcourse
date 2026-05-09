<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="afaq.aspx.cs" Inherits="Admin_afaq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Layout Fix - Margin removed to work with fluid Master Page */
        .cms-main-wrapper {
            padding: 10px 0;
            transition: all 0.3s;
        }

        .cms-form-container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            font-family: 'Inter', sans-serif;
        }

        .cms-header-section {
            margin-bottom: 25px;
        }

            .cms-header-section h2 {
                margin: 0;
                color: #1a202c;
                font-size: 22px;
                font-weight: 700;
            }

            .cms-header-section p {
                color: #718096;
                margin-top: 5px;
                font-size: 14px;
            }

        .cms-card {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            margin-bottom: 25px;
        }

        /* Column Division (Two Column Layout) */
        .cms-form-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr; /* Course info left, Descriptions right */
            gap: 25px;
        }

        .cms-form-group {
            margin-bottom: 18px;
        }

            .cms-form-group label {
                display: block;
                font-weight: 600;
                margin-bottom: 8px;
                color: #4a5568;
                font-size: 13px;
            }

        .cms-input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #cbd5e0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.2s;
            box-sizing: border-box;
            background-color: #fff;
        }

            .cms-input:focus {
                border-color: #5d5fef;
                outline: none;
                box-shadow: 0 0 0 3px rgba(93, 95, 239, 0.1);
            }

        .cms-upload-box {
            padding: 15px;
            border: 2px dashed #cbd5e0;
            border-radius: 10px;
            background: #f8fafc;
            text-align: center;
        }

        .cms-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 15px;
            grid-column: span 2;
        }

        .cms-btn {
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            transition: 0.3s;
            border: none;
        }

        .cms-btn-primary {
            background: #5d5fef;
            color: white;
        }

        .cms-btn-secondary {
            background: #edf2f7;
            color: #4a5568;
        }

        /* GridView Table Styling */
        .cms-table-res {
            overflow-x: auto;
            width: 100%;
        }

        .cms-grid {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

            .cms-grid th {
                background: #f8fafc;
                color: #4a5568;
                padding: 12px 16px;
                text-align: left;
                font-size: 12px;
                text-transform: uppercase;
                border-bottom: 2px solid #e2e8f0;
            }

            .cms-grid td {
                padding: 12px 16px;
                border-bottom: 1px solid #edf2f7;
                font-size: 14px;
                color: #2d3748;
                vertical-align: middle;
            }

        .cms-badge-img {
            width: 55px;
            height: 38px;
            border-radius: 4px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
        }

        .cms-action-btn {
            text-decoration: none;
            padding: 6px 10px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 12px;
            display: inline-block;
        }

        .cms-edit {
            color: #5d5fef;
            background: #f0f2ff;
            margin-right: 5px;
        }

        .cms-delete {
            color: #e53e3e;
            background: #fff5f5;
        }

        /* Mobile Breakpoint */
        @media (max-width: 900px) {
            .cms-form-grid {
                grid-template-columns: 1fr;
            }

            .cms-actions {
                grid-column: span 1;
                flex-direction: column-reverse;
            }

            .cms-btn {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cms-main-wrapper">
        <div class="cms-form-container">
            <asp:HiddenField ID="hdnId" runat="server" />

            <!-- Header Section -->
            <div class="cms-header-section">
                <h2>Manage FAQs</h2>
                <p>Add or update frequently asked questions and their detailed answers.</p>
            </div>

            <!-- FAQ Form Card -->
            <div class="cms-card">
                <div class="cms-form-grid">

                    <!-- Left Column: Question -->
                    <div class="left-col">
                        <div class="cms-form-group">
                            <label>Question</label>
                            <asp:TextBox ID="txtQuestion" runat="server" CssClass="cms-input"
                                placeholder="Enter the frequency asked question" TextMode="SingleLine"></asp:TextBox>
                        </div>

                        <div class="cms-form-group" style="margin-top: 20px; color: #718096; font-size: 12px;">
                            <i class="fas fa-info-circle"></i>Tip: Keep questions concise and clear for better user understanding.
                        </div>
                    </div>

                    <!-- Right Column: Answer -->
                    <div class="right-col">
                        <div class="cms-form-group">
                            <label>Answer</label>
                            <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" Rows="5"
                                CssClass="cms-input" placeholder="Provide a detailed answer..."></asp:TextBox>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="cms-actions">
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="cms-btn cms-btn-secondary" OnClick="btnReset_Click" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Save FAQ" CssClass="cms-btn cms-btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>

            <!-- Data Table Section -->
            <div class="cms-header-section" style="margin-top: 40px;">
                <h2>Existing FAQs</h2>
            </div>

            <div class="cms-card">
                <div class="cms-table-res">
                    <asp:GridView ID="gvFaq" runat="server" OnRowCommand="gvFaq_RowCommand" AutoGenerateColumns="False" CssClass="cms-grid" DataKeyNames="id">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-Width="50px" />

                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
                                    <div style="font-weight: 600; color: #2d3748; max-width: 300px;">
                                        <%# Eval("question") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Answer">
                                <ItemTemplate>
                                    <div style="max-width: 400px; color: #4a5568; font-size: 13px; line-height: 1.4;">
                                        <%# Eval("answer") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit"
                                        runat="server"
                                        CssClass="cms-action-btn cms-edit"
                                        CommandName="EditRow"
                                        CommandArgument='<%# Eval("id") %>'
                                        CausesValidation="false">
    <i class="fas fa-edit"></i> Edit
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete"
                                        runat="server"
                                        CssClass="cms-action-btn cms-delete"
                                        CommandName="DeleteRow"
                                        CommandArgument='<%# Eval("id") %>'
                                        CausesValidation="false"
                                        OnClientClick="return confirm('Are you sure you want to delete this FAQ?');">
    <i class="fas fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

