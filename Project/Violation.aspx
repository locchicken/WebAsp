<%@ Page Title="Vi Phạm - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Violation.aspx.cs" Inherits="Project.Violation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
		function Add() {
			swal({
				title: 'Đã thêm vi phạm thành công',
				icon: 'success',
				button: 'OK'
			});
		}
		function error() {
			swal({
				title: 'Đã xảy ra lỗi',
				icon: 'error',
				button: 'OK'
			});
		}
		function warning() {
			swal({
				title: 'Vui lòng điền đầy đủ thông tin',
				icon: 'warning',
				button: 'OK'
			});
		}
		function dele() {
			swal({
				title: 'Đã xóa thành công',
				icon: 'success',
				button: 'OK'
			});
		}
		function update() {
			swal({
				title: 'Update thành công',
				icon: 'success',
				button: 'OK'
			});
		}
		
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
                <div class="col-md-4">
                      <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">Thêm Tên Vi Phạm</a></center>
                          <label>Tên vi phạm</label><br>
                       <asp:TextBox type="text" class="form-control" runat="server" placeholder="Tên..." ID="txtvio"></asp:TextBox><br />
                        <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button><br />
                    
                </div>
                <div class="col-md-8">
					 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">DANH SÁCH BẢN QUYỀN</a></center>
                    <asp:GridView ID="tablevio"  CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="VT_Cate_ID" OnRowCancelingEdit="tablevio_RowCancelingEdit" OnRowDeleting="tablevio_RowDeleting" OnRowEditing="tablevio_RowEditing" OnRowUpdating="tablevio_RowUpdating">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField HeaderText="ID">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Eval("VT_Cate_ID") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
							
							<asp:TemplateField HeaderText="Tên vi phạm">
								<EditItemTemplate>
									<asp:TextBox ID="txtname" runat="server" Text='<%# Bind("VT_Cate_Name") %>'></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Label ID="Label3" runat="server" Text='<%# Eval("VT_Cate_Name") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							
							<asp:TemplateField HeaderText="Thao tác">
								<EditItemTemplate>
									<asp:ImageButton ID="ImageButton3" runat="server" CommandName="update" ImageUrl="~/image/AGTupdatedrivers_11244.png" />
									<asp:ImageButton ID="ImageButton4" runat="server" CommandName="cancel" ImageUrl="~/image/cancel_77947.png" />
								</EditItemTemplate>
								<ItemTemplate>
									<asp:ImageButton ID="ImageButton1" runat="server" CommandName="edit" ImageUrl="~/image/1486564394-edit_81508.png" />
									<asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirm('Bạn có muốn xóa không?');" CommandName="delete" ImageUrl="~/image/trash-can_115312.png" />
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
