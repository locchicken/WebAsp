<%@ Page Title="Danh Sách Đen - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Black-List.aspx.cs" Inherits="Project.Black_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function add() {
            swal({
                title: 'Đã thêm vào danh sách đen',
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
		function Delete() {
			swal({
				title: 'Đã xóa thành công',
				icon: 'success',
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
		function check() {
			swal({
				title: 'Mã đọc giả không tồn tại',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
                <div class="col-md-4">
               <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">Thêm Vi Phạm</a></center>
              
               
                    <label>Tên đọc giả:</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Mã đọc giả" ID="txtid"></asp:TextBox><br />
                    <label>Loại vi phạm</label>
                     <select id="vio" runat="server" class="form-control">
                       
                    </select><br />
                    <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button>
                </div>
                <div class="col-md-8">
                    <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">DANH SÁCH VI PHẠM</a></center>     
                    <asp:GridView runat="server" ID="tableblack" CellPadding="4" CssClass="table" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="BLACKLIST_ID" OnRowDeleting="tableblack_RowDeleting">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField HeaderText="ID">
								<ItemTemplate>
									<asp:Label ID="Label1" runat="server" Text='<%# Eval("BLACKLIST_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Mã đọc giả">
								<ItemTemplate>
									<asp:Label ID="Label2" runat="server" Text='<%# Eval("Reader_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Mã vi phạm">
								<ItemTemplate>
									<asp:Label ID="Label3" runat="server" Text='<%# Eval("VT_Cate_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Thao tác">
								<ItemTemplate>
									<asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?');" ImageUrl="~/image/trash-can_115312.png" />
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
						<EditRowStyle BackColor="#2461BF" />
						<EmptyDataTemplate>
							<span style="color: rgb(33, 37, 41); text-align:center;font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">No data available in table</span>
						</EmptyDataTemplate>
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
