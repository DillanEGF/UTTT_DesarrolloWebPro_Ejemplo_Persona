using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace UTTT.Ejemplo.Persona.Control.Ctrl
{
    public class Conexion
    {
        #region Variables
     
        #endregion

        #region Constructores
        public Conexion()
        {
        }       
        #endregion


        public SqlConnection sqlConnection()
        {
            try
            {
                SqlConnection conexion = new SqlConnection("workstation id=Persona.mssql.somee.com;packet size=4096;user id=DillanGom_SQLLogin_1;pwd=2fxa5qoqd3;data source=Persona.mssql.somee.com;persist security info=False;initial catalog=Persona;");
                return conexion;
            }
            catch (Exception _e)
            { 
            
            }
            return null;
        }
    }
}
