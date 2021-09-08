<%@ Page Title="Doanh Thu - Library Biden" Language="C#" MasterPageFile="~/PlayoutIndex.Master" AutoEventWireup="true" CodeBehind="Revenue.aspx.cs" Inherits="Project.Revenue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container" style="margin-top:80px">
        <div class="row">
			<div class="col-md-4">
				<img src="image/revenue.png" />
			</div>
			<div class="col-md-8" style="margin-top:10px">
				<center><a  class="navbar-brand" style="margin-top:5px;font-family: Courier New; font-weight: bold; font-size: 30px; font-weight: 800;text-decoration-color:unset">DOANH THU</a></center>
				<asp:GridView ID="tablerevenue" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField HeaderText="ID">
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("Revenue_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Theo Ngày">
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Eval("Revenue_Date") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Tiền Nhận">
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("Gain") %>'></asp:Label>
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
