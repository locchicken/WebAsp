<%@ Page Title="Bản Quyền - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Copyright.aspx.cs" Inherits="Project.Copyright" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
		function Add() {
			swal({
				title: 'Đã thêm bản quyền thành công',
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
		function update() {
			swal({
				title: 'Update thành công',
				icon: 'success',
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
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
                <div class="col-md-4">
                     <h3 style="padding:15px;color:white;background-color:#00CED1;text-align:center">Thêm Bản Quyền</h3>         
                        <label>Mã bản quyền</label><br>
                       <asp:TextBox type="text" class="form-control" runat="server" placeholder="Mã bản quyền..." ID="txtisbn"></asp:TextBox>
                        <label>Nhà Văn</label>
                        <select id="writer" runat="server" class="form-control">
                        
                        
                        </select>
                          <label>Phí bản quyền</label><br>
                       <asp:TextBox type="text" class="form-control" runat="server" placeholder="Phí bản quyền..." ID="txtprice"></asp:TextBox><br />
                        <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="far fa-copyright"></i> Thêm</button><br />
                    
                </div>
                <div class="col-md-8">
					 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">DANH SÁCH BẢN QUYỀN</a></center>
                    <asp:GridView ID="tablecopy"  CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="CPR_Fee_ID" OnRowDeleting="tablecopy_RowDeleting" OnRowCancelingEdit="tablecopy_RowCancelingEdit" OnRowEditing="tablecopy_RowEditing" OnRowUpdating="tablecopy_RowUpdating">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField HeaderText="ID">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Eval("CPR_Fee_ID") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
							
							<asp:TemplateField HeaderText="Ngày">
									<ItemTemplate>
										<asp:Label ID="Label2" runat="server" Text='<%# Eval("CPR_Fee_Date") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
							<asp:TemplateField HeaderText="Mã bản quyền">
								<EditItemTemplate>
									<asp:TextBox ID="maisbn" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Label ID="Label3" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Mã tác giả">
								
								<ItemTemplate>
									<asp:Label ID="Label4" runat="server" Text='<%# Eval("Writer_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Phí bản quyền">
								<EditItemTemplate>
									<asp:TextBox ID="price" runat="server" Text='<%# Bind("CPR_Fee") %>'></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Label ID="Label5" runat="server" Text='<%# Eval("CPR_Fee") %>'></asp:Label>
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
