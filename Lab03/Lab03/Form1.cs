using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab03
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            txtUsername.Text = txtUsername.Text.Trim();
            txtPassword.Text = txtPassword.Text.Trim();
            if(ValidateLogin(txtUsername.Text, txtPassword.Text))
            {
                MessageBox.Show("Đăng nhập thành công!");
            }
            else
            {
                MessageBox.Show("Tên đăng nhập và mật khẩu không hợp lệ!");
            }

        }

        private bool ValidateLogin(string username, string password)
        {
            bool isValid = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("SP_Login", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramUsername = new SqlParameter("@Username", SqlDbType.NVarChar, 50);
                    paramUsername.Value = username;
                    cmd.Parameters.Add(paramUsername);

                    SqlParameter paramPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 50);
                    paramPassword.Value = password;
                    cmd.Parameters.Add(paramPassword);

                    SqlParameter paramIsValid = new SqlParameter("@IsValid", SqlDbType.Bit);
                    paramIsValid.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(paramIsValid);

                    cmd.ExecuteNonQuery();

                    isValid = (bool)paramIsValid.Value;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi kết nối cơ sở dữ liệu: " + ex.Message);
                }
            }
            return isValid;
        }
            private void btExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
