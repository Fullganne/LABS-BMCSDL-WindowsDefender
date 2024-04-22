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

namespace Lab03_Nhom7
{
    public partial class frmNhapBangDiem : Form
    {
        private string masv;
        private string malop;
        public frmNhapBangDiem(string _masv, string _malop)
        {
            InitializeComponent();
            masv = _masv;
            malop = _malop;
        }

        private void LoadSubjects()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SP_SEL_BANGDIEM_SINHVIEN_HOCPHAN", conn);
                cmd.Parameters.Add(new SqlParameter("@MASV", masv));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                dgvBangDiem.DataSource = dt;

                conn.Close();
            }
        }

        private void frmNhapBangDiem_Load(object sender, EventArgs e)
        {
            tbMaSV.Text = masv;
            tbMaLop.Text = malop;
            LoadSubjects();
        }
    }
}
