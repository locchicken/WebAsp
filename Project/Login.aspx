<%@ Page Title="Đăng Nhập - Library Biden" Language="C#" MasterPageFile="~/vip.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<center><div class="container" style="margin-top: 80px; margin-bottom: 0px"> 
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
   

</asp:Content>
