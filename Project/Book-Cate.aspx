<%@ Page Title="Danh Mục Sách -Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Book-Cate.aspx.cs" Inherits="Project.Book_Cate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <script type="text/javascript">
        function add() {
            swal({
                title: 'Đã thêm thành công danh mục sách',
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
    <script type="text/javascript">
		function Delete() {
			swal({
				title: 'Đã xóa thành công',
				icon: 'success',
				button: 'OK'
			});
		}
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
                <div class="col-md-4">
                     <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">Thêm Danh Mục Sách</a></center>        
                    <label>Tên danh mục</label><br>
                       <asp:TextBox type="text" class="form-control" runat="server" name="catname" placeholder="Tên danh mục" ID="txtcate"></asp:TextBox><br />
                        <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-swatchbook"></i> Thêm</button><br />
                    
                </div>
                <div class="col-md-8">
                   
                <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">LIỆT KÊ DANH MỤC</a></center> 
					
                    <asp:GridView ID="tablecate" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Book_Cate_ID" OnRowDeleting="catetable_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField HeaderText="ID">
								<ItemTemplate>
									<asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Cate_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Sách">
								<ItemTemplate>
									<asp:Label ID="Label2" runat="server" Text='<%# Eval("Book_Cate_Name") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ShowHeader="False" HeaderText="Thao tác">
								<ItemTemplate>
									<asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?');" ImageUrl="~/image/trash-can_115312.png" />
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
						
						<EditRowStyle BackColor="#2461BF" />
						<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
						<RowStyle BackColor="#EFF3FB" />
						<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#F5F7FB" />
						<SortedAscendingHeaderStyle BackColor="#6D95E1" />
						<SortedDescendingCellStyle BackColor="#E9EBEF" />
						<SortedDescendingHeaderStyle BackColor="#4870BE" />
						
					</asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
