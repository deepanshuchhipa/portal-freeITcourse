using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_acourse : System.Web.UI.Page
{
    // Connection string
    string strcon = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    // SAVE / UPDATE
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imagePath = hfExistingImage.Value;

        // ================= IMAGE UPLOAD =================
        if (fuCourseImage.HasFile)
        {
            string folder = "~/Admin/uploads/course/";

            // Create folder if not exists
            if (!Directory.Exists(Server.MapPath(folder)))
            {
                Directory.CreateDirectory(Server.MapPath(folder));
            }

            // File extension
            string extension = Path.GetExtension(fuCourseImage.FileName);

            // Auto increment image name
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

            // Final image name
            string fileName = nextNumber + extension;

            // Full path
            string fullPath = Server.MapPath(folder + fileName);

            // Save image
            fuCourseImage.SaveAs(fullPath);

            // Store path in DB
            imagePath = folder + fileName;
        }

        // ================= INSERT / UPDATE =================
        using (SqlConnection con = new SqlConnection(strcon))
        {
            string query = "";

            // INSERT
            if (ViewState["id"] == null)
            {
                query = @"INSERT INTO course
                          (
                            course_name,
                            title,
                            short_description,
                            full_description,
                            course_image,
                            updated_date,
                            created_date
                          )
                          VALUES
                          (
                            @cn,
                            @title,
                            @sd,
                            @fd,
                            @img,
                            GETDATE(),
                            GETDATE()
                          )";
            }

            // UPDATE
            else
            {
                query = @"UPDATE course
                          SET
                            course_name = @cn,
                            title = @title,
                            short_description = @sd,
                            full_description = @fd,
                            course_image = @img,
                            updated_date = GETDATE()
                          WHERE id = @id";
            }

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@cn", txtCourseName.Text.Trim());
            cmd.Parameters.AddWithValue("@title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@sd", txtShortDesc.Text.Trim());
            cmd.Parameters.AddWithValue("@fd", txtFullDesc.Text.Trim());
            cmd.Parameters.AddWithValue("@img", imagePath);

            // Add ID only in update
            if (ViewState["id"] != null)
            {
                cmd.Parameters.AddWithValue("@id", ViewState["id"]);
            }

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            // Success Message
            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "showalert",
                "alert('Data Saved Successfully!');",
                true
            );

            // Reset Form
            ResetForm();

            // Reload Grid
            BindGrid();
        }
    }

    // BIND GRID
    private void BindGrid()
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            SqlDataAdapter sda = new SqlDataAdapter(
                "SELECT * FROM course ORDER BY id DESC",
                con
            );

            DataTable dt = new DataTable();

            sda.Fill(dt);

            gvCourses.DataSource = dt;
            gvCourses.DataBind();
        }
    }

    // GRIDVIEW COMMANDS
    protected void gvCourses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        // ================= EDIT =================
        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM course WHERE id=@id",
                    con
                );

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCourseName.Text = dr["course_name"].ToString();
                    txtTitle.Text = dr["title"].ToString();
                    txtShortDesc.Text = dr["short_description"].ToString();
                    txtFullDesc.Text = dr["full_description"].ToString();

                    hfExistingImage.Value = dr["course_image"].ToString();

                    // Store ID in ViewState
                    ViewState["id"] = id;

                    // Button text change
                    btnSave.Text = "Update Course";
                }

                con.Close();
            }
        }

        // ================= DELETE =================
        else if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM course WHERE id=@id",
                    con
                );

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindGrid();
            }
        }
    }

    // RESET BUTTON
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ResetForm();
    }

    // RESET FORM
    private void ResetForm()
    {
        txtCourseName.Text = "";
        txtTitle.Text = "";
        txtShortDesc.Text = "";
        txtFullDesc.Text = "";

        hfExistingImage.Value = "";

        ViewState["id"] = null;

        btnSave.Text = "Save Course";
    }
}