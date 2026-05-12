using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_cseo : System.Web.UI.Page
{
    // CONNECTION STRING
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCourses();
            LoadSeoKeywords();
        }
    }

    // LOAD COURSES DROPDOWN
    private void LoadCourses()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT id, course_name FROM course ORDER BY course_name ASC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            ddlCourses.DataSource = dt;

            ddlCourses.DataTextField = "course_name";

            ddlCourses.DataValueField = "id";

            ddlCourses.DataBind();

            ddlCourses.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Course --", "0"));
        }
    }

    // LOAD GRIDVIEW
    private void LoadSeoKeywords()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT 
                    sk.KeywordID,
                    sk.CourseID,
                    c.course_name AS CourseName,
                    sk.KeywordName,
                    sk.IsActive,
                    sk.CreatedAt,
                    sk.UpdatedAt
                FROM seocourse sk
                INNER JOIN course c ON sk.CourseID = c.id
                ORDER BY sk.KeywordID DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvSeoKeywords.DataSource = dt;

            gvSeoKeywords.DataBind();
        }
    }

    // SAVE / UPDATE
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.Connection = con;

            // INSERT
            if (hfKeywordID.Value == "0")
            {
                cmd.CommandText = @"
                    INSERT INTO seocourse
                    (
                        CourseID,
                        KeywordName,
                        IsActive,
                        CreatedAt,
                        UpdatedAt
                    )
                    VALUES
                    (
                        @CourseID,
                        @KeywordName,
                        @IsActive,
                        GETDATE(),
                        GETDATE()
                    )";
            }

            // UPDATE
            else
            {
                cmd.CommandText = @"
                    UPDATE seocourse
                    SET
                        CourseID=@CourseID,
                        KeywordName=@KeywordName,
                        IsActive=@IsActive,
                        UpdatedAt=GETDATE()
                    WHERE KeywordID=@KeywordID";

                cmd.Parameters.AddWithValue("@KeywordID", hfKeywordID.Value);
            }

            cmd.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);

            cmd.Parameters.AddWithValue("@KeywordName", txtKeywordName.Text.Trim());

            cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            ClearForm();

            LoadSeoKeywords();
        }
    }

    // GRIDVIEW ACTIONS
    protected void gvSeoKeywords_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        // EDIT
        if (e.CommandName == "EditRow")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM seocourse WHERE KeywordID=@KeywordID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@KeywordID", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfKeywordID.Value = dr["KeywordID"].ToString();

                    ddlCourses.SelectedValue = dr["CourseID"].ToString();

                    txtKeywordName.Text = dr["KeywordName"].ToString();

                    chkIsActive.Checked = Convert.ToBoolean(dr["IsActive"]);
                }

                con.Close();
            }
        }

        // DELETE
        else if (e.CommandName == "DeleteRow")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM seocourse WHERE KeywordID=@KeywordID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@KeywordID", id);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadSeoKeywords();
            }
        }
    }

    // RESET FORM
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    // CLEAR FORM
    private void ClearForm()
    {
        hfKeywordID.Value = "0";

        ddlCourses.SelectedIndex = 0;

        txtKeywordName.Text = "";

        chkIsActive.Checked = true;
    }
}