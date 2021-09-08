<%@ Page Title="Thống Kê - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Statistic.aspx.cs" Inherits="Project.Statistic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<center><div class="container">
        <div class="row" style="margin-top:80px">
			<div class="col-md-4">
				<img src="image/sta.png" />
			</div>
			<div class="col-md-6" style="margin-top:10px">
				<center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">THỐNG KÊ</a></center>
				<asp:GridView class="table table-bordered table-condensed table-responsive table-hover" ID="tableStatistic" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField HeaderText="ID">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Theo Tháng">
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Eval("Stat_Code") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Doanh Thu">
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("Revenue") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Phí Bản Quyền">
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Eval("CPR_Fee") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Lợi Nhuận">
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Eval("Profit") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Tăng Trưởng">
							<ItemTemplate>
								<asp:Label ID="Label6" runat="server" Text='<%# Eval("Growth") %>'></asp:Label>
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
	</div></center>
</asp:Content>
