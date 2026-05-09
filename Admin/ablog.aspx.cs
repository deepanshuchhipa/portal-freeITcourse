using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_ablog: System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["course"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBlogs();
        }
    }

    // 🔁 Bind Grid
    private void BindBlogs()
    {
        using (SqlConnection con = new SqlConnection(conString))
        {
            string query = "SELECT * FROM Blog WHERE IsDeleted = 0 ORDER BY BlogID DESC";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvBlogs.DataSource = dt;
            gvBlogs.DataBind();
        }
    }

    // 💾 SAVE / UPDATE BLOG
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
        string desc = txtDescription.Text.Trim();
        bool isPublished = chkPublished.Checked;

        string imagePath = "";

        // 📸 Image Upload
        if (fuImage.HasFile)
        {
            // Folder Path
            string folder = "~/Admin/uploads/blog/";

            // Extension
            string extension = Path.GetExtension(fuImage.FileName);

            // Create Folder if Not Exists
            if (!Directory.Exists(Server.MapPath(folder)))
            {
                Directory.CreateDirectory(Server.MapPath(folder));
            }

            // Get Next Number
            int nextNumber = 1;

            string[] files = Directory.GetFiles(Server.MapPath(folder));

            if (files.Length > 0)
            {
                int max = 0;

                foreach (string file in files)
                {
                    string name = Path.GetFileNameWithoutExtension(file);

                    int num;

                    if (int.TryParse(name, out num))
                    {
                        if (num > max)
                        {
                            max = num;
                        }
                    }
                }

                nextNumber = max + 1;
            }

            // Final File Name
            string fileName = nextNumber + extension;

            // Full Path
            string fullPath = Server.MapPath(folder + fileName);

            // Save Image
            fuImage.SaveAs(fullPath);

            // Save DB Path
            imagePath = folder + fileName;
        }
        using (SqlConnection con = new SqlConnection(conString))
        {
            con.Open();

            // 🟢 INSERT
            if (hfBlogID.Value == "0")
            {
                string query = @"INSERT INTO Blog 
                                (Title, Description, ImageUrl, IsPublished)
                                VALUES (@Title, @Desc, @Image, @Pub)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);
                cmd.Parameters.AddWithValue("@Image", imagePath);
                cmd.Parameters.AddWithValue("@Pub", isPublished);

                cmd.ExecuteNonQuery();
            }
            // 🟡 UPDATE
            else
            {
                string query = @"UPDATE Blog SET 
                                Title=@Title,
                                Description=@Desc,
                                ImageUrl = CASE 
                                    WHEN @Image = '' THEN ImageUrl 
                                    ELSE @Image END,
                                IsPublished=@Pub,
                                UpdatedDate=GETDATE()
                                WHERE BlogID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);
                cmd.Parameters.AddWithValue("@Image", imagePath);
                cmd.Parameters.AddWithValue("@Pub", isPublished);
                cmd.Parameters.AddWithValue("@ID", hfBlogID.Value);

                cmd.ExecuteNonQuery();
            }
        }

        ClearForm();
        BindBlogs();
    }

    // ✏️ EDIT + DELETE HANDLE
    protected void gvBlogs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // DETAILS
        if (e.CommandName == "ViewBlog")
        {
            int blogId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "SELECT * FROM Blog WHERE BlogID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ID", blogId);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    litTitle.Text = dr["Title"].ToString();

                    litDescription.Text =
                        dr["Description"].ToString();

                    previewImage.Src =
                        ResolveUrl(dr["ImageUrl"].ToString());

                    pnlPreview.Visible = true;
                }
            }
        }

        // EDIT
        else if (e.CommandName == "EditBlog")
        {
            int blogId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "SELECT * FROM Blog WHERE BlogID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ID", blogId);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfBlogID.Value = dr["BlogID"].ToString();

                    txtTitle.Text = dr["Title"].ToString();

                    txtDescription.Text =
                        dr["Description"].ToString();

                    chkPublished.Checked =
                        Convert.ToBoolean(dr["IsPublished"]);

                    if (dr["ImageUrl"] != DBNull.Value)
                    {
                        imgPrev.ImageUrl =
                            dr["ImageUrl"].ToString();

                        imgPrev.Visible = true;
                    }
                }
            }
        }

        // DELETE
        else if (e.CommandName == "DeleteBlog")
        {
            int blogId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query =
                    "DELETE FROM Blog WHERE BlogID=@ID";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ID", blogId);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            BindBlogs();
        }
    }    // 🧹 Clear Form
    private void ClearForm()
    {
        hfBlogID.Value = "0";
        txtTitle.Text = "";
        txtDescription.Text = "";
        chkPublished.Checked = true;
        imgPrev.Visible = false;
    }
    protected void btnClosePreview_Click(object sender, EventArgs e)
    {
        pnlPreview.Visible = false;
    }
}