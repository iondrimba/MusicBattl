
 CREATE PROCEDURE [dbo].[viewTopAlbumsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewTopAlbums ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewTopAlbumsId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 
 DECLARE @from nvarchar(MAX)	 
 SET @from = @fromParam	 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 DECLARE @orderBy nvarchar(MAX)	 
 SET @orderBy = @orderByParam	 
 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END	 


