using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=ylena_exercise;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Page.IsPostBack == true)
            {
                Label1.Text = ("**The information that you've entered has been sent to the database!");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
           
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            /*SqlConnection vid = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=ylena_exercise;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            {
                SqlCommand xp = new SqlCommand("Insert into customers(CustomerName, ContactName, Address, City, PostalCode, Country) Values(@CustomerName, @ContactName, @Address, @City, @PostalCode, @Country)", vid);
                //xp.Parameters.AddWithValue("@CustomerId", numid.Text);
                xp.Parameters.AddWithValue("@CustomerName", txtcustomer.Text);
                xp.Parameters.AddWithValue("@ContactName", txtcontact.Text);
                xp.Parameters.AddWithValue("@Address", txtaddress.Text);
                xp.Parameters.AddWithValue("@City", txtcity.Text);
                xp.Parameters.AddWithValue("@PostalCode", numpostcode.Text);
                xp.Parameters.AddWithValue("@Country", txtcountry.Text);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();

                if (IsPostBack)
                {
                    //numid.Text = "";
                    txtcustomer.Text = "";
                    txtcontact.Text = "";
                    txtaddress.Text = "";
                    txtcity.Text = "";
                    numpostcode.Text = "";
                    txtcountry.Text = "";
                }
            }*/
            
        }
        public class Customers
        {
            public string CustomerId { get; set; }
            public string CustomerName { get; set; }
            public string ContactName { get; set; }
            public string Address { get; set; }
            public string City { get; set; }
            public string PostalCode { get; set; }
            public string Country { get; set; }
        }


        [WebMethod]
        public static List<Customers> PopulateDropDownList()
        {
            DataTable dt = new DataTable();
            List<Customers> objDept = new List<Customers>();

            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=ylena_exercise;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT CustomerId, CustomerName, ContactName, Address, City, PostalCode, Country FROM Customers", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            objDept.Add(new Customers
                            {
                                CustomerId = dt.Rows[i]["CustomerId"].ToString(),
                                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                                ContactName = dt.Rows[i]["ContactName"].ToString(),
                                Address = dt.Rows[i]["Address"].ToString(),
                                City = dt.Rows[i]["City"].ToString(),
                                PostalCode = dt.Rows[i]["PostalCode"].ToString(),
                                Country = dt.Rows[i]["Country"].ToString()
                            });
                        }
                    }
                    return objDept;
                }
            }
        }

        
    }



}