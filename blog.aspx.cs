using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _blog : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBlog();
        }
    }
    private void LoadBlog()
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"SELECT * 
                             FROM Blog 
                             WHERE IsPublished = 1 
                             AND IsDeleted = 0
                             ORDER BY BlogID DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            rptBlog.DataSource = cmd.ExecuteReader();
            rptBlog.DataBind();
        }
    }
}