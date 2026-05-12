<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);

        // JQUERY
        System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition(
            "jquery",
            new System.Web.UI.ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.7.1.min.js",
                DebugPath = "~/Scripts/jquery-3.7.1.js",

                CdnPath = "https://code.jquery.com/jquery-3.7.1.min.js",
                CdnDebugPath = "https://code.jquery.com/jquery-3.7.1.js",

                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            }
        );
    }

    public static void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {
        // SEO COURSE URL
        routes.MapPageRoute(
            "CourseSEO",
            "course/{keyword}",
            "~/shome.aspx"
        );

        // XML SITEMAP
        routes.MapPageRoute(
            "SitemapXML",
            "sitemap.xml",
            "~/sitemap.aspx"
        );
        routes.MapPageRoute(
    "CourseDetailSEO",
    "course-detail/{keyword}",
    "~/coursedet.aspx"
);
    }

    void Application_Error(object sender, EventArgs e)
    {

    }

</script>