using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;

namespace ASP_Project.Report
{
    public partial class ReportBook : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=AspProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("select b.BookId,b.BookName,b.AuthorName,c.Name,c.CategoryId from Book b join Book_Category c on b.CategoryId=c.CategoryId where c.CategoryId=@categoryId", con);
            cmd.Parameters.AddWithValue("@categoryId", ddlCategoryName.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSetReportBook ds = new DataSetReportBook();
            sda.Fill(ds,"tblBook");
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("~/Report/CrystalReport1.rpt"));
            rpt.SetDataSource(ds.Tables["tblBook"]);
            CrystalReportViewer1.ReportSource = rpt;
            CrystalReportViewer1.DataBind();
            con.Close();
        }
    }
}