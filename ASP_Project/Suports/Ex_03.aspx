<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Ex_03.aspx.cs" Inherits="ASP_Project.Suports.Ex_03" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2> Book Entry</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DetailsView ID="DetailsView1"  CssClass="table table-bordered" runat="server" AutoGenerateRows="False" DataKeyNames="BookId" DataSourceID="dsBookList" DefaultMode="Insert" >
                <Fields>
                    <asp:BoundField DataField="BookId" HeaderText="BookId" InsertVisible="False" ReadOnly="True" SortExpression="BookId" />
                    <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AuthorName" SortExpression="AuthorName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CoverPage" SortExpression="CoverPage">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CoverPage") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CoverPage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CategoryId" SortExpression="CategoryId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CategoryId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategory" DataTextField="Name" DataValueField="CategoryId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:Library_MangementConnectionString4 %>" SelectCommand="SELECT DISTINCT [CategoryId], [Name] FROM [Book_Category]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CategoryId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsBookList" runat="server" ConnectionString="<%$ ConnectionStrings:Library_MangementConnectionString3 %>" DeleteCommand="DELETE FROM [Book] WHERE [BookId] = @BookId" InsertCommand="INSERT INTO [Book] ([BookName], [AuthorName], [CoverPage], [CategoryId]) VALUES (@BookName, @AuthorName, @CoverPage, @CategoryId)" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [BookName] = @BookName, [AuthorName] = @AuthorName, [CoverPage] = @CoverPage, [CategoryId] = @CategoryId WHERE [BookId] = @BookId">
                <DeleteParameters>
                    <asp:Parameter Name="BookId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="AuthorName" Type="String" />
                    <asp:Parameter Name="CoverPage" Type="Object" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="AuthorName" Type="String" />
                    <asp:Parameter Name="CoverPage" Type="Object" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                    <asp:Parameter Name="BookId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
