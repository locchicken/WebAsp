<%@ Page Title="Đọc Giả - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Reader.aspx.cs" Inherits="Project.Reader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <script type="text/javascript">
		function add() {
			swal({
				title: 'Đã thêm đọc giả thành công',
				icon: 'success',
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
	<script type="text/javascript">
		function update() {
			swal({
				title: 'Đã update thành công',
				icon: 'success',
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
		function warning() {
			swal({
				title: 'Vui lòng điền đầy đủ thông tin',
				icon: 'warning',
				button: 'OK'
			});
		}
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
        
                <div class="col-md-4">
                 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">THÊM ĐỌC GIẢ</a></center>
              
                <form action="addproduct.php" method="POST" enctype="multipart/form-data">
                    <label>Tên Đọc Giả</label>
					<asp:TextBox type="text" class="form-control" runat="server" placeholder="Họ và tên..." ID="txtname"></asp:TextBox>
                     <label>Giới tính</label>

                    <select id="sex" runat="server" class="form-control">
                        <option>-----Lựa chọn-----</option>
                        
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                        
                    </select>
                    <label>Ngày Sinh</label>
                    <asp:TextBox type="date" class="form-control" runat="server" placeholder="Ngày sinh..." ID="txtday"></asp:TextBox>
                     <label>Số Điện Thoại</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Số điện thoại..." ID="txtphone"></asp:TextBox>
                     <label>Email</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Email..." ID="txtemail"></asp:TextBox>
                     <label>Địa Chỉ</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Địa chỉ..." ID="txtaddress"></asp:TextBox>
                     <label>Ngày Đăng Ký</label>
                    <asp:TextBox type="date" class="form-control" runat="server" placeholder="Ngày đăng ký..." ID="txtregister"></asp:TextBox><br />
                   
                    
                     <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button><br />
     
                  
                </form>
                </div>
           
            <div class="col-md-8">
                 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">DANH SÁCH ĐỌC GIẢ</a></center>
                <asp:GridView ID="tablereader" class="table table-bordered table-condensed table-responsive table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Reader_ID" OnRowCancelingEdit="tablereader_RowCancelingEdit" OnRowDeleting="tablereader_RowDeleting" OnRowEditing="tablereader_RowEditing" OnRowUpdating="tablereader_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField HeaderText="Tên">
							<EditItemTemplate>
								<asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Reader_Name") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("Reader_Name") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Giới Tính">
							<EditItemTemplate>
								<asp:TextBox ID="txtsex" runat="server" Text='<%# Bind("Sex") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Eval("Sex") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Ngày Sinh">
							<EditItemTemplate>
								<asp:TextBox ID="txtbirth" runat="server" Text='<%# Bind("Date_Of_Birth") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("Date_Of_Birth") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Số Điện Thoại">
							<EditItemTemplate>
								<asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Eval("Phone_Number") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Email">
							<EditItemTemplate>
								<asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Reader_Email") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Eval("Reader_Email") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Địa Chỉ">
							<EditItemTemplate>
								<asp:TextBox ID="txtaddress" runat="server" Text='<%# Bind("Reader_Address") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label6" runat="server" Text='<%# Eval("Reader_Address") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Ngày Đăng Ký">
							<EditItemTemplate>
								<asp:TextBox ID="txtregister" runat="server" Text='<%# Bind("Register_Date") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label7" runat="server" Text='<%# Eval("Register_Date") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="ID">
							<ItemTemplate>
								<asp:Label ID="Label8" runat="server" Text='<%# Eval("Reader_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Thao Tác">
							<EditItemTemplate>
								<asp:ImageButton ID="ImageButton3" runat="server" CommandName="update" ImageUrl="~/image/AGTupdatedrivers_11244.png" />
								<asp:ImageButton ID="ImageButton4" runat="server" CommandName="cancel" ImageUrl="~/image/cancel_77947.png" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:ImageButton ID="ImageButton1" runat="server" CommandName="edit" ImageUrl="~/image/1486564394-edit_81508.png" />
								<asp:ImageButton ID="ImageButton2" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn có muốn xóa không?');" ImageUrl="~/image/trash-can_115312.png" />
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
