using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;

namespace MOONLY.DataAccess.Select
{
   public class TruyVanDuLieuTatCaDonHang
    {
       public SqlDataSource Laydulieu()
       {
           SqlDataSource sqldata = new SqlDataSource();
           KetNoi chuoiketnoi = new KetNoi();
           sqldata.ConnectionString = chuoiketnoi.ConnectionString();
           sqldata.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
           sqldata.SelectCommand = "DonHangAll_Select";
           return sqldata;
       }
    }
}
