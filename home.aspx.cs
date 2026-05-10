using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class _home : System.Web.UI.Page
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
        }
    }

    // ================= SEARCH COURSES =================
    [WebMethod]
    public static List<string> GetCourses(string prefix)
    {
        List<string> courses = new List<string>();

        string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"SELECT TOP 10 course_name
                         FROM course
                         WHERE course_name LIKE '%' + @prefix + '%'
                         ORDER BY course_name";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@prefix", prefix);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                courses.Add(dr["course_name"].ToString());
            }
        }

        return courses;
    }

    // ================= LOAD BLOGS =================
    private void LoadBlogs()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"SELECT TOP 3 *
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
            string query =
                "SELECT TOP 6 * FROM testimonial ORDER BY id DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptTestimonials1.DataSource = dt;
            rptTestimonials1.DataBind();
        }
    }
}