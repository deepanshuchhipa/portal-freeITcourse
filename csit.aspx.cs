using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Xml;

public partial class _csit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string baseUrl = "https://freeitlearning.com";

        XmlDocument doc = new XmlDocument();

        string ns =
            "http://www.sitemaps.org/schemas/sitemap/0.9";

        // ROOT
        XmlElement urlset =
            doc.CreateElement("urlset", ns);

        doc.AppendChild(urlset);

        // CONNECTION STRING
        string cs =
            ConfigurationManager
            .ConnectionStrings["course"]
            .ConnectionString;

        using (SqlConnection con =
            new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"

                SELECT KeywordName
                FROM seocourse
                WHERE IsActive = 1

            ", con);

            con.Open();

            SqlDataReader dr =
                cmd.ExecuteReader();

            while (dr.Read())
            {
                // SEO KEYWORD
                string keyword =
                    dr["KeywordName"]
                    .ToString()
                    .Trim()
                    .ToLower();

                // CLEAN URL
                keyword =
                    keyword.Replace(" ", "-");

                // FULL URL
                string fullUrl =
                    baseUrl +
                    "/course-detail/" +
                    keyword;

                // <url>
                XmlElement url =
                    doc.CreateElement("url", ns);

                // <loc>
                XmlElement loc =
                    doc.CreateElement("loc", ns);

                loc.InnerText = fullUrl;

                url.AppendChild(loc);

                // <lastmod>
                XmlElement lastmod =
                    doc.CreateElement("lastmod", ns);

                lastmod.InnerText =
                    DateTime.Now.ToString("yyyy-MM-dd");

                url.AppendChild(lastmod);

                // ADD URL
                urlset.AppendChild(url);
            }

            dr.Close();
        }

        // FORMAT XML
        StringBuilder sb =
            new StringBuilder();

        XmlWriterSettings settings =
            new XmlWriterSettings
            {
                Indent = true,
                IndentChars = "  ",
                NewLineChars = "\n",
                NewLineHandling =
                    NewLineHandling.Replace
            };

        using (XmlWriter writer =
            XmlWriter.Create(sb, settings))
        {
            doc.Save(writer);
        }

        // DOWNLOAD XML FILE
        Response.Clear();
        Response.Buffer = true;

        Response.ContentType = "application/xml";

        // DOWNLOAD FILE NAME
        Response.AddHeader(
            "content-disposition",
            "attachment;filename=course-sitemap.xml"
        );

        Response.Charset = "";

        // WRITE XML
        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();
    }
}