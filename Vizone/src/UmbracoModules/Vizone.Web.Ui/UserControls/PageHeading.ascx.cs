using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Vizone.Web.Ui.UserControls
{
    public partial class PageHeading : System.Web.UI.UserControl
    {
        public string HeadingText { get; set; }
        public string PageTitle { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected string GetHeading()
        {
            if (HeadingText != null && PageTitle != null)
            {
                if (HeadingText.ToLower().Contains(PageTitle.ToLower()))
                {
                    int s = HeadingText.ToLower().IndexOf(PageTitle.ToLower());
                    int l = PageTitle.Length;

                    return string.Format("{0}<span class=\"h1lime\">{1}</span>{2}",
                        HeadingText.Substring(0, s),
                        HeadingText.Substring(s, l),
                        HeadingText.Substring(s + l));
                }
                else
                {
                    // Just format the first word
                    int s = 0;
                    int l = HeadingText.ToLower().IndexOf(" ");

                    return string.Format("{0}<span class=\"h1lime\">{1}</span>{2}",
                        HeadingText.Substring(0, s),
                        HeadingText.Substring(s, l),
                        HeadingText.Substring(s + l));
                }
            }

            return string.Empty;
        }
    }
}