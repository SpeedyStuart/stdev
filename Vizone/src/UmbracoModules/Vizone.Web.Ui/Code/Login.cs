using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Security.Cryptography;

namespace Vizone.Web.Ui.Code
{
    public class Login : System.Web.UI.MasterPage
    {
        string passphrase = "Hammer time";

        public string EmailError = string.Empty;
        public string PasswordError = string.Empty;
        public bool IsLoggedIn = false;

        protected override void OnInit(EventArgs e)
        {
            Load += new EventHandler(Login_Load);
            base.OnInit(e);
        }

        void Login_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["_uath"]!=null)
            {
                if (verifyMd5Hash(passphrase + Request.UserHostAddress, Request.Cookies["_uath"].Value))
                {
                    WriteCookie(Request.Cookies["_uath"].Value);
                    IsLoggedIn = true;
                    return;
                }
            }

            if (Request["action"] == "login")
            {
                // Validate
                if (Request["username"] == null || Request["username"].Trim().Length == 0)
                    EmailError = BuildError("Please enter a Username");

                if (Request["password"] == null || Request["password"].Trim().Length == 0)
                    PasswordError = BuildError("Please enter a Password");

                if (EmailError == string.Empty && PasswordError == string.Empty)
                {
                    // Attempt Login
                    if (Request["username"] == "s" && Request["password"] == "p")
                    {
                        // Logged in - create cookie
                        string hash = getMd5Hash(passphrase + Request.UserHostAddress);
                        WriteCookie(hash);
                        
                        Response.Redirect(Request.Url.AbsolutePath, true);
                        return;
                    }
                }
            }
        }

        void WriteCookie(string hash)
        {
            HttpCookie cookie = new HttpCookie("_uath", hash);
            cookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(cookie);
        }

        string BuildError(string msg)
        {
            return string.Format("<span class=\"error\">{0}</span>", msg);
        }

        static string getMd5Hash(string input)
        {
            MD5 md5Hasher = MD5.Create();

            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sb.Append(data[i].ToString("x2"));
            }

            return sb.ToString();
        }

        // Verify a hash against a string.
        static bool verifyMd5Hash(string input, string hash)
        {
            string hashOfInput = getMd5Hash(input);

            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
                return true;
            else
                return false;
        }

    }
}
