<%@ WebHandler Language="C#" Class="CourseSuggestion" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public class CourseSuggestion : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";

        string prefix = context.Request["term"];

        StringBuilder json = new StringBuilder();

        json.Append("[");

        string cs =
            ConfigurationManager.ConnectionStrings["course"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT TOP 10 id, course_name
                FROM course
                WHERE course_name LIKE '%' + @prefix + '%'
                ORDER BY course_name";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@prefix", prefix);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            bool first = true;

            while (dr.Read())
            {
                if (!first)
                    json.Append(",");

                json.Append("{");

                json.Append("\"id\":\"" +
                    dr["id"].ToString() + "\",");

                json.Append("\"course_name\":\"" +
                    dr["course_name"].ToString() + "\"");

                json.Append("}");

                first = false;
            }
        }

        json.Append("]");

        context.Response.Write(json.ToString());
    }

    public bool IsReusable
    {
        get { return false; }
    }
}