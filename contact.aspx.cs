using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class _contact : System.Web.UI.Page
{
    // CONNECTION STRING
    string strcon =
        ConfigurationManager
        .ConnectionStrings["course"]
        .ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // =========================
    // SAVE CONTACT ENQUIRY
    // =========================
    protected void btnContactSubmit_Click(object sender, EventArgs e)
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
                    message,
                    created_at
                )
                VALUES
                (
                    @course_id,
                    @student_name,
                    @email,
                    @phone_number,
                    @message,
                    GETDATE()
                )";

            SqlCommand cmd =
                new SqlCommand(query, con);

            // FIXED COURSE ID
            cmd.Parameters.AddWithValue(
                "@course_id",
                1
            );

            cmd.Parameters.AddWithValue(
                "@student_name",
                txtContactName.Text.Trim()
            );

            cmd.Parameters.AddWithValue(
                "@email",
                txtContactEmail.Text.Trim()
            );

            cmd.Parameters.AddWithValue(
                "@phone_number",
                txtContactPhone.Text.Trim()
            );

            cmd.Parameters.AddWithValue(
                "@message",
                txtContactMessage.Text.Trim()
            );

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            // SUCCESS ALERT
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                "alert('Message submitted successfully');",
                true
            );

            // CLEAR FORM
            txtContactName.Text = "";

            txtContactEmail.Text = "";

            txtContactPhone.Text = "";

            txtContactMessage.Text = "";
        }
    }
}