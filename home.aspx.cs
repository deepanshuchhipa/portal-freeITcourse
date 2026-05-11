using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;
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