using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

public partial class _shome : System.Web.UI.Page
{
    // CONNECTION STRING
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTestimonials();
            LoadFaq();
            LoadBlogs();
            LoadCourses();
        }
    }

    // ================= LOAD COURSES =================
    private void LoadCourses()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT id, course_name FROM course ORDER BY course_name ASC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            ddlCourse.DataSource = dt;

            ddlCourse.DataTextField = "course_name";

            ddlCourse.DataValueField = "id";

            ddlCourse.DataBind();

            ddlCourse.Items.Insert(
                0,
                new System.Web.UI.WebControls.ListItem("Select Course", "0")
            );
        }
    }

    // ================= SAVE ENQUIRY =================
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                INSERT INTO course_enquiry
                (
                    course_id,
                    student_name,
                    email,
                    enquiry_date,
                    address,
                    phone_number,
                    message
                )
                VALUES
                (
                    @course_id,
                    @student_name,
                    @email,
                    @enquiry_date,
                    @address,
                    @phone_number,
                    @message
                )";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@course_id", ddlCourse.SelectedValue);

            cmd.Parameters.AddWithValue("@student_name", txtName.Text.Trim());

            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());

            cmd.Parameters.AddWithValue("@enquiry_date", txtDate.Text.Trim());

            cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());

            cmd.Parameters.AddWithValue("@phone_number", txtPhone.Text.Trim());

            cmd.Parameters.AddWithValue("@message", txtMessage.Text.Trim());

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            // CLEAR FORM
            txtName.Text = "";
            txtEmail.Text = "";
            txtDate.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
            txtMessage.Text = "";

            ddlCourse.SelectedIndex = 0;
        }
    }

    // ================= LOAD BLOGS =================
    private void LoadBlogs()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT TOP 3 *
                FROM Blog
                WHERE IsDeleted = 0
                AND IsPublished = 1
                ORDER BY CreatedDate ASC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptBlog.DataSource = dt;

            rptBlog.DataBind();
        }
    }

    // ================= LOAD FAQ =================
    private void LoadFaq()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT TOP 5 * FROM faq ORDER BY id DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptFaq.DataSource = dt;

            rptFaq.DataBind();
        }
    }

    // ================= LOAD TESTIMONIALS =================
    private void LoadTestimonials()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT TOP 6 * FROM testimonial ORDER BY id DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptTestimonials1.DataSource = dt;

            rptTestimonials1.DataBind();
        }
    }
}