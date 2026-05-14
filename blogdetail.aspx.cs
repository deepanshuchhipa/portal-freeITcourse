using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _blogdetail : System.Web.UI.Page
{
    string cs = ConfigurationManager
        .ConnectionStrings["course"]
        .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBlog();
        }
    }

    private void LoadBlog()
    {
        // URL Example:
        // blog-single.aspx?id=1

        if (Request.QueryString["id"] != null)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT *
                                 FROM Blog
                                 WHERE BlogID = @BlogID
                                 AND IsPublished = 1
                                 AND IsDeleted = 0";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@BlogID", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // BLOG TITLE
                    string blogTitle =
                        dt.Rows[0]["Title"].ToString();

                    // PAGE TITLE
                    Page.Title =
                        blogTitle + " | SkillStack IT";

                    // TITLE
                    lblTitle.Text = blogTitle;

                    // DESCRIPTION
                    blogDesc.InnerHtml =
                        Server.HtmlDecode(
                            dt.Rows[0]["Description"].ToString()
                        );

                    // IMAGE
                    imgBlog.ImageUrl =
                        ResolveUrl(
                            dt.Rows[0]["ImageUrl"].ToString()
                        );

                    // DATE
                    lblDate.Text =
                        Convert.ToDateTime(
                            dt.Rows[0]["CreatedDate"]
                        ).ToString("MMMM dd, yyyy");
                }
            }
        }
    }
}