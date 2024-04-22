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
    public partial class frmQuanLyLopHoc : Form
    {
        private string manv;
        public frmQuanLyLopHoc(string manv)
        {
            InitializeComponent();
            this.manv = manv;
        }

        private void LoadClasses()
        {
            using(SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT l.MALOP, l.TENLOP, nv.MANV, nv.HOTEN FROM LOP l LEFT JOIN NHANVIEN nv ON l.MANV = nv.MANV", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                dgvLop.DataSource = dt;

                conn.Close();
            }
        }

        private void frmQuanLyLopHoc_Load(object sender, EventArgs e)
        {
            LoadClasses();
        }

        private void dgvLop_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.RowIndex != -1) // Kiểm tra không phải là header
            {
                DataGridViewRow row = dgvLop.Rows[e.RowIndex];
                string maNV = row.Cells["MANV"].Value.ToString();

                if (maNV == this.manv)
                {
                    string maLop = row.Cells["MALOP"].Value.ToString();
                    frmThongTinSV quanLySinhVienForm = new frmThongTinSV(manv, maLop);
                    quanLySinhVienForm.Show();
                }
                else
                {
                    MessageBox.Show("Bạn không có quyền truy cập vào lớp này!");
                }
            }
        }
    }
}
