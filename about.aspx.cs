using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _about : System.Web.UI.Page
{
    string strcon =
        ConfigurationManager
        .ConnectionStrings["course"]
        .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTestimonial();
        }
    }

    private void LoadTestimonial()
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM testimonial",
                con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptTestimonial.DataSource = dt;

            rptTestimonial.DataBind();
        }
    }
}