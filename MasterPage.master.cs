using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string page =
            System.IO.Path
            .GetFileName(Request.Path)
            .ToLower();

        // REMOVE ACTIVE CLASS FROM NAVBAR
        navHome.Attributes["class"] = "nav-item";
        navAbout.Attributes["class"] = "nav-item";
        navCourse.Attributes["class"] = "nav-item";
        navBlog.Attributes["class"] = "nav-item";
        navContact.Attributes["class"] = "nav-item";

        // REMOVE ACTIVE CLASS FROM SIDEBAR
        sideHome.Attributes["class"] = "sidebar-link";
        sideAbout.Attributes["class"] = "sidebar-link";
        sideCourse.Attributes["class"] = "sidebar-link";
        sideBlog.Attributes["class"] = "sidebar-link";
        sideContact.Attributes["class"] = "sidebar-link";

        // CURRENT PAGE ACTIVE
        switch (page)
        {
            case "home.aspx":

                navHome.Attributes["class"] += " active";
                sideHome.Attributes["class"] += " active";

                break;

            case "about.aspx":

                navAbout.Attributes["class"] += " active";
                sideAbout.Attributes["class"] += " active";

                break;

            case "course.aspx":
            case "coursedetail.aspx":

                navCourse.Attributes["class"] += " active";
                sideCourse.Attributes["class"] += " active";

                break;

            case "blog.aspx":
            case "blogdetail.aspx":

                navBlog.Attributes["class"] += " active";
                sideBlog.Attributes["class"] += " active";

                break;

            case "contact.aspx":

                navContact.Attributes["class"] += " active";
                sideContact.Attributes["class"] += " active";

                break;
        }
    }
}