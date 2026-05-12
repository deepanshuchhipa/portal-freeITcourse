using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _csitmap : System.Web.UI.Page
{
    // CONNECTION STRING
    string cs =
        ConfigurationManager.ConnectionStrings["course"]
        .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // LOAD ALL KEYWORDS
            LoadKeywords();

            // SEO URL
            if (Page.RouteData.Values["keyword"] != null)
            {
                string keyword =
                    Page.RouteData.Values["keyword"]
                    .ToString()
                    .Replace("-", " ");

                // OPTIONAL TITLE
                Page.Title =
                    keyword + " | Free IT Learning";
            }
        }
    }

    // LOAD SEO KEYWORDS
    private void LoadKeywords()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT 
                    KeywordID,
                    CourseID,
                    KeywordName
                FROM seocourse
                WHERE IsActive = 1
                ORDER BY KeywordName ASC";

            SqlDataAdapter da =
                new SqlDataAdapter(query, con);

            DataTable dt =
                new DataTable();

            da.Fill(dt);

            rptKeywords.DataSource = dt;

            rptKeywords.DataBind();
        }
    }
}