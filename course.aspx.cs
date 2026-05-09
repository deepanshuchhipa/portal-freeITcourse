using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _course : System.Web.UI.Page
{
    string strcon = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCourses();
        }
    }

    private void LoadCourses()
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            string query = "SELECT * FROM course ORDER BY id DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            rptCourses.DataSource = dt;

            rptCourses.DataBind();
        }
    }
}