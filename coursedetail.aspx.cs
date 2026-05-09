using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class _coursedetail : System.Web.UI.Page
{
    string strcon = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCourse();
        }
    }

    private void LoadCourse()
    {
        if (Request.QueryString["id"] != null)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string query = "SELECT * FROM course WHERE id=@id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    litFullDescription.Text = Server.HtmlDecode(dr["full_description"].ToString());
                }
            }
        }
    }
}