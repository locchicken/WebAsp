<%@ Page Title="Mượn Trả Sách - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Book_Borrowing.aspx.cs" Inherits="Project.Book_Borrowing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
        function add() {
            swal({
                title: 'Đã thêm vào danh sách mượn',
                icon: 'success',
                button: 'OK'
            });
		}
		function payment() {
			swal({
				title: 'Đã trả sách thành công',
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
	</script>
	<div class="container"  style="margin-top: 80px">
        <div class="row">
        
                <div class="col-md-4">
                <h4>Thêm Danh Sách Mượn</h4>
              
                     <label>Tên Đọc Giả</label>
                    <select id="name" runat="server" class="form-control">
					</select>
                       <label>Tên Sách</label>
                    <select id="book" runat="server" class="form-control">
                    </select>
                   
                     <label>Ngày Kết Thúc Mượn</label>
                    <asp:TextBox type="date" class="form-control" runat="server" placeholder="Ngày Kết Thúc..." ID="txthsd"></asp:TextBox><br />
                    
                   
                    
                     <center><button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="fas fa-user-plus"></i> Thêm</button></center><br />
     
                  
              
                </div>
				<div class="col-md-4">
					<img src="image/return.png" />
				</div>
              <div class="table-responsive" style="margin-top:10px">
                 <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">DANH SÁCH MƯỢN</a></center>
                 <asp:GridView class="table table-bordered table-condensed table-responsive table-hover" runat="server" ID="tableborrow" AutoGenerateColumns="False" OnRowDeleting="tableborrow_RowDeleting" DataKeyNames="BKG_ID">
					 <Columns>
						 <asp:TemplateField HeaderText="ID">
							 <ItemTemplate>
								 <asp:Label ID="Label1" runat="server" Text='<%# Eval("BKG_ID") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="ID Đọc Giả">
							 <ItemTemplate>
								 <asp:Label ID="Label2" runat="server" Text='<%# Eval("Reader_ID") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Mã Sách">
							 <ItemTemplate>
								 <asp:Label ID="Label3" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Ngày Bắt Đầu Mượn">
							 <ItemTemplate>
								 <asp:Label ID="Label4" runat="server" Text='<%# Eval("Borrowed_From_Date") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Ngày Kết Thúc Mượn">
							 <ItemTemplate>
								 <asp:Label ID="Label5" runat="server" Text='<%# Eval("Borrowed_To_Date") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Ngày Trả">
							 <ItemTemplate>
								 <asp:Label ID="Label6" runat="server" Text='<%# Eval("Return_Date") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Trễ Hạn">
							 <ItemTemplate>
								 <asp:Label ID="Label7" runat="server" Text='<%# Eval("Deferred_Payment") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
					 	<asp:TemplateField HeaderText="Chi Phí">
							<ItemTemplate>
								<asp:Label ID="Label8" runat="server" Text='<%# Eval("Cost_Payment") %>'></asp:Label>
							</ItemTemplate>
						 </asp:TemplateField>
						 <asp:TemplateField HeaderText="Trạng Thái">
							 <ItemTemplate>
								 <asp:Label ID="Label9" runat="server" Text='<%# Eval("Borrowing_Status") %>'></asp:Label>
							 </ItemTemplate>
						 </asp:TemplateField>
					 	<asp:TemplateField HeaderText="Thao Tác" ShowHeader="False">
							<ItemTemplate>
								<asp:ImageButton ID="ImageButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Bạn có muốn thanh toán');" ImageUrl="~/image/4288566bankingbillcardcreditexpenditurepaypayment-115790_115723.png" />
							</ItemTemplate>
						 </asp:TemplateField>
					 </Columns>
					 <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
				 </asp:GridView>
            </div>
		</div>
		</div>
</asp:Content>
