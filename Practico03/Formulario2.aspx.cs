using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;  
public partial class Formulario2 : System.Web.UI.Page
{
    private string username;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Suponiendo que el nombre de usuario está almacenado en la sesión
        username = Session["Username"] as string;
        if (string.IsNullOrEmpty(username))
        {
          // en caso de q no haya un usuario en sesion
            LabelMessage.Text = "Error: no se encontró el nombre de usuario en la sesión.";
            LabelMessage.Visible = true;
            FileUpload1.Enabled = false;
            ButtonUpload.Enabled = false;
            return;   
        }
        else
        {
            FileUpload1.Enabled = true;   // esto lo pongo porque sino queda medio feo deja cargar igual sin session
            ButtonUpload.Enabled = true; 

        }
        LabelUsuario.Text = "Usuario En Sesion: "+ username;
        string userDir = Server.MapPath($"./{username}");

        // Verificar si el directorio del usuario existe, si no, crearlo
        if (!Directory.Exists(userDir))
        {
            Directory.CreateDirectory(userDir);
        }

        if (!IsPostBack)
        {
            LoadFiles();
        }
    }

    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string userDir = Server.MapPath($"./{username}");
                string filePath = Path.Combine(userDir, FileUpload1.FileName);

                // Guardar el archivo
                FileUpload1.SaveAs(filePath);

                // Actualizar el GridView
                LoadFiles();

                LabelMessage.Text = "Archivo cargado exitosamente.";
                LabelMessage.ForeColor = System.Drawing.Color.Green;
                LabelMessage.Visible = true;
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "Error al cargar el archivo: " + ex.Message;
                LabelMessage.Visible = true;
            }
        }
        else
        {
            LabelMessage.Text = "Por favor, seleccione un archivo para cargar.";
            LabelMessage.Visible = true;
        }
    }

    protected void GridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DownloadFile")
        {
            string filePath = e.CommandArgument.ToString();

            if (File.Exists(filePath))
            {
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", $"attachment; filename={Path.GetFileName(filePath)}");
                Response.WriteFile(filePath);
                Response.End();
            }
            else
            {
                LabelMessage.Text = "El archivo no existe.";
                LabelMessage.Visible = true;
            }
        }
    }

    private void LoadFiles()
    {
        string userDir = Server.MapPath($"./{username}");

        // Obtener la lista de archivos en el directorio del usuario
        List<FileInfo> files = new DirectoryInfo(userDir).GetFiles().ToList();

        // Crear una lista de objetos anónimos para enlazar con el GridView
        var fileList = files.Select(file => new
        {
            FileName = file.Name,
            FilePath = file.FullName
        }).ToList();

        GridViewFiles.DataSource = fileList;
        GridViewFiles.DataBind();
    }

    protected void GridViewFiles_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
