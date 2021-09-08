<%@ Page Title="Nhà Xuất Bản - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Publisher.aspx.cs" Inherits="Project.Publisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
		function add() {
			swal({
				title: 'Đã thêm nhà xuất bản thành công',
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
		 function Delete() {
			 swal({
				 title: 'Đã xóa thành công',
				 icon: 'success',
				 button: 'OK'
			 });
		 }
	 </script>
	<div class="container" style="margin-top: 80px">
        <div class="row">
                <div class="col-md-4">
                    <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">CHỨC NĂNG</a></center>       
                    <label>Tên nhà xuất bản</label><br>
             
                       <asp:TextBox type="text" class="form-control" runat="server" placeholder="Tên nhà xuất bản" ID="txtcate"></asp:TextBox><br />
                        <center><button runat="server" id="btnadd" style="width: 300px;border-radius: 25px" onserverclick="functionAdd" class="btn btn-outline-primary"><i class="far fa-calendar-plus"></i> Thêm</button></center>
                    
                </div>
                <div class="col-md-8">
                   
                <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">LIỆT KÊ DANH MỤC</a></center> 
                    <asp:GridView ID="tablepub" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Pub_ID" OnRowDeleting="tablepub_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField HeaderText="ID">
								<ItemTemplate>
									<asp:Label ID="Label1" runat="server" Text='<%# Eval("Pub_ID") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Tên Nhà Xuất Bản">
								<ItemTemplate>
									<asp:Label ID="Label2" runat="server" Text='<%# Eval("Pub_Name") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ShowHeader="False" HeaderText="Thao Tác">
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
	<style>
    #wp-slider{
        width:1100px;
        margin:0px auto;
        margin-top:30px;
    }
    .item img{display:block;transition: all .3s ease;}
    .item img:hover{transform: scale(1.1);}
    .item a{display:block;overflow: hidden;}
</style>
 
    <div id="wp-slider">
        <div class="owl-carousel owl-theme">
             <div class="item" style="width:128px;"> 
                  <center><a href="Staff.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/user.png" alt="User"/>
                         NHÂN VIÊN
                  </a></center>
              </div>
               <div class="item" style="width:128px;"> 
                  <center><a href="Book.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/Book.png"/>
                      SÁCH
                  </a></center>
              </div>
              <div class="item" style="width:128px"> 
                  <center><a href="Book-Cate.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/catebook.png"/>
                      DANH MỤC SÁCH
                  </a></center>
              </div>
              <div class="item" style="width:128px;"> 
                  <center><a href="Book_Borrowing.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/borrowing.png"/>
                      DANH SÁCH MƯỢN
                  </a></center>
              </div>
              <div class="item" style="width:128px;"> 
                  <center><a href="Publisher.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/publisher.png"/>
                      NHÀ XUẤT BẢN
                  </a></center>
              </div>
                 <div class="item" style="width:128px;"> 
                  <center><a href="Writer.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/writer.png"/>
                      NHÀ VĂN
                  </a></center>
              </div>
                 <div class="item" style="width:128px;"> 
                  <center><a href="Reader.aspx" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/reader.png"/>
                      ĐỌC GIẢ
                  </a></center>
              </div>
        </div>
        
    </div>
    
    <script src="owlcarousel/owl.carousel.min.js"></script>

  <script type="text/javascript">
	  $(document).ready(function () {
		  $('.owl-carousel').owlCarousel({
			  loop: true,
			  margin: 10,
			  nav: true,
			  autoplay: true,
			  autoplayTimeout: 2000,
			  responsive: {
				  0: {
					  items: 1
				  },
				  600: {
					  items: 3
				  },
				  1000: {
					  items: 5
				  }
			  }
		  })
	  });
  </script>
</asp:Content>
