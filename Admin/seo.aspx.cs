using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_seo: System.Web.UI.Page
{
    // CONNECTION STRING
    string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadKeywords();
        }
    }

    // LOAD GRIDVIEW
    private void LoadKeywords()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT * FROM seokeyword ORDER BY KeywordID DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvKeywords.DataSource = dt;
            gvKeywords.DataBind();
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
                cmd.CommandText = @"INSERT INTO seokeyword
                                    (KeywordName, IsActive, CreatedAt)
                                    VALUES
                                    (@KeywordName, @IsActive, GETDATE())";
            }

            // UPDATE
            else
            {
                cmd.CommandText = @"UPDATE seokeyword
                                    SET KeywordName=@KeywordName,
                                        IsActive=@IsActive,
                                        UpdatedAt=GETDATE()
                                    WHERE KeywordID=@KeywordID";

                cmd.Parameters.AddWithValue("@KeywordID", hfKeywordID.Value);
            }

            cmd.Parameters.AddWithValue("@KeywordName", txtKeywordName.Text.Trim());

            cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            // CLEAR FORM
            ClearForm();

            // RELOAD GRID
            LoadKeywords();
        }
    }

    // GRIDVIEW ACTIONS
    protected void gvKeywords_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        // EDIT
        if (e.CommandName == "EditRow")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM seokeyword WHERE KeywordID=@KeywordID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@KeywordID", id);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hfKeywordID.Value = dr["KeywordID"].ToString();

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
                string query = "DELETE FROM seokeyword WHERE KeywordID=@KeywordID";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@KeywordID", id);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadKeywords();
            }
        }
    }

    // CANCEL BUTTON
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    // CLEAR FORM
    private void ClearForm()
    {
        hfKeywordID.Value = "0";

        txtKeywordName.Text = "";

        chkIsActive.Checked = true;
    }
}