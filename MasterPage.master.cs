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
        string page = System.IO.Path.GetFileName(Request.Path).ToLower();

        // sabka active remove
        navHome.Attributes["class"] = "nav-item";
        navAbout.Attributes["class"] = "nav-item";
        navCourse.Attributes["class"] = "nav-item";
        navBlog.Attributes["class"] = "nav-item";
        navContact.Attributes["class"] = "nav-item";

        // current page pe active lagao
        switch (page)
        {
            case "home.aspx":
                navHome.Attributes["class"] += " active";
                break;

            case "about.aspx":
                navAbout.Attributes["class"] += " active";
                break;

            case "course.aspx":
                navCourse.Attributes["class"] += " active";
                break;

            case "blog.aspx":
            case "blogdetail.aspx": // blog detail bhi blog me count hoga
                navBlog.Attributes["class"] += " active";
                break;

            case "contact.aspx":
                navContact.Attributes["class"] += " active";
                break;
        }
    }
}
