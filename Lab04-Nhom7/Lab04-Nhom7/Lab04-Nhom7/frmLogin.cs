using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab04_Nhom7
{
    public partial class frmLogin : Form
    {
        private string manv;
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            txtUsername.Text = txtUsername.Text.Trim();
            txtPassword.Text = txtPassword.Text.Trim();
            if (ValidateLogin(txtUsername.Text, txtPassword.Text))
            {
                MessageBox.Show("Đăng nhập thành công!");
                frmQuanLyLopHoc frm = new frmQuanLyLopHoc(manv);
                frm.Show();
            }
            else
            {
                MessageBox.Show("Tên đăng nhập và mật khẩu không hợp lệ!");
            }
        }

        private bool ValidateLogin(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SP_SEL_PUBLIC_NHANVIEN", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramUsername = new SqlParameter("@TENDN", SqlDbType.NVarChar, 50);
                    paramUsername.Value = username;
                    cmd.Parameters.Add(paramUsername);

                    SqlParameter paramPassword = new SqlParameter("@MK", SqlDbType.NVarChar, 50);
                    paramPassword.Value = password;
                    cmd.Parameters.Add(paramPassword);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Close();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        manv = dt.Rows[0]["MANV"].ToString();
                        conn.Close();
                        return true;
                    }
                    reader.Close();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message);
                }
                return false;
            }
        }

        private void btExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
