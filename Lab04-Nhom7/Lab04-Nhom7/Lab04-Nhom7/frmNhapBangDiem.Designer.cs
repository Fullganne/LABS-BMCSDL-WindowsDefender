namespace Lab04_Nhom7
{
    partial class frmNhapBangDiem
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label4 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tbMaLop = new System.Windows.Forms.TextBox();
            this.tbMaSV = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.dgvBangDiem = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBangDiem)).BeginInit();
            this.SuspendLayout();
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(28, 90);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 16);
            this.label4.TabIndex = 13;
            this.label4.Text = "Mã lớp";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(28, 52);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(81, 16);
            this.label2.TabIndex = 11;
            this.label2.Text = "Mã sinh viên";
            // 
            // tbMaLop
            // 
            this.tbMaLop.Enabled = false;
            this.tbMaLop.Location = new System.Drawing.Point(134, 87);
            this.tbMaLop.Name = "tbMaLop";
            this.tbMaLop.Size = new System.Drawing.Size(156, 22);
            this.tbMaLop.TabIndex = 12;
            // 
            // tbMaSV
            // 
            this.tbMaSV.Enabled = false;
            this.tbMaSV.Location = new System.Drawing.Point(134, 49);
            this.tbMaSV.Name = "tbMaSV";
            this.tbMaSV.Size = new System.Drawing.Size(156, 22);
            this.tbMaSV.TabIndex = 10;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.dgvBangDiem);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 140);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(808, 274);
            this.panel1.TabIndex = 14;
            // 
            // dgvBangDiem
            // 
            this.dgvBangDiem.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBangDiem.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvBangDiem.Location = new System.Drawing.Point(0, 0);
            this.dgvBangDiem.Name = "dgvBangDiem";
            this.dgvBangDiem.RowHeadersWidth = 51;
            this.dgvBangDiem.RowTemplate.Height = 24;
            this.dgvBangDiem.Size = new System.Drawing.Size(808, 274);
            this.dgvBangDiem.TabIndex = 0;
            // 
            // frmNhapBangDiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(808, 414);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.tbMaLop);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbMaSV);
            this.Name = "frmNhapBangDiem";
            this.Text = "Bảng điểm";
            this.Load += new System.EventHandler(this.frmNhapBangDiem_Load);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBangDiem)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbMaLop;
        private System.Windows.Forms.TextBox tbMaSV;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dgvBangDiem;
    }
}