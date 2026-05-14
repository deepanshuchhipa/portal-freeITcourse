using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

public partial class _blog : System.Web.UI.Page
{
    // CONNECTION STRING
    string cs =
        ConfigurationManager
        .ConnectionStrings["course"]
        .ConnectionString;

    // PAGE SIZE
    int pageSize = 6;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int currentPage = 1;

            // GET CURRENT PAGE
            if (Request.QueryString["page"] != null)
            {
                currentPage =
                    Convert.ToInt32(
                        Request.QueryString["page"]);
            }

            LoadBlog(currentPage);
        }
    }

    // LOAD BLOG
    private void LoadBlog(int page)
    {
        using (SqlConnection con =
            new SqlConnection(cs))
        {
            con.Open();

            // TOTAL RECORDS
            string countQuery =
                @"SELECT COUNT(*)
                  FROM Blog
                  WHERE IsPublished = 1
                  AND IsDeleted = 0";

            SqlCommand countCmd =
                new SqlCommand(countQuery, con);

            int totalRecords =
                (int)countCmd.ExecuteScalar();

            int totalPages =
                (int)Math.Ceiling(
                    (double)totalRecords / pageSize);

            // BLOG QUERY WITH PAGINATION
            string query =
                @"SELECT *
                  FROM Blog
                  WHERE IsPublished = 1
                  AND IsDeleted = 0
                  ORDER BY BlogID DESC
                  OFFSET @Offset ROWS
                  FETCH NEXT @PageSize ROWS ONLY";

            SqlCommand cmd =
                new SqlCommand(query, con);

            cmd.Parameters.AddWithValue(
                "@Offset",
                (page - 1) * pageSize);

            cmd.Parameters.AddWithValue(
                "@PageSize",
                pageSize);

            rptBlog.DataSource =
                cmd.ExecuteReader();

            rptBlog.DataBind();

            // PAGINATION
            GeneratePagination(
                currentPage: page,
                totalPages: totalPages);
        }
    }

    // GENERATE PAGINATION
    private void GeneratePagination(
        int currentPage,
        int totalPages)
    {
        StringBuilder sb =
            new StringBuilder();

        // PREVIOUS BUTTON
        if (currentPage > 1)
        {
            sb.Append(
            "<li>" +
                "<a href='blog.aspx?page=" + (currentPage - 1) + "'>" +
                    "<i class='fa-solid fa-angle-left'></i>" +
                "</a>" +
            "</li>");
        }

        // PAGE NUMBERS
        for (int i = 1; i <= totalPages; i++)
        {
            if (i == currentPage)
            {
                sb.Append(
                "<li class='active'>" +
                    "<a href='blog.aspx?page=" + i + "'>" +
                        i +
                    "</a>" +
                "</li>");
            }
            else
            {
                sb.Append(
                "<li>" +
                    "<a href='blog.aspx?page=" + i + "'>" +
                        i +
                    "</a>" +
                "</li>");
            }
        }

        // NEXT BUTTON
        if (currentPage < totalPages)
        {
            sb.Append(
            "<li>" +
                "<a href='blog.aspx?page=" + (currentPage + 1) + "'>" +
                    "<i class='fa-solid fa-angle-right'></i>" +
                "</a>" +
            "</li>");
        }

        // SET HTML
        litPagination.Text =
            sb.ToString();
    }
}