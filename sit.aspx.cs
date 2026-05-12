using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Xml;

public partial class _sit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string baseUrl = "https://freeitlearning.com";

        XmlDocument doc = new XmlDocument();

        string ns = "http://www.sitemaps.org/schemas/sitemap/0.9";

        // ROOT
        XmlElement urlset = doc.CreateElement("urlset", ns);
        doc.AppendChild(urlset);

        // CONNECTION STRING
        string cs = ConfigurationManager.ConnectionStrings["course"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT KeywordName
                FROM seokeyword
                WHERE IsActive = 1
            ", con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                // SEO URL
                string keyword = dr["KeywordName"].ToString()
                                    .Trim()
                                    .Replace(" ", "-")
                                    .ToLower();

                string fullUrl = baseUrl + "/course/" + keyword;

                // <url>
                XmlElement url = doc.CreateElement("url", ns);

                // <loc>
                XmlElement loc = doc.CreateElement("loc", ns);
                loc.InnerText = fullUrl;

                // ADD loc TO url
                url.AppendChild(loc);

                // OPTIONAL lastmod
                XmlElement lastmod = doc.CreateElement("lastmod", ns);
                lastmod.InnerText = DateTime.Now.ToString("yyyy-MM-dd");

                url.AppendChild(lastmod);

                // ADD TO ROOT
                urlset.AppendChild(url);
            }
        }

        // FORMAT XML
        StringBuilder sb = new StringBuilder();

        XmlWriterSettings settings = new XmlWriterSettings
        {
            Indent = true,
            IndentChars = "  ",
            NewLineChars = "\n",
            NewLineHandling = NewLineHandling.Replace
        };

        using (XmlWriter writer = XmlWriter.Create(sb, settings))
        {
            doc.Save(writer);
        }

        // OUTPUT XML
        Response.Clear();
        Response.ContentType = "text/xml";

        Response.Write(sb.ToString());

        Response.End();
    }
}