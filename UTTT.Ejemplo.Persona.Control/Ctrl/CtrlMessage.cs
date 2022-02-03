using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace UTTT.Ejemplo.Persona.Control.Ctrl
{
    public static class CtrlMessage
    {
        public static void showMessage(this System.Web.UI.Page _page, String _message)
        {
            _page.ClientScript.RegisterStartupScript(_page.GetType(),
                   Guid.NewGuid().ToString(),
                   "alert( '" + _message + "');", true);

            //_page.ClientScript.RegisterClientScriptBlock(_page.GetType(), "ClientScript", "<script type='text/javascript'> $(function(){ $('#dlgResultado').dialog({ modal: true, resizable: false, autoOpen: true, draggable: false, open: function(type, data){$(this).parent().appendTo('form')} }); }); </script>");

        }

        public static void showMessageException(this System.Web.UI.Page _page, String _message)
        {
            String mensaje = "Error de tipo " + _message + ". Ponerse en contacto con su administrador de sistema";
            _page.ClientScript.RegisterStartupScript(_page.GetType(),
                   "ClientScript",
                   "<SCRIPT>alert( '" + mensaje + "');</SCRIPT>");
            //enviarCorreo(mensaje);
        }

        public static void enviarCorreo(String mensaje)
        {
            String body = 
                "<body>  " +
                "<h1>Mensaje Importante</h1" +
                "Se ha producido una excepcion en la ejecución de la aplicación" +
                "<br></br>" +
                mensaje +
                "</body>";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("esaindg@gmail.com", "dillanshippuden");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("esaindg@gmail.com","Correo de prueba");
            mail.To.Add(new MailAddress("eisan34@gmail.com"));
            mail.Subject = "Mensaje de aviso, se ha producido una excepcion en la aplicacion";
            mail.IsBodyHtml = true;
            mail.Body = body;

            smtp.Send(mail);

        }


    }
}
