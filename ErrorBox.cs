using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Fryz.Apps.SpaceTrader
{
	public partial class ErrorBox : Form
	{
		public ErrorBox(Exception ex)
		{
			InitializeComponent();
			textBox1.Text = ex.Message + "\n" + ex.StackTrace;
		}

		private void button1_Click(object sender, EventArgs e)
		{
			Application.Exit();
		}

		private void ErrorBox_Load(object sender, EventArgs e)
		{

		}
	}
}
