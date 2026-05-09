using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_afaq : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFaq();
        }
    }

    // LOAD FAQ
    private void LoadFaq()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT * FROM faq ORDER BY id DESC", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvFaq.DataSource = dt;
            gvFaq.DataBind();
        }
    }

    // SAVE + UPDATE
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd;

            // UPDATE
            if (hdnId.Value != "")
            {
                string query = @"UPDATE faq
                                SET question=@question,
                                    answer=@answer
                                WHERE id=@id";

                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@id", hdnId.Value);
            }
            else
            {
                // INSERT
                string query = @"INSERT INTO faq
                                (question, answer)
                                VALUES
                                (@question, @answer)";

                cmd = new SqlCommand(query, con);
            }

            cmd.Parameters.AddWithValue("@question",
                txtQuestion.Text.Trim());

            cmd.Parameters.AddWithValue("@answer",
                txtAnswer.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ClearForm();
        LoadFaq();

        btnSubmit.Text = "Save FAQ";
    }

    // GRIDVIEW COMMAND
    protected void gvFaq_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        // DELETE
        if (e.CommandName == "DeleteRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM faq WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadFaq();
        }

        // EDIT
        if (e.CommandName == "EditRow")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM faq WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtQuestion.Text = dr["question"].ToString();
                    txtAnswer.Text = dr["answer"].ToString();

                    hdnId.Value = dr["id"].ToString();

                    btnSubmit.Text = "Update FAQ";
                }

                con.Close();
            }
        }
    }

    // RESET
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearForm();

        btnSubmit.Text = "Save FAQ";
    }

    // CLEAR
    private void ClearForm()
    {
        txtQuestion.Text = "";
        txtAnswer.Text = "";
        hdnId.Value = "";
    }
}