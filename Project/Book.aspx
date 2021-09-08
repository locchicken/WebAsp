<%@ Page Title="Sách - Library" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="Project.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style1 {
			display: block;
			width: 100%;
			height: calc(1.5em + .75rem + 2px);
			font-size: 1rem;
			font-weight: 400;
			line-height: 1.5;
			color: #495057;
			background-clip: padding-box;
			border-radius: .25rem;
			transition: none;
			border: 1px solid #ced4da;
			background-color: #fff;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
        function add() {
            swal({
                title: 'Đã thêm sách thành công',
                icon: 'success',
                button: 'OK'
            });
        }
	</script>
	<script type="text/javascript">
		function checkcode() {
			swal({
				title: 'Mã sách đã tồn tại, vui lòng chọn mã khác',
				icon: 'error',
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
	
	<div class="container"  style="margin-top: 80px">
        <div class="row">
        
                <div class="col-md-4">
               <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">Thêm Sách</a></center>
              
               
                    <label>Mã Sách</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="productname" placeholder="Mã sách..." ID="txtcode"></asp:TextBox>
    
                    <label>Tên Sách</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="price" placeholder="Tên sách..." ID="txtname"></asp:TextBox>
					<label>Hình Ảnh</label><br />
					<asp:FileUpload ID="uploadimage" runat="server" /><asp:Image ID="Image1" runat="server" Height="80px" Width="80px" /> <br />
                    <label>Danh Mục Sách</label>
                    <select id="book" runat="server" class="auto-style1">
                       
                    </select>
                    <label>Nhà Văn</label>
                    <select id="writer" runat="server" class="form-control">
                        
                        
                    </select>
                    <label>Nhà Xuất Bản</label>
                    <select id="publisher" runat="server" class="form-control">
                        
                    </select>
                    
     
                  
              
                </div>
			<div class="col-md-4" style="margin-top:60px">
				<label>Năm Xuất Bản</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="price" placeholder="Năm xuất bản..." ID="txtyear"></asp:TextBox>
                     <label>Tủ</label>
                    <select id="tusach" runat="server" class="auto-style1">
                       
                    </select>
					 <label>Tầng Sách</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="ngan" placeholder="Ngăn sách..." ID="txtngan"></asp:TextBox>
                     <label>Số Lượng</label>
                    <asp:TextBox type="text" class="form-control" runat="server" name="ngan" placeholder="Số lượng..." ID="txtsoluong"></asp:TextBox>
                    <label>Ngày Thêm</label>
                   <asp:TextBox type="date" class="form-control" runat="server" name="price" placeholder="Ngày thêm..." ID="txtday"></asp:TextBox><br />

                    
                     <button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-book-medical"></i> Thêm</button><br />
			</div>
            <div class="table-responsive" style="margin-top:10px">
                 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">KHO SÁCH</a></center>         
                <asp:GridView ID="tablebook" class="table table-bordered table-condensed table-responsive table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="tablebook_RowDeleting" OnRowEditing="tablebook_RowEditing" OnRowCancelingEdit="tablebook_RowCancelingEdit" OnRowUpdating="tablebook_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField HeaderText="ID">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Mã Sách">
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Tên Sách">
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("Book_Name") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Mã Danh Mục Sách">
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Eval("Book_Cate_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Mã Tác Giả">
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Eval("Writer_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Mã Nhà Sản Xuất">
							<ItemTemplate>
								<asp:Label ID="Label6" runat="server" Text='<%# Eval("Pub_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Năm Sản Xuất">
							<ItemTemplate>
								<asp:Label ID="Label7" runat="server" Text='<%# Eval("Publishing_Year") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Ngày Thêm">
							<ItemTemplate>
								<asp:Label ID="Label8" runat="server" Text='<%# Eval("Date_Added") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Hình Ảnh">
							<EditItemTemplate>
								<asp:FileUpload ID="editimage" runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Image ID="Image2" Width="50px" Height="50px" runat="server" ImageUrl='<%# Eval("Book_Image") %>'/>
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
