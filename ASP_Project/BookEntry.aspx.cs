using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace ASP_Project
{
    public partial class BookEntry : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=AspProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

           

            //picture save in images folder
           
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string saveLocation = Server.MapPath("~/UploadPicture/" + fileName);
            FileUpload1.SaveAs(saveLocation);


            con.Open();


            //for byte pic
            byte[] ByteImage = FileUpload1.FileBytes;

            SqlCommand cmd = new SqlCommand("insert into Book values(@bookName,@AuthorName,@CoverpicByte,@coverpicName,@categoryId)", con);

            cmd.Parameters.AddWithValue("@bookName", txtBookName.Text);
            cmd.Parameters.AddWithValue("@AuthorName", txtAuthorName.Text);
            cmd.Parameters.AddWithValue("@CoverpicByte", ByteImage);
            cmd.Parameters.AddWithValue("@coverpicName", "~/UploadPicture/" + fileName);
            cmd.Parameters.AddWithValue("@categoryId", ddlBookCategory.SelectedValue);

            cmd.ExecuteNonQuery();


            con.Close();
        }
    }
}