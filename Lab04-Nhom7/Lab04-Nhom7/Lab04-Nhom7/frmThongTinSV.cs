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
    public partial class frmThongTinSV : Form
    {
        private string manv, malop;
        private bool isAdd = false;
        public frmThongTinSV(string manv, string malop)
        {
            InitializeComponent();
            this.manv = manv;
            this.malop = malop;
        }

        private void frmThongTinSV_Load(object sender, EventArgs e)
        {
            LoadStudents();
            tbMaLop.Text = malop;
            tbMaLop.Enabled = false;
        }

        private void dgvSV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1) 
            {
                DataGridViewRow row = dgvSV.Rows[e.RowIndex];
                tbMaSV.Text = row.Cells["MASV"].Value.ToString();
                tbMaSV.Enabled = false;
                tbHoTen.Text = row.Cells["HOTEN"].Value.ToString();
                tbDiaChi.Text = row.Cells["DIACHI"].Value.ToString();
                dtpNgaySinh.Text = row.Cells["NGAYSINH"].Value.ToString();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            tbMaSV.Enabled = true;
            tbMaSV.Text = "";
            tbHoTen.Text = "";
            tbDiaChi.Text = "";
            dtpNgaySinh.Value = DateTime.Now;
            isAdd = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                try
                {
                    conn.Open();
                    if (!isAdd)
                    {
                        string sql = string.Format(@"DELETE FROM SINHVIEN WHERE MASV = '{0}'", tbMaSV.Text);
                        SqlCommand deleteCmd = new SqlCommand(sql, conn);
                        deleteCmd.ExecuteNonQuery();
                    }
                    string cmd = string.Format(@"INSERT INTO SINHVIEN VALUES ('{0}', N'{1}', '{2}', N'{3}', '{4}', '{5}', 0x7C4A8D09CA3762AF61E59520943DC26494F8941B)", tbMaSV.Text, tbHoTen.Text, dtpNgaySinh.Value.ToString("yyyy-MM-dd"), tbDiaChi.Text, tbMaLop.Text, tbMaSV.Text);
                    isAdd = false;
                    SqlCommand insertCmd = new SqlCommand(cmd, conn);
                    insertCmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message);
                }
                finally 
                { 
                    LoadStudents();
                    conn.Close(); 
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa sinh viên này?", "Xác nhận xóa", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
                {
                    try
                    {
                        conn.Open();
                        string sql = string.Format(@"DELETE FROM SINHVIEN WHERE MASV = '{0}'", tbMaSV.Text);
                        SqlCommand deleteCmd = new SqlCommand(sql, conn);
                        int rowAffected = deleteCmd.ExecuteNonQuery();
                        if (rowAffected > 0)
                        {
                            MessageBox.Show("Xóa sinh viên thành công!");
                        }
                        else
                        {
                            MessageBox.Show("Sinh viên không tồn tại!");
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
                    }
                    finally 
                    { 
                        LoadStudents();
                        conn.Close();
                    }
                }
            }
        }

        private void dgvSV_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1) // Kiểm tra không phải là header
            {
                DataGridViewRow row = dgvSV.Rows[e.RowIndex];
                string maSV = row.Cells["MASV"].Value.ToString();
                frmNhapBangDiem frmNhapBang = new frmNhapBangDiem(maSV, malop);
                frmNhapBang.Show();                
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLSV"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT MASV, HOTEN, NGAYSINH, DIACHI FROM SINHVIEN WHERE MALOP = '" + malop + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                dgvSV.DataSource = dt;

                conn.Close();
            }
        }
    }
}
