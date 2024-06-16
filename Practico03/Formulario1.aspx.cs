using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Formulario1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Crear la cookie con la contraseña
            HttpCookie cookie = new HttpCookie("Contraseña", TextBoxPassword.Text);
            cookie.Expires = DateTime.Now.AddDays(1); // para q la cookie expire en un dia 
            Response.Cookies.Add(cookie);

            // Crear la sesión con el nombre de usuario
            Session["Username"] = TextBoxUsername.Text;

            Label6.Text = "Usuario en sesión: " + Session["Username"].ToString();
            Label6.Visible = true;
        }
    }
}
