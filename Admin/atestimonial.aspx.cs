using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_atestimonial : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTestimonials();
        }
    }

    // LOAD DATA
    private void LoadTestimonials()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM testimonial ORDER BY id DESC", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvTestimonials.DataSource = dt;
            gvTestimonials.DataBind();
        }
    }

    // INSERT + UPDATE
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            // UPDATE
            if (hdnId.Value != "")
            {
                string query = @"UPDATE testimonial
                                SET student_name=@student_name,
                                    feedback=@feedback
                                WHERE id=@id";

                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", hdnId.Value);
            }
            else
            {
                // INSERT
                string query = @"INSERT INTO testimonial
                                (student_name, feedback)
                                VALUES
                                (@student_name, @feedback)";

                cmd = new SqlCommand(query, con);
            }

            cmd.Parameters.AddWithValue("@student_name",
                txtStudentName.Text.Trim());

            cmd.Parameters.AddWithValue("@feedback",
                txtFeedback.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ClearForm();
        LoadTestimonials();

        btnSubmit.Text = "Save Testimonial";
    }

    // GRID COMMAND
    protected void gvTestimonials_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        // DELETE
        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM testimonial WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadTestimonials();
        }

        // EDIT
        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM testimonial WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtStudentName.Text = dr["student_name"].ToString();
                    txtFeedback.Text = dr["feedback"].ToString();

                    // STORE ID
                    hdnId.Value = dr["id"].ToString();

                    // BUTTON TEXT
                    btnSubmit.Text = "Update Testimonial";
                }

                con.Close();
            }
        }
    }

    // RESET
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();

        btnSubmit.Text = "Save Testimonial";
    }

    // CLEAR
    private void ClearForm()
    {
        txtStudentName.Text = "";
        txtFeedback.Text = "";
        hdnId.Value = "";
    }
}