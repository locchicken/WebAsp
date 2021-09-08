<%@ Page Title="Cá Nhân - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

           <table class="table table-hover" style="margin-top:60px">
               <thead>
                  <tr>
                     <center><th colspan="3">THÔNG TIN CÁ NHÂN</th></center>
                  </tr>
               </thead>
               <center><tbody>
                  <tr>
                     <td style="font-weight:bold;">Tên</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbname"></asp:Label></td>
                  </tr>
                  <tr>
                    <td style="font-weight:bold;">Giới Tính</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbsex"></asp:Label></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Ngày Sinh</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbbirth"></asp:Label></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Số Điện Thoại</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbphone"></asp:Label></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Địa Chỉ</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbaddress"></asp:Label></td>
                  </tr>
                  <tr>
                     <td style="font-weight:bold;">Email</td>
                     <td>➡️</td>
                     <td><asp:Label runat="server" ID="lbemail"></asp:Label></td>
                  </tr>
               </tbody></center>

            </table>
            <center><a type="button" href="/ca-nhan/<%=(string)Session["id"] %>/cap-nhap-thong-tin" class="btn btn-primary"><i class="fa fa-refresh"></i> Cập nhập thông tin</a></center>
</asp:Content>
