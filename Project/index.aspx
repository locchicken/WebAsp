<%@ Page Title="Trang Chủ - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript">
	   function send() {
		   swal({
			   title: 'Đã gửi mail thành công',
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
		function thuthu() {
			swal({
				title: 'Bạn không có quyền truy vấn',
				icon: 'error',
				button: 'OK'
			});
		}
	</script>
	<center><div class="container" style="margin-top: 80px;bottom:0;"> 
         <center><div id="slides" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#slides" data-slide-to="0" class="active"></li>
            <li data-target="#slides" data-slide-to="1"></li>
            <li data-target="#slides" data-slide-to="2"></li>
            <li data-target="#slides" data-slide-to="3"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/a.jpg" width="100%" height="auto" style="height:500px">
            </div>
            <div class="carousel-item">
                <img src="image/b.jpg" width="100%" height="auto" style="height:500px">
            </div>
            <div class="carousel-item">
                <img src="image/c.jpg" width="100%" height="auto" style="height:500px">
            </div>
            <div class="carousel-item">
                <img src="image/d.jpg" width="100%" height="auto" style="height:500px">
            </div>
        </div>
        <a class="carousel-control-prev" href="#slides" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#slides" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div></center>
    </div></center>
    

<style>
    #wp-slider{
        width:1100px;
        margin:0px auto;
        margin-top:10px;
    }
    .item img{display:block;transition: all .3s ease;}
    .item img:hover{transform: scale(1.1);}
    .item a{display:block;overflow: hidden;}
    .card{transition: all .3s ease;}
    .card:hover{transform: scale(1.1);}
	.auto-style1 {
		margin-right: 0px;
	}
</style>
    <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">CHỨC NĂNG</a></center>

    <div id="wp-slider">
        <div class="owl-carousel owl-theme">
             
               <div class="item" style="width:128px;"> 
                  <center><a href="/sach" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/Book.png"/>
                      SÁCH
                  </a></center>
              </div>
              <div class="item" style="width:128px"> 
                  <center><a href="/danh-muc-sach" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/catebook.png"/>
                      DANH MỤC SÁCH
                  </a></center>
              </div>
              
              <div class="item" style="width:128px;"> 
                  <center><a href="/nha-xuat-ban" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/publisher.png"/>
                      NHÀ XUẤT BẢN
                  </a></center>
              </div>
                 <div class="item" style="width:128px;"> 
                  <center><a href="/tac-gia" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/writer.png"/>
                      NHÀ VĂN
                  </a></center>
              </div>
                 <div class="item" style="width:128px;"> 
                  <center><a href="/doc-gia" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/reader.png"/>
                      ĐỌC GIẢ
                  </a></center>
              </div>
               
                 <div class="item" style="width:128px;"> 
                  <center><a href="/ban-quyen" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/copy.png"/>
                      BẢN QUYỀN
                  </a></center>
              </div>
                <div class="item" style="width:128px;"> 
                  <center><a href="/danh-muc-vi-pham" style="color:black;font-weight:bold;text-decoration: none;">
                      <img src="image/prohibit_inset_icon_174989.png" />
                      VI PHẠM
                  </a></center>
              </div>
             
        </div>
        
    </div>
    <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">THÔNG TIN</a></center>
   <div class="container" style="margin-top: 20px">
     
        <div class="row">
          
            <div class="col-sm-4 py-3 py-sm-0">
                <div class="card" style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);background-color:   #FFFFFF;margin-top: 10px;border-radius: 20px;width:300px;height:400px">
                    <center><img src="image/statistic_icon_129319.png" style="width: 150px;height: 150px" class="card-img-top" alt="..."></center>
                  <div class="card-body">
                    <center><h5 class="card-title">Thống Kê</h5></center>
                    <p class="card-text" style="font-weight:bold;color:blue">📊 Doanh Thu: <asp:Label runat="server" ForeColor="Green" Font-Bold="true" ID="lbstatis"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">📰 Bản quyền: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbchi"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">💵Lợi Nhuận: <asp:Label runat="server" ForeColor="Red" Font-Bold="true" ID="lbnhuan"></asp:Label></p>
                  </div>
                 <center><div class="card-body">
                      
                      <center><button runat="server" id="Button2" style="width: 250px;font-weight: bold;border-radius: 25px" onserverclick="functionstatistic" class="btn btn-outline-primary"><i class="fas fa-calendar-week"></i> Xem chi tiết</button></center>
                 </div>
                 </center>
                </div>
            </div>
            <!--doanh thu-->
            <div class="col-sm-4 py-3 py-sm-0">
                <div class="card" style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);background-color:   #FFFFFF;margin-top: 10px;border-radius: 20px;width:300px;height:400px">
                    <center><img src="image/Sales-report_25411.png" style="width: 150px;height: 150px" class="card-img-top" alt="..."></center>
                  <div class="card-body">
                    <center><h5 class="card-title">Doanh Thu</h5></center>
                    <p class="card-text" style="font-weight:bold;color:blue">📆 Theo ngày: <asp:Label runat="server" ForeColor="Green" Font-Bold="true" ID="lbday"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">💵 Tổng thu: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbthu"></asp:Label></p>
                   
                  </div>
                 <center><div class="card-body">
                      
                     <center><button runat="server" id="Button1" style="width: 250px;font-weight: bold;border-radius: 25px" onserverclick="functionrevenue" class="btn btn-outline-primary"><i class="fas fa-calendar-week"></i> Xem chi tiết</button></center>
                 </div>
                 </center>
                </div>
            </div>
          <!--Đọc giả-->
            <div class="col-sm-4 py-3 py-sm-0">
                <div class="card" style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);background-color:   #FFFFFF;margin-top: 10px;border-radius: 20px;width:300px;height:400px">
                    <center><img src="image/kindle_macos_bigsur_icon_190038.png" style="width: 150px;height: 150px" class="card-img-top" alt="..."></center>
                  <div class="card-body">
                    <center><h5 class="card-title">Đọc Giả</h5></center>
                    <p class="card-text" style="font-weight:bold;color:blue">📆 Số lượng Đọc Giả: <asp:Label runat="server" ForeColor="Green" Font-Bold="true" ID="lbsum"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">📚 Sách Đang Mượn: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbsach"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">📥 Đã Trả Sách: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbtra"></asp:Label></p>
                  </div>
                 <center><div class="card-body">
                      
                     <center><button runat="server" id="btnadd" style="width: 250px;font-weight: bold;border-radius: 25px" onserverclick="functionreader" class="btn btn-outline-primary"><i class="fas fa-calendar-week"></i> Xem chi tiết</button></center>
                 </div>
                 </center>
                </div>
            </div>
            <!--nhân viên-->
            <div class="col-sm-4 py-3 py-sm-0" style="margin-top:20px">
                <div class="card" style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);background-color:   #FFFFFF;margin-top: 10px;border-radius: 20px;width:300px;height:400px">
                    <center><img src="image/user.png" style="width: 150px;height: 150px" class="card-img-top" alt="..."></center>
                  <div class="card-body">
                    <center><h5 class="card-title">Nhân Viên</h5></center>
                    <p class="card-text" style="font-weight:bold;color:blue">👥 Số lượng Nhân viên: <asp:Label runat="server" ForeColor="Green" Font-Bold="true" ID="lbnhanvien"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">👮 Quản Lý: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbquanly"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">👸 Thủ Thư: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbthuthu"></asp:Label></p>
                  </div>
                 <center><div class="card-body">
                      
                     <center><button runat="server" id="Button3" style="width: 250px;font-weight: bold;border-radius: 25px" onserverclick="functionStaff" class="btn btn-outline-primary"><i class="fas fa-calendar-week"></i> Xem chi tiết</button></center>
                 </div>
                 </center>
                </div>
            </div>
            <!--vi phạm-->
            <div class="col-sm-4 py-3 py-sm-0" style="margin-top:20px">
                <div class="card" style="box-shadow: 0px 2px 10px rgba(0,0,0,0.5);background-color:   #FFFFFF;margin-top: 10px;border-radius: 20px;width:300px;height:400px">
                    <center><img src="image/list-note-black-square-interface-symbol_icon-icons.com_54501.png " style="width: 150px;height: 150px" class="card-img-top" alt="..."></center>
                  <div class="card-body">
                    <center><h5 class="card-title">Danh Sách Đen</h5></center>
                    <p class="card-text" style="font-weight:bold;color:blue">📆 Đọc Giả Vi Phạm: <asp:Label runat="server" ForeColor="Green" Font-Bold="true" ID="lbtongvipham"></asp:Label></p>
                    <p class="card-text" style="font-weight:bold;color:blue">📚 Tổng Vi Phạm: <asp:Label runat="server" ForeColor="Orange" Font-Bold="true" ID="lbvipham"></asp:Label></p>
                    
                  </div>
                 <center><div class="card-body">
                      
                     <center><button runat="server" id="Button4" style="width: 250px;font-weight: bold;border-radius: 25px" onserverclick="functionblack" class="btn btn-outline-primary"><i class="fas fa-calendar-week"></i> Xem chi tiết</button></center>
                 </div>
                 </center>
                </div>
            </div>
        </div>
    </div>
    <!--top-->
    <center><div class="container" style="margin-top:20px;">
        <div class="row">
            <div class="col-md-5">
                <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">TOP SÁCH</a></center>
            <div class="table-responsive" style="margin-top:10px">
                <asp:GridView ID="tabletop"  CssClass="table table-striped" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						
						<asp:TemplateField HeaderText="Mã Sách">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("Mã sách") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Số Lần">
							<ItemTemplate>
								<asp:Button ID="Button5" CssClass="btn btn-success" runat="server" Text='<%# Eval("Số Lần Mượn Sách") %>' />
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
            <div class="col-md-6">
                <div class="table-responsive" style="margin-top:10px">
                    <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">DANH SÁCH ĐANG MƯỢN</a></center>
                <asp:GridView ID="tabletopmuon" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField HeaderText="Mã Đọc Giả">
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Eval("Reader_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Mã Sách">
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
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
    </div></center>
    <!--top sach muon-->

   <center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 40px; font-weight: 800">LIÊN HỆ</a></center>
    <!--email-->
    
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header text-center" style="background-color: #0D6EFD">
                    <h3 class="modal-title w-100" style="color: #FAFAFA; font-family: Courier New; font-weight: bold;">EMAIL SYSTEM</h3>
                    
                </div>
                <!-- Modal body -->
                <div class="modal-body" style="background-color: #F2F2F2">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <asp:TextBox type="email" class="form-control" runat="server" placeholder="Tài khoản..." ID="txtgo"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                         <asp:TextBox type="password" class="form-control" runat="server" placeholder="Mật khẩu..." ID="txtmk"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Người nhận:</label>
                         <asp:TextBox type="email" class="form-control" runat="server" placeholder="Email nhận..." ID="txtto"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Tiêu đề:</label>
                         <asp:TextBox type="text" class="form-control" runat="server" placeholder="Tiêu đề..." ID="txttitle"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Nội dung:</label>
                        <asp:TextBox type="text" class="form-control" runat="server" ID="txtcontent"></asp:TextBox>
                    </div>
                  
                </div>
                <center><div class="modal-footer" style="background-color: #F2F2F2">
              
                    <asp:Button ID="btnemail" runat="server" CssClass="btn btn-danger" Text="Send" OnClick="btnemail_Click" />
                </div></center>
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
              autoplayTimeout:2000,
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
