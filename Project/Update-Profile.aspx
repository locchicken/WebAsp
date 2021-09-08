<%@ Page Title="Cập Nhập Thông Tin - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Update-Profile.aspx.cs" Inherits="Project.Update_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
        function update() {
            swal({
                title: 'Update thành công',
                icon: 'success',
                button: 'OK'
            });
        }
	 </script>
	<script type="text/javascript">
		function warning() {
			swal({
				title: 'Vui lòng điền đầy đủ thông tin',
				icon: 'warning',
				button: 'OK'
			});
		}
	</script>
	<script type="text/javascript">
		function error() {
			swal({
				title: 'Đã xảy ra lỗi',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
    
            
                    <table class="table table-hover" style="margin-top:60px">
                     <thead>
                      <tr>
                        <th colspan="3">CHỈNH SỬA THÔNG TIN CÁ NHÂN</th>
                      </tr>
                   </thead>
                    
                     <center><tbody>
                  <tr>
                     <td style="font-weight:bold;">Tên</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtname"></asp:TextBox></td>
                  </tr>
                  <tr>
                    <td style="font-weight:bold;">Giới Tính</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtsex"></asp:TextBox></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Ngày Sinh</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtday"></asp:TextBox></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Số Điện Thoại</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtsdt"></asp:TextBox></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Địa Chỉ</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtaddress"></asp:TextBox></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Email</td>
                     <td>➡️</td>
                     <td><asp:TextBox type="text" style="width:500px" class="form-control" runat="server" ID="txtemail"></asp:TextBox></td>
                  </tr>
               </tbody></center>

                  
                </table>
                <center><button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionupdate" class="btn btn-outline-success"><i class="fas fa-download"></i> Update</button></center>
               
</asp:Content>
