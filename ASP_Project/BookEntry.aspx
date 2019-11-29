<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="BookEntry.aspx.cs" Inherits="ASP_Project.BookEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="container">
        <br />
        <br />
        <br />

      <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label1" AssociatedControlID="txtBookName" runat="server" Text="Book Name"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:TextBox ID="txtBookName" runat="server" placeholder="Enter Book Name" CssClass="form-control"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookName" ErrorMessage="Required!!" ForeColor="Red"></asp:RequiredFieldValidator>


            </div>

        </div>

        <br />

      <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label4" AssociatedControlID="txtAuthorName" runat="server" Text="Author Name"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:TextBox ID="txtAuthorName" runat="server" CssClass="form-control" placeholder="Author Book Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthorName" ErrorMessage="Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

        </div>

        <br />
       <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label2" AssociatedControlID="FileUpload1" runat="server" Text="Book CoverPicture"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

        </div>

        <br />
         <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label3" AssociatedControlID="ddlBookCategory" runat="server" Text="Book Category"></asp:Label>
            </div>

            <div class="col-md-5">
                <asp:DropDownList ID="ddlBookCategory" CssClass="form-control" runat="server" DataSourceID="dsBookCategory" DataTextField="Name" DataValueField="CategoryId"></asp:DropDownList>
                <asp:SqlDataSource ID="dsBookCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AspProjectContext %>" SelectCommand="SELECT DISTINCT * FROM [Book_Category]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="ddlBookCategory" ErrorMessage="Required!!" ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>

        </div>

        <br />

         <div class="row">
            <div class="col-md-2">
           
            </div>

            <div class="col-md-5">
                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>

        </div>
        <br />
        <br />

        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="dsGridBookDisplay" Width="1079px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton  ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BookId" HeaderText="BookId" InsertVisible="False" ReadOnly="True" SortExpression="BookId" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
                    <asp:TemplateField HeaderText="CoverPicture">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload2" runat="server"  ImageUrl='<%# Eval("CoverPicName") %>' height="50" Width="50"/>
                           <%-- <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("CoverPicName") %>'></asp:TextBox>--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CoverPicName") %>' height="50" Width="50"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="dsGridBookDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:AspProjectContext %>" DeleteCommand="DELETE FROM [Book] WHERE [BookId] = @original_BookId" InsertCommand="INSERT INTO [Book] ([BookName], [AuthorName], [CoverPage], [CoverPicName], [CategoryId]) VALUES (@BookName, @AuthorName, @CoverPage, @CoverPicName, @CategoryId)" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [BookName] = @BookName, [AuthorName] = @AuthorName, [CoverPage] = @CoverPage, [CoverPicName] = @CoverPicName, [CategoryId] = @CategoryId WHERE [BookId] = @original_BookId" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="original_BookId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="AuthorName" Type="String" />
                    <asp:Parameter Name="CoverPage" Type="Object" />
                    <asp:Parameter Name="CoverPicName" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookName" Type="String" />
                    <asp:Parameter Name="AuthorName" Type="String" />
                    <asp:Parameter Name="CoverPage" Type="Object" />
                    <asp:Parameter Name="CoverPicName" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                    <asp:Parameter Name="original_BookId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>




    </div>

</asp:Content>
