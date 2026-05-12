using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _sitmap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSitemap();
        }
    }

    private void BindSitemap()
    {
        // Connection string aapke web.config se aayegi
        string constr = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            // Sirf Active keywords uthane ke liye query
            string query = "SELECT KeywordName FROM seokeyword WHERE IsActive = 1 ORDER BY KeywordName ASC";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    // Repeater ko data dena
                    rptSitemap.DataSource = dt;
                    rptSitemap.DataBind();
                }
            }
        }
    }
}