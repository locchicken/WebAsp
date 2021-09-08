<%@ Page Title="Nhân Viên - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Project.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <script type="text/javascript">
		function add() {
			swal({
				title: 'Đã thêm nhân viên thành công',
				icon: 'success',
				button: 'OK'
			});
		}
	 </script>
	<script type="text/javascript">
		function checkuser() {
			swal({
				title: 'Tài khoản đã tồn tại trong hệ thống',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
	<script type="text/javascript">
		function error() {
			swal({
				title: 'Lỗi',
				icon: 'error',
				button: 'OK'
			});
		}
		function check() {
			swal({
				title: 'Chỉ chấp nhận 2 chức vụ: Quản Lý hoặc Thủ Thư',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
	 <script type="text/javascript">
		 function Delete() {
			 swal({
				 title: 'Đã làm thủ tục thành công',
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
                <a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800">THÊM NHÂN VIÊN</a><br />
              
                
                    <label>Tài khoản</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Tài khoản..." ID="txtuser"></asp:TextBox>
    
                    <label>Mật Khẩu</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Mật khẩu..." ID="txtpass"></asp:TextBox>
                    <label>Admin</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="1 là admin, 0 là nhân viên..." ID="txtadmin"></asp:TextBox>
                    
                    <label>Designation</label>
                   <select id="chucvu" runat="server" class="form-control">
                        <option>-----Lựa chọn-----</option>
                        <option value="1">Quản Lý</option>
                        <option value="0">Thủ Thư</option>
                    </select>
					<label>Họ Tên</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Họ tên..." ID="txtname"></asp:TextBox>
					 <label>Giới Tính</label>
                    <select id="sex" runat="server" class="form-control">
                        <option>-----Lựa chọn-----</option>
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select><br>
					
                </div>
				<div class="col-md-5" style="margin-top:60px">
					<label>Ngày Sinh</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Ngày sinh..." ID="txtday"></asp:TextBox>
					<label>Số Điện Thoại</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Số DT..." ID="txtphone"></asp:TextBox>
					<label>Địa Chỉ</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Địa chỉ..." ID="txtaddress"></asp:TextBox>
					<label>Email</label>
                    <asp:TextBox type="email" class="form-control" runat="server" placeholder="Email..." ID="txtemail"></asp:TextBox>
					<label>Ngày vào làm</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Ngày vào làm..." ID="txtngaylam"></asp:TextBox>
					<label>Ngày nghỉ</label>
                    <asp:TextBox type="text" class="form-control" runat="server" placeholder="Ngày nghỉ..." ID="txtngaynghi"></asp:TextBox><br />
                     <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button>
				</div>
	<div class="table-responsive" style="margin-top:10px">
		<center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">DANH SÁCH NHÂN VIÊN</a></center>
        <%--<asp:GridView ID="tablestaff" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Staff_ID" OnRowCancelingEdit="tablestaff_RowCancelingEdit" OnRowDeleting="tablestaff_RowDeleting" OnRowEditing="tablestaff_RowEditing" OnRowUpdating="tablestaff_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
				<asp:TemplateField HeaderText="ID">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Eval("Staff_ID") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Tài Khoản">
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Eval("Staff_User") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Mật Khẩu">
					<EditItemTemplate>
						<asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Eval("Staff_Pass") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="IsAdmin">
					<EditItemTemplate>
						<asp:TextBox ID="txtadmin" runat="server"></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label4" runat="server" Text='<%# Eval("IsAdmin") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Chỉ Định Chức Vụ">
					<EditItemTemplate>
						<asp:TextBox ID="txtdesignation" runat="server"></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label5" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
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
			
		</asp:GridView>--%>
		<asp:GridView ID="tablestaff" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Mã nhân viên" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="tablestaff_RowCancelingEdit1" OnRowEditing="tablestaff_RowEditing" OnRowUpdating="tablestaff_RowUpdating" OnRowDeleting="tablestaff_RowDeleting">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
				<asp:TemplateField HeaderText="Mã nhân viên">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Eval("Mã nhân viên") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Tên đăng nhập">
					<EditItemTemplate>
						<asp:TextBox ID="txtTK" runat="server" Text='<%# Bind("[Tên đăng nhập]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Eval("Tên đăng nhập") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Mật khẩu">
					<EditItemTemplate>
						<asp:TextBox ID="txtMK" runat="server" Text='<%# Bind("[Mật khẩu]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Eval("Mật khẩu") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Tên nhân viên">
					<EditItemTemplate>
						<asp:TextBox ID="txtten" runat="server" Text='<%# Bind("[Tên nhân viên]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label4" runat="server" Text='<%# Eval("Tên nhân viên") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Giới tính">
					<EditItemTemplate>
						<asp:TextBox ID="txtGT" runat="server" Text='<%# Bind("[Giới tính]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label5" runat="server" Text='<%# Eval("Giới tính") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Ngày sinh">
					<EditItemTemplate>
						<asp:TextBox ID="txtbirth" runat="server" Text='<%# Bind("[Ngày sinh]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label6" runat="server" Text='<%# Eval("Ngày sinh") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Số điện thoại">
					<EditItemTemplate>
						<asp:TextBox ID="txtsdt" runat="server" Text='<%# Bind("[Số điện thoại]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label7" runat="server" Text='<%# Eval("Số điện thoại") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Địa chỉ">
					<EditItemTemplate>
						<asp:TextBox ID="txtdiachi" runat="server" Text='<%# Bind("[Địa chỉ]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label8" runat="server" Text='<%# Eval("Địa chỉ") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Email">
					<EditItemTemplate>
						<asp:TextBox ID="txtmail" runat="server" Text='<%# Bind("[Email]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label9" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Chức vụ">
					<EditItemTemplate>
						<asp:TextBox ID="txtchucvu" runat="server" Text='<%# Bind("[Chức vụ]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label10" runat="server" Text='<%# Eval("Chức vụ") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Ngày vào làm">
					<EditItemTemplate>
						<asp:TextBox ID="txtngayvaolam" runat="server" Text='<%# Bind("[Ngày vào làm]") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label11" runat="server" Text='<%# Eval("Ngày vào làm") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Tình trạng">
					<ItemTemplate>
						<asp:Label ID="Label12" runat="server" Text='<%# Eval("Tình trạng") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Ngày nghỉ">
					<ItemTemplate>
						<asp:Label ID="Label13" runat="server" Text='<%# Eval("Ngày nghỉ") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Thao tác">
					<EditItemTemplate>
						<asp:ImageButton ID="ImageButton2" runat="server" CommandName="update" ImageUrl="~/image/AGTupdatedrivers_11244.png" />
						<asp:ImageButton ID="ImageButton3" runat="server" CommandName="cancel" ImageUrl="~/image/cancel_77947.png" />
					</EditItemTemplate>
					<ItemTemplate>
						<asp:ImageButton ID="ImageButton1" runat="server" CommandName="edit" ImageUrl="~/image/1486564394-edit_81508.png" />
						<asp:ImageButton ID="ImageButton4" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn đồng ý xác thực cho nhân viên nghỉ việc không?');" ImageUrl="~/image/generatetables_ok_home_out_edit_generar_1491.png" />
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
