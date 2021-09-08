<%@ Page Title="Nhà Văn - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Writer.aspx.cs" Inherits="Project.Writer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style2 {
			width: 120px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
        function add() {
            swal({
                title: 'Đã thêm nhà văn thành công',
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
		function Delete() {
			swal({
				title: 'Đã xóa sách thành công',
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
		function Error() {
			swal({
				title: 'Lỗi',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
	<script type="text/javascript">
		function Update() {
			swal({
				title: 'Update thành công',
				icon: 'success',
				button: 'OK'
			});
		}
	</script>
	<div class="container" style="margin-top:80px">
        <div class="row">
        
                <div class="col-md-4">
                <a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800">THÊM NHÀ VĂN</a><br />
              
                
                    <label>Tên nhà văn</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="productname" placeholder="Họ và tên..." ID="txtname"></asp:TextBox>
    
                    <label>Ngày sinh</label>
                    <asp:TextBox type="date" class="form-control" runat="server" name="price" placeholder="Ngày sinh..." ID="txtday"></asp:TextBox>
                    <label>Số điện thoại</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="price" placeholder="Phone..." ID="txtphone"></asp:TextBox>
                    
                    <label>Email</label>
                   <asp:TextBox type="text" class="form-control" runat="server" name="price" placeholder="Email..." ID="txtemail"></asp:TextBox>
                    <label>Địa chỉ</label>
                   <asp:TextBox type="text" class="form-control" runat="server" name="price" placeholder="Địac chỉ..." ID="txtaddress"></asp:TextBox>
                    <label>Giới tính</label>

                    <select id="sex" runat="server" class="form-control">
                        <option>-----Lựa chọn-----</option>
                        
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                        
                    </select><br>
                     <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button>
     
                  
                
                </div>
             <div class="col-md-8">
				 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800">DANH SÁCH NHÀ VĂN</a></center>
                 <asp:GridView ID="tableWriter" runat="server" class="table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Writer_ID" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="tableWriter_RowCancelingEdit" OnRowEditing="tableWriter_RowEditing" OnSelectedIndexChanged="tableWriter_SelectedIndexChanged" OnRowDeleting="tableWriter_RowDeleting" OnRowUpdating="tableWriter_RowUpdating">
					 <AlternatingRowStyle BackColor="White" />
					 <Columns>
						 <asp:TemplateField HeaderText="Tên">
							 <EditItemTemplate>
								 <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("Writer_Name") %>'></asp:TextBox>
							 </EditItemTemplate>
							 <ItemTemplate>
								 <asp:Label ID="Label1" runat="server" Text='<%# Eval("Writer_Name") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Giới Tính">
							 <EditItemTemplate>
								 &nbsp;<asp:TextBox ID="txt_sex" runat="server" Text='<%# Bind("Sex") %>'></asp:TextBox>
							 </EditItemTemplate>
							 <FooterTemplate>
								 &nbsp;
							 </FooterTemplate>
							 <ItemTemplate>
								 <asp:Label ID="Label2" runat="server" Text='<%# Eval("Sex") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Ngày Sinh">
							 <EditItemTemplate>
								 <asp:TextBox ID="txtday" runat="server" Text='<%# Bind("Date_Of_Birth") %>'></asp:TextBox>
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
								 <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Writer_Email") %>'></asp:TextBox>
							 </EditItemTemplate>
							 <ItemTemplate>
								 <asp:Label ID="Label5" runat="server" Text='<%# Eval("Writer_Email") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Địa Chỉ">
							 <EditItemTemplate>
								 <asp:TextBox ID="txtaddress" runat="server" Text='<%# Bind("Writer_Address") %>'></asp:TextBox>
							 </EditItemTemplate>
							 <ItemTemplate>
								 <asp:Label ID="Label6" runat="server" Text='<%# Eval("Writer_Address") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Mã">
							 <ItemTemplate>
								 <asp:Label ID="Label7" runat="server" Text='<%# Eval("Writer_ID") %>'></asp:Label>
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
