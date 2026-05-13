using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class _coursedet : System.Web.UI.Page
{
    string strcon =
        ConfigurationManager
        .ConnectionStrings["course"]
        .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // SET COURSE ID
            if (Request.QueryString["id"] != null)
            {
                hfCourseID.Value =
                    Request.QueryString["id"];
            }

            // LOAD COURSE DETAILS
            LoadCourse();
        }
    }
    protected void btnSideSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con =
            new SqlConnection(strcon))
        {
            string query = @"
                INSERT INTO course_enquiry
                (
                    course_id,
                    student_name,
                    email,
                    phone_number,
                    created_at
                )
                VALUES
                (
                    @course_id,
                    @student_name,
                    @email,
                    @phone_number,
                    GETDATE()
                )";

            SqlCommand cmd =
                new SqlCommand(query, con);

            cmd.Parameters.AddWithValue(
                "@course_id",
                hfCourseID.Value
            );

            cmd.Parameters.AddWithValue(
                "@student_name",
                txtSideName.Text.Trim()
            );

            cmd.Parameters.AddWithValue(
                "@email",
                txtSideEmail.Text.Trim()
            );

            cmd.Parameters.AddWithValue(
                "@phone_number",
                txtSidePhone.Text.Trim()
            );

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            // SUCCESS MESSAGE
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                "alert('Enquiry submitted successfully');",
                true
            );

            // CLEAR FORM
            txtSideName.Text = "";

            txtSideEmail.Text = "";

            txtSidePhone.Text = "";
        }
    }

    private void LoadCourse()
    {
        // SEO ROUTE
        if (Page.RouteData.Values["keyword"] != null)
        {
            string keyword =
                Page.RouteData.Values["keyword"]
                .ToString()
                .Replace("-", " ")
                .ToLower();

            using (SqlConnection con =
                new SqlConnection(strcon))
            {
                string query = @"

                    SELECT c.*
                    FROM seocourse s
                    INNER JOIN course c
                        ON s.CourseID = c.id
                    WHERE LOWER(s.KeywordName) = @KeywordName
                    AND s.IsActive = 1

                ";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@KeywordName",
                    keyword);

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    // PAGE TITLE
                    Page.Title =
                        dr["course_name"].ToString() +
                        " | Free IT Learning";

                    // DESCRIPTION
                    litFullDescription.Text =
                        Server.HtmlDecode(
                            dr["full_description"]
                            .ToString()
                        );
                }
            }
        }

        // OLD URL SUPPORT
        else if (Request.QueryString["id"] != null)
        {
            using (SqlConnection con =
                new SqlConnection(strcon))
            {
                string query =
                    "SELECT * FROM course WHERE id=@id";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@id",
                    Request.QueryString["id"]);

                con.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    Page.Title =
                        dr["course_name"].ToString() +
                        " | Free IT Learning";

                    litFullDescription.Text =
                        Server.HtmlDecode(
                            dr["full_description"]
                            .ToString()
                        );
                }
            }
        }
    }
}