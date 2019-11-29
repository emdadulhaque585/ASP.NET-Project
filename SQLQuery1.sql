



Create database AspProject
Go

Use AspProject
GO

Create Table Book_Category
(
	CategoryId Int Primary Key Identity,
	[Name] varchar(50) Not Null,

)
GO

Create Table Book
(
	BookId Int Primary Key Identity,
	BookName varchar(50) Not Null,
	AuthorName Varchar(50) Not Null,
	CoverPage varbinary(max) Not Null,
	CoverPicName nvarchar(max) Not Null,
	CategoryId Int FOREIGN KEY References Book_Category(CategoryId)
)
GO

--insert into Book values(@bookName,@AuthorName,@CoverpicByte,@coverpicName,@categoryId)

select b.BookId,b.BookName,b.AuthorName,c.Name,c.CategoryId from Book b join Book_Category c on b.CategoryId=c.CategoryId where c.CategoryId=4

