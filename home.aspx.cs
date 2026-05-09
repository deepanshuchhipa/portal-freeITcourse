using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _home : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTestimonials();
            LoadFaq();
        }
    }
    private void LoadFaq()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT top 5 * FROM faq ORDER BY id DESC", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptFaq.DataSource = dt;
            rptFaq.DataBind();
        }
    }

    // LOAD TESTIMONIALS
    private void LoadTestimonials()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            // FIRST SLIDER
            SqlDataAdapter da1 = new SqlDataAdapter(
                "SELECT TOP 6 * FROM testimonial ORDER BY id DESC", con);

            DataTable dt1 = new DataTable();

            da1.Fill(dt1);

            rptTestimonials1.DataSource = dt1;
            rptTestimonials1.DataBind();


        }
    }
}