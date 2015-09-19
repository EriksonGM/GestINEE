using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace GestINEE
{
    public static class Usuario
    {
        /// <summary>
        /// Estado do Usuario
        /// </summary>
        static bool _Activo = false;

        /// <summary>
        /// Identificador unico de Usuario
        /// </summary>
        static int _Id_Usuario;

        /// <summary>
        /// Nome do Usuario
        /// </summary>
        static string _Nome;

        /// <summary>
        /// Email do Usuario
        /// </summary>
        static string _Email;

        /// <summary>
        /// Numero Telefonico.
        /// </summary>
        static string _Telefone;

        public static bool Activo
        {
            get
            {
                return _Activo;
            }
            set
            {
                _Activo = value;
            }
        }
        public static int Id_Usuario
        {
            get
            {
                return _Id_Usuario;
            }
        }

        public static string Nome
        {
            get
            {
                return _Nome;
            }
        }

        public static string Email
        {
            get
            {
                return _Email;
            }
        }

        public static string Telefone
        {
            get
            {
                return _Telefone;
            }
        }

        public static void Iniciar(int Id)
        {
            DataTable dt = new DataTable();

            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Select * from Tb_Usuario where Id_Usuario =" + Id.ToString(), SQLconn);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                SQLconn.Open();
                da.Fill(dt);
                SQLconn.Close();
                SQLconn.Dispose();
            }

            DataRow dr = dt.Rows[0];

            _Id_Usuario = Convert.ToInt32(dr[0].ToString());
            _Nome = dr[1].ToString();
            _Email = dr[2].ToString();
            _Telefone = dr[3].ToString();

            _Activo = true;
        }

        public static void RegLogIn()
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Insert Into Tb_Reg(Id_Usuario,Reg) values (" + _Id_Usuario.ToString() + ",'Inicio de Sessão')", SQLconn);
                cmd.CommandType = CommandType.Text;
                SQLconn.Open();
                cmd.ExecuteNonQuery();
                SQLconn.Close();
                SQLconn.Dispose();
            }
        }
    }

    public static class Reg
    {
        public static void Registar(string Id_Usuario,string Registo)
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Insert Into Tb_Reg(Id_Usuario,Reg) values (" + Id_Usuario + ",'"+Registo+"')", SQLconn);
                cmd.CommandType = CommandType.Text;
                SQLconn.Open();
                cmd.ExecuteNonQuery();
                SQLconn.Close();
                SQLconn.Dispose();
            }
        }

        public static void RegLogIn(string Id_Usuario)
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Insert Into Tb_Reg(Id_Usuario,Reg) values (" + Id_Usuario + ",'Inicio de Sessão')", SQLconn);
                cmd.CommandType = CommandType.Text;
                SQLconn.Open();
                cmd.ExecuteNonQuery();
                SQLconn.Close();
                SQLconn.Dispose();
            }
        }

        public static string NomeUsuario(int Id_Usuario)
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Select Nome from Tb_Usuario where Id_Usuario = "+Id_Usuario.ToString(), SQLconn);
                cmd.CommandType = CommandType.Text;
                SQLconn.Open();
                string Nome = (string)cmd.ExecuteScalar();
                SQLconn.Close();
                SQLconn.Dispose();
                return Nome;
            }
        }

    }

}