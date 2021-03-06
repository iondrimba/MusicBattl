USE [musicbattl_test]
GO
/****** Object:  StoredProcedure [dbo].[actionAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actionAdd]
  @name nvarchar(250)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[action](  [name]) 
  VALUES ( @name) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[actionFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actionFind]
  @fromParam nvarchar(MAX) = ' action ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 

 DECLARE @from nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'action'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'actionId DESC'	 
 
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[actionGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actionGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' action ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' actionId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'action'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'actionId DESC'	


 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[actionRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actionRemove]
  @actionId int 
 AS 
 BEGIN 
 delete from action where actionId = @actionId 
 END
GO
/****** Object:  StoredProcedure [dbo].[actionUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actionUpdate]
  @actionId int,
  @name nvarchar(250)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	action 
 SET  name =@name 
 where actionId = @actionId 
 END
GO
/****** Object:  StoredProcedure [dbo].[activityLogAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[activityLogAdd]
  @userId int,
  @actionId int,
  @data datetime
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[activityLog](  [userId], [actionId], [data]) 
  VALUES ( @userId, @actionId, @data) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[activityLogFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[activityLogFind]
  @fromParam nvarchar(MAX) = ' activityLog ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'activityLog'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'activityLogId DESC'
  
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[activityLogGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[activityLogGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' activityLog ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' activityLogId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'activityLog'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'activityLogId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[activityLogRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[activityLogRemove]
  @activityLogId int 
 AS 
 BEGIN 
 delete from activityLog where activityLogId = @activityLogId 
 END
GO
/****** Object:  StoredProcedure [dbo].[activityLogUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[activityLogUpdate]
  @activityLogId int,
  @userId int,
  @actionId int,
  @data datetime
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	activityLog 
 SET  userId =@userId , actionId =@actionId , data =@data 
 where activityLogId = @activityLogId 
 END
GO
/****** Object:  StoredProcedure [dbo].[addressAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addressAdd]
  @profileId int,
  @country nvarchar(150), 
 @city nvarchar(150)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[address](  [profileId], [country], [city]) 
  VALUES ( @profileId, @country, @city) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[addressFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addressFind]
  @fromParam nvarchar(MAX) = ' address ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
   DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'address'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'addressId DESC'
  
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[addressGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addressGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' address ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' addressId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
   DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'address'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'addressId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[addressRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addressRemove]
  @addressId int 
 AS 
 BEGIN 
 delete from address where addressId = @addressId 
 END
GO
/****** Object:  StoredProcedure [dbo].[addressUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addressUpdate]
  @addressId int,
  @profileId int,
  @country nvarchar(150), 
 @city nvarchar(150)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	address 
 SET  profileId =@profileId , country =@country , city =@city 
 where addressId = @addressId 
 END
GO
/****** Object:  StoredProcedure [dbo].[albumAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[albumAdd]
  @artistId int,
  @year datetime,
  @albumCover nvarchar(50), 
 @name nvarchar(100), 
 @description nvarchar(MAX)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[album](  [artistId], [year], [albumCover], [name], [description]) 
  VALUES ( @artistId, @year, @albumCover, @name, @description) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[albumFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[albumFind]
  @fromParam nvarchar(MAX) = ' album ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'album'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'albumId DESC'


 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[albumGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[albumGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' album ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' albumId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'album'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'albumId DESC' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[albumRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[albumRemove]
  @albumId int 
 AS 
 BEGIN 
 delete from album where albumId = @albumId 
 END
GO
/****** Object:  StoredProcedure [dbo].[albumUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[albumUpdate]
  @albumId int,
  @artistId int,
  @year datetime,
  @albumCover nvarchar(50), 
 @name nvarchar(100), 
 @description nvarchar(MAX)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	album 
 SET  artistId =@artistId , year =@year , albumCover =@albumCover , name =@name , description =@description 
 where albumId = @albumId 
 END
GO
/****** Object:  StoredProcedure [dbo].[artistAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[artistAdd]
  @name nvarchar(250), 
 @description nvarchar(MAX)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[artist](  [name], [description]) 
  VALUES ( @name, @description) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[artistFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[artistFind]
  @fromParam nvarchar(MAX) = ' artist ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)
 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'artist'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'artistId DESC' 

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[artistGetMostVoted]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[artistGetMostVoted] 
	-- Add the parameters for the stored procedure here
	@topParam int = 10
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query nvarchar(MAX)	 
	DECLARE @top nvarchar(50)
		SET @top = CONVERT(nvarchar(50),@topParam)	

    -- Insert statements for procedure here
 SET @query = ' SELECT TOP(' + @top + ') artistId,SUM(total)as total, artistName FROM ViewSongTotalVotes GROUP BY artistId, artistName  order by total DESC'
 EXEC(@query)	    
END
GO
/****** Object:  StoredProcedure [dbo].[artistGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[artistGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' artist ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' artistId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'artist'

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else 
 set @orderBy = 'artistId DESC' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[artistRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[artistRemove]
  @artistId int 
 AS 
 BEGIN 
 delete from artist where artistId = @artistId 
 END
GO
/****** Object:  StoredProcedure [dbo].[artistUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[artistUpdate]
  @artistId int,
  @name nvarchar(250), 
 @description nvarchar(MAX)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	artist 
 SET  name =@name , description =@description 
 where artistId = @artistId 
 END
GO
/****** Object:  StoredProcedure [dbo].[battlAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[battlAdd]
  @firstSongId int,
  @secondSongId int,
  @startTime datetime,
  @endTime datetime,
  @battlDate datetime,
  @active bit
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[battl](  [firstSongId], [secondSongId], [startTime], [endTime], [battlDate],[active]) 
  VALUES ( @firstSongId, @secondSongId, @startTime, @endTime, @battlDate,@active) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[battlFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[battlFind]
  @fromParam nvarchar(MAX) = ' battl ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'battl' 
 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'battlId DESC'	 

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[battlGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[battlGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' battl ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' battlId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 
 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam	 IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'battl' 
 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = ' battlId DESC ' 	 
 
 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 
 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[battlRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[battlRemove]
  @battlId int 
 AS 
 BEGIN 
 delete from battl where battlId = @battlId 
 END
GO
/****** Object:  StoredProcedure [dbo].[battlUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[battlUpdate]
  @battlId int,
  @firstSongId int,
  @secondSongId int,
  @startTime datetime,
  @endTime datetime,
  @battlDate datetime,
  @active bit
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	battl 
 SET  firstSongId =@firstSongId , secondSongId =@secondSongId , startTime =@startTime , endTime =@endTime , battlDate =@battlDate,active=@active 
 where battlId = @battlId 
 END
GO
/****** Object:  StoredProcedure [dbo].[countByParams]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countByParams] 
  @fromParam nvarchar(MAX) = NULL, 
  @whereParam nvarchar(MAX) = NULL
AS
 DECLARE @from nvarchar(MAX)	 
 SET @from = @fromParam	 
 
DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	
 
 DECLARE @query nvarchar(MAX)	 

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	set @query = ' SELECT COUNT(*) FROM ' + @from 
		
	IF @where IS NOT NULL 
		set @query = ' SELECT COUNT(*) FROM ' + @from + ' where ' + @where
	
	 EXEC(@query)	
END
GO
/****** Object:  StoredProcedure [dbo].[discographyAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[discographyAdd]
  @artistId int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[discography](  [artistId]) 
  VALUES ( @artistId) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[discographyFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[discographyFind]
  @fromParam nvarchar(MAX) = ' discography ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam	 IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'discography' 
 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = ' discographyId DESC '   	 
 
  
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[discographyGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[discographyGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' discography ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' discographyId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam	 IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'discography' 
 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = ' discographyId DESC '    

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[discographyRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[discographyRemove]
  @discographyId int 
 AS 
 BEGIN 
 delete from discography where discographyId = @discographyId 
 END
GO
/****** Object:  StoredProcedure [dbo].[discographyUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[discographyUpdate]
  @discographyId int,
  @artistId int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	discography 
 SET  artistId =@artistId 
 where discographyId = @discographyId 
 END
GO
/****** Object:  StoredProcedure [dbo].[profileAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[profileAdd]
  @userId int,
  @picture nvarchar(550), 
 @upadted datetime,
  @removed bit
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[profile](  [userId], [picture], [upadted], [removed]) 
  VALUES ( @userId, @picture, @upadted, @removed) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[profileFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[profileFind]
  @fromParam nvarchar(MAX) = ' profile ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	
 SET @from = @fromParam	 
 else
 SET @from = ' profile '	 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = 'name' 	 


 set @orderBy = 'profileId DESC'	 
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[profileGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[profileGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' profile ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' profileId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	
 SET @from = @fromParam	 
 else
 SET @from = ' profile '	 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = 'name' 	
  
 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[profileRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[profileRemove]
  @profileId int 
 AS 
 BEGIN 
 delete from profile where profileId = @profileId 
 END
GO
/****** Object:  StoredProcedure [dbo].[profileUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[profileUpdate]
  @profileId int,
  @userId int,
  @picture nvarchar(50), 
 @upadted datetime,
  @removed bit
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	profile 
 SET  userId =@userId , picture =@picture , upadted =@upadted , removed =@removed 
 where profileId = @profileId 
 END
GO
/****** Object:  StoredProcedure [dbo].[socialAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[socialAdd]
  @userId int,
  @socialTypeId int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[social](  [userId], [socialTypeId]) 
  VALUES ( @userId, @socialTypeId) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[socialFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[socialFind]
  @fromParam nvarchar(MAX) = ' social ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	
 SET @from = @fromParam	 
 else
 SET @from = ' social '	 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = 'socialId DESC' 	


 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[socialGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[socialGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' social ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' socialId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	
 SET @from = @fromParam	 
 else
 SET @from = ' social '	 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 SET @orderBy = 'socialId DESC'  

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[socialRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[socialRemove]
  @socialId int 
 AS 
 BEGIN 
 delete from social where socialId = @socialId 
 END
GO
/****** Object:  StoredProcedure [dbo].[socialUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[socialUpdate]
  @socialId int,
  @userId int,
  @socialTypeId int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	social 
 SET  userId =@userId , socialTypeId =@socialTypeId 
 where socialId = @socialId 
 END
GO
/****** Object:  StoredProcedure [dbo].[songAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[songAdd]
  @albumId int,
  @name nvarchar(150), 
 @duration nchar,
  @trackNumber int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[song](  [albumId], [name], [duration], [trackNumber]) 
  VALUES ( @albumId, @name, @duration, @trackNumber) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[songFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[songFind]
  @fromParam nvarchar(MAX) = ' song ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'song' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'songId DESC'	 
 
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[songGetMostVoted]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[songGetMostVoted] 
	-- Add the parameters for the stored procedure here
	@topParam int = 10
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query nvarchar(MAX)	 
	DECLARE @top nvarchar(50)
		SET @top = CONVERT(nvarchar(50),@topParam)	

    -- Insert statements for procedure here
 SET @query = ' SELECT TOP(' + @top + ') artistId,SUM(total)as total, songName,albumName,artistName FROM ViewSongTotalVotes GROUP BY artistId,songName,albumName,artistName order by total DESC'
 EXEC(@query)	    
END
GO
/****** Object:  StoredProcedure [dbo].[songGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[songGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' song ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' songId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 
 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'song' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam
 else	 
 SET @orderBy = ' songId DESC ' 
 
 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[songRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[songRemove]
  @songId int 
 AS 
 BEGIN 
 delete from song where songId = @songId 
 END
GO
/****** Object:  StoredProcedure [dbo].[songUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[songUpdate]
  @songId int,
  @albumId int,
  @name nvarchar(150), 
 @duration nchar,
  @trackNumber int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	song 
 SET  albumId =@albumId , name =@name , duration =@duration , trackNumber =@trackNumber 
 where songId = @songId 
 END
GO
/****** Object:  StoredProcedure [dbo].[tagAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tagAdd]
  @ownerTableId int,
  @ownerId int,
  @name nvarchar(250)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[tag](  [ownerTableId], [ownerId], [name]) 
  VALUES ( @ownerTableId, @ownerId, @name) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[tagFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tagFind]
  @fromParam nvarchar(MAX) = ' tag ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'tag' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'tagId DESC'	

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[tagGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tagGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' tag ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' tagId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'tag' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'tagId DESC'	 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[tagRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tagRemove]
  @tagId int 
 AS 
 BEGIN 
 delete from tag where tagId = @tagId 
 END
GO
/****** Object:  StoredProcedure [dbo].[tagUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tagUpdate]
  @tagId int,
  @ownerTableId int,
  @ownerId int,
  @name nvarchar(250)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	tag 
 SET  ownerTableId =@ownerTableId , ownerId =@ownerId , name =@name 
 where tagId = @tagId 
 END
GO
/****** Object:  StoredProcedure [dbo].[usuarioAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioAdd]
  @name nvarchar(150), 
 @birthdate datetime = null,
  @password nvarchar(255), 
 @created datetime,
  @udated datetime = NULL,
  @gender nvarchar(1)= 'U',
  @customId nvarchar(50) = null,
  @email nvarchar(255)= null,
  @country nvarchar(100) = null,
  @city nvarchar(250) = null
 AS 
 BEGIN 
 SET NOCOUNT ON;	
 
 DECLARE @bd datetime
	SET @bd = NULL	 	
	
 DECLARE @ud datetime

 IF @birthdate IS NOT NULL	
	set @bd = @birthdate

IF @udated IS NULL	
	set @ud =  @created	
 
 INSERT	 
 INTO	[usuario](  [name], [birthdate], [password], [created], [udated], [gender],[customId],[email],[country],[city]) 
  VALUES ( @name, @birthdate, @password, @created, @ud, @gender,@customId,@email,@country,@city) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[usuarioFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioFind]
  @fromParam nvarchar(MAX) = ' usuario ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' usuario '


 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'usuarioId DESC'	 

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[usuarioGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' usuario ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' usuarioId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' usuario '


 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'usuarioId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[usuarioRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioRemove]
  @usuarioId int 
 AS 
 BEGIN 
 delete from usuario where usuarioId = @usuarioId 
 END
GO
/****** Object:  StoredProcedure [dbo].[usuarioUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioUpdate]
  @usuarioId int,
  @name nvarchar(150), 
 @birthdate datetime=null,
  @password nvarchar(255)='', 
 @created datetime,
  @udated datetime,
  @gender nvarchar(1),
  @customId nvarchar(50) =null,
  @email nvarchar(255),
  @country nvarchar(100) = null,
  @city nvarchar(250) = null
 AS 
	
 
 IF @password =''
	BEGIN 
	SET NOCOUNT ON;
	UPDATE	usuario  
		SET  name =@name , birthdate =@birthdate , udated =@udated , gender =@gender, customId =@customId ,email =@email,country =@country,city =@city 
		where usuarioId = @usuarioId 
	END
 ElSE
	BEGIN
	SET NOCOUNT ON;
	UPDATE	usuario 
		SET  name =@name , birthdate =@birthdate , password=@password, udated =@udated , gender =@gender, customId =@customId ,email =@email,country =@country,city =@city 	
		where usuarioId = @usuarioId 
	END
GO
/****** Object:  StoredProcedure [dbo].[viewActivityByHourAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewActivityByHourAdd]
  @hour varchar,
  @totalByHour int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewActivityByHour](  [hour], [totalByHour]) 
  VALUES ( @hour, @totalByHour) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewActivityByHourFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewActivityByHourFind]
  @fromParam nvarchar(MAX) = ' ViewActivityByHour ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' hour desc ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' ViewActivityByHour '


 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'hour desc'

 
 set @query = ' SELECT DISTINCT * FROM ViewActivityByHour order by '+ @orderBy	
 	 
 IF @whereParam IS NOT NULL	 
	set @query = 'SELECT DISTINCT * FROM ViewActivityByHour where '+ @where + ' order by '+ @orderBy	
	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewActivityByHourGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewActivityByHourGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewActivityByHour ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewActivityByHourId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' ViewActivityByHour '


 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'viewActivityByHourId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesAdd]
  @songId int,
  @total int,
  @songName nvarchar(150), 
 @albumName nvarchar(100), 
 @artistName nvarchar(250), 
 @artistId int,
  @albumCover nvarchar(50)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewAlbumArtistSongTotalVotes](  [songId], [total], [songName], [albumName], [artistName], [artistId], [albumCover]) 
  VALUES ( @songId, @total, @songName, @albumName, @artistName, @artistId, @albumCover) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesByArtistAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesByArtistAdd]
  @artistId int,
  @total int,
  @albumName nvarchar(100), 
 @artistName nvarchar(250), 
 @albumCover nvarchar(50), 
 @picture nvarchar(350)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewAlbumArtistSongTotalVotesByArtist](  [artistId], [total], [albumName], [artistName], [albumCover], [picture]) 
  VALUES ( @artistId, @total, @albumName, @artistName, @albumCover, @picture) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesByArtistFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesByArtistFind]
  @fromParam nvarchar(MAX) = ' viewAlbumArtistSongTotalVotesByArtist ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'total desc' ,
 @pageNumber int = 0,
 @rowCount int = 4
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' viewAlbumArtistSongTotalVotesByArtist '
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'total DESC' 

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY total DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	  
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesByArtistGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesByArtistGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewAlbumArtistSongTotalVotesByArtist ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' total DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' viewAlbumArtistSongTotalVotesByArtist '

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'total DESC'  

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesFind]
 @fromParam nvarchar(MAX) = ' viewAlbumArtistSongTotalVotes', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'totalVotes' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' viewAlbumArtistSongTotalVotes '
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC'

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY totalVotes DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewAlbumArtistSongTotalVotes ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' total DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' viewAlbumArtistSongTotalVotes '

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'total DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesGroupedByArtist]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesGroupedByArtist]
@whereParam nvarchar(MAX) = NULL ,
@topParam int = 10
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query nvarchar(MAX)
	DECLARE @where nvarchar(MAX)	
	DECLARE @top nvarchar(50)	 
	
SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
set @where = CONVERT(nvarchar(MAX),@whereParam)

 set @query = ' SELECT   DISTINCT '+ @top + 'artistId, SUM(total) AS totalVotes, albumName, artistName, albumCover,picture'
	 + ' FROM viewAlbumArtistSongTotalVotes '
	 + ' GROUP BY artistId, albumName, artistName,albumCover, picture ' 
	 + ' order by totalVotes desc '
 IF @whereParam IS NOT NULL	 
 set @query = ' SELECT DISTINCT '+ @top + 'artistId, SUM(total) AS totalVotes, albumName, artistName,albumCover, picture '
	 + ' FROM viewAlbumArtistSongTotalVotes '
	 + ' where '+ @where 
	 + ' GROUP BY artistId, albumName, artistName, picture'	
	 + ' order by totalVotes desc ' 
 EXEC(@query)
 END
GO
/****** Object:  StoredProcedure [dbo].[viewAlbumArtistSongTotalVotesGroupedBySong]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



 CREATE PROCEDURE [dbo].[viewAlbumArtistSongTotalVotesGroupedBySong]
 @fromParam nvarchar(MAX) = ' ViewTopSongs', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'total DESC' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL
 SET @from = @fromParam	 
 else
 SET @from = ' ViewTopSongs '
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam 
     else
		 SET @where = '' 
  
 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'total desc' 

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT songId,artistId, songName, artistName, albumName, albumCover,SUM(totalVotes) as total, ROW_NUMBER() OVER(ORDER BY totalVotes DESC) AS ROW ' +
    ' FROM ' + @from + 
     @where  +  	
    ' group by songId,artistId, songName, artistName, albumName, albumCover, totalVotes )' + 
	' SELECT  DISTINCT * '+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewArtistContactFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewArtistContactFind]
  @fromParam nvarchar(MAX) = ' viewArtistContact ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 
 DECLARE @from nvarchar(MAX)
	IF @fromParam IS NOT NULL		 
		SET @from = @fromParam	 
	else
		SET @from = ' viewArtistContact '	 
 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'ArtistId DESC'	 

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewArtistContactGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewArtistContactGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewArtistContact ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' ArtistId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)
	IF @fromParam IS NOT NULL		 
		SET @from = @fromParam	 
	else
		SET @from = ' viewArtistContact '	

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'ArtistId DESC'	  

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewArtistsAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewArtistsAdd]
  @artistId int,
  @name nvarchar(250), 
 @description nvarchar(MAX), 
 @picture nvarchar(350)
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewArtists](  [artistId], [name], [description], [picture]) 
  VALUES ( @artistId, @name, @description, @picture) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewArtistsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewArtistsFind]
@fromParam nvarchar(MAX) = ' viewArtists ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)
	IF @fromParam IS NOT NULL		 
		SET @from = @fromParam	 
	else
		SET @from = ' viewArtists '	 
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	
 SET @orderBy = @orderByParam	 
 else
		SET @orderBy = ' name '	

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY name ) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)  
 END
GO
/****** Object:  StoredProcedure [dbo].[viewArtistsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewArtistsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewArtists ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewArtistsId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)
	IF @fromParam IS NOT NULL		 
		SET @from = @fromParam	 
	else
		SET @from = ' viewArtists '	


 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	
 SET @orderBy = @orderByParam	 
 else
		SET @orderBy = ' name '	 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewBattlFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewBattlFind]
  @fromParam nvarchar(MAX) = ' viewBattl ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewBattl' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'BattlId DESC'	 

 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewBattlGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewBattlGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewBattl ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' BattlId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewBattl' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'BattlId DESC'	 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewBattlResultsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewBattlResultsFind]
  @fromParam nvarchar(MAX) = ' viewBattlResults ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewBattlResults' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'viewBattlResultsId DESC'
  
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewBattlResultsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewBattlResultsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewBattlResults ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewBattlResultsId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewBattlResults' 
 	 
 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 
  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'viewBattlResultsId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewGenderTotalFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewGenderTotalFind]
 @fromParam nvarchar(MAX) = NULL, 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = NULL
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 set @query = ' SELECT DISTINCT * FROM ViewGenderTotals '	  
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewGenderTotalGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewGenderTotalGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewGenderTotal ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewGenderTotalId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewGenderTotal' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'viewGenderTotalId DESC'

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewGenderTotalRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewGenderTotalRemove]
  @viewGenderTotalId int 
 AS 
 BEGIN 
 delete from viewGenderTotal where viewGenderTotalId = @viewGenderTotalId 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewPastBattlsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewPastBattlsFind]
 @fromParam nvarchar(MAX) = ' viewPastBattls ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' battlId ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)
  IF @fromParam IS NULL	
      SET @from = ' viewPastBattls '	 
     else
		 SET @from = @fromParam	 
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	
	SET @orderBy = @orderByParam	
	 else
		 SET @orderBy = 'battlId'  

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY viewPastBattls.battlId DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewPastBattlsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewPastBattlsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewPastBattls ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewPastBattlsId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)
  IF @fromParam IS NULL	
      SET @from = ' viewPastBattls '	 
     else
		 SET @from = @fromParam	 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	
	SET @orderBy = @orderByParam	
	 else
		 SET @orderBy = 'viewPastBattlsId DESC'   

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopAlbumsAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopAlbumsAdd]
  @artistId int,
  @totalVotes int,
  @albumName nvarchar(100), 
 @artistName nvarchar(250), 
 @albumCover nvarchar(50), 
 @battlDate datetime
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewTopAlbums](  [artistId], [totalVotes], [albumName], [artistName], [albumCover], [battlDate]) 
  VALUES ( @artistId, @totalVotes, @albumName, @artistName, @albumCover, @battlDate) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewTopAlbumsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopAlbumsFind]
  @fromParam nvarchar(MAX) = ' viewTopAlbums ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'totalVotes DESC' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopAlbums' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC'
 	 
 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopAlbumsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopAlbumsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewTopAlbums ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' totalVotes DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopAlbums' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopAlbumsGroupedByAlbum]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[viewTopAlbumsGroupedByAlbum]
@whereParam nvarchar(MAX) = NULL ,
@topParam int = 10,
@orderByParam nvarchar(MAX) = 'totalVotes desc' 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query nvarchar(MAX)
	DECLARE @where nvarchar(MAX)	
	DECLARE @top nvarchar(50)	
	DECLARE @orderBy nvarchar(MAX)	 
	
SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
set @where = CONVERT(nvarchar(MAX),@whereParam)
set @orderBy = @orderByParam

 set @query = ' SELECT   DISTINCT '+ @top + 'artistId, SUM(totalVotes) AS totalVotes, albumName, artistName, albumCover'
	 + ' FROM viewTopAlbums '
	 + ' GROUP BY artistId, albumName, artistName, albumCover ' 
	 + ' order by totalVotes desc '
 IF @whereParam IS NOT NULL	 
 set @query = ' SELECT DISTINCT '+ @top + 'artistId, SUM(totalVotes) AS totalVotes, albumName, artistName, albumCover '
	 + ' FROM viewTopAlbums '
	 + ' where '+ @where 
	 + ' GROUP BY artistId, albumName, artistName, albumCover'	
	 + ' order by '+ @orderBy 
 EXEC(@query)	 
END
GO
/****** Object:  StoredProcedure [dbo].[viewTopAlbumsGroupedByDay]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[viewTopAlbumsGroupedByDay]
@whereParam nvarchar(MAX) = NULL ,
@topParam int = 10,
@orderByParam  nvarchar(MAX) = 'totalVotes desc'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @query nvarchar(MAX)
	DECLARE @where nvarchar(MAX)	
	DECLARE @orderBy nvarchar(MAX)
	DECLARE @top nvarchar(50)	 
	
SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
set @where = CONVERT(nvarchar(MAX),@whereParam)
set @orderBy = CONVERT(nvarchar(MAX),@orderByParam)

 set @query = ' SELECT   DISTINCT '+ @top + 'artistId, SUM(totalVotes) AS totalVotes, albumName, artistName, albumCover, battlDate '
	 + ' FROM viewTopAlbums '
	 + ' GROUP BY artistId, albumName, artistName, albumCover, battlDate ' 
	 + ' order by totalVotes desc '
 IF @whereParam IS NOT NULL	 
 set @query = ' SELECT DISTINCT '+ @top + 'artistId, SUM(totalVotes) AS totalVotes, albumName, artistName, albumCover, battlDate '
	 + ' FROM viewTopAlbums '
	 + ' where '+ @where 
	 + ' GROUP BY artistId, albumName, artistName, albumCover, battlDate '	
	 + ' order by ' + @orderBy
 EXEC(@query)	 
END
GO
/****** Object:  StoredProcedure [dbo].[viewTopSongsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopSongsFind]
 @fromParam nvarchar(MAX) = ' viewTopSongsPercentage ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'totalVotes DESC ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopSongsPercentage' 
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC' 

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY totalVotes DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	   
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopSongsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopSongsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewTopSongs ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' songId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopSongs'  

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'songId DESC' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopUsersFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopUsersFind]
@fromParam nvarchar(MAX) = ' viewTopUsersPercentage ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'totalVotes DESC ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopUsersPercentage'  
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC' 

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY totalVotes DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query) 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewTopUsersGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewTopUsersGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewTopUsers ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' totalVotes DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewTopUsers'  

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalVotes DESC' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserAgesAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserAgesAdd]
  @age int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[viewUserAges](  [age]) 
  VALUES ( @age) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[viewUserAgesFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserAgesFind]
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 set @query = ' SELECT DISTINCT * FROM ViewUserAges'
 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserAgesGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserAgesGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewUserAges ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = NULL
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewUserAges' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'age DESC'  

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserBattlResultFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserBattlResultFind]
 @fromParam nvarchar(MAX) = ' viewUserBattlWonLostResult ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' battlId DESC ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewUserBattlWonLostResult' 

 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'battlId DESC'  
 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

	 
set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY viewUserBattlWonLostResult.battlId DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy

 EXEC(@query)	 
 
END
GO
/****** Object:  StoredProcedure [dbo].[viewUserBattlResultGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserBattlResultGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewUserBattlResult ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' viewUserBattlResult.battlId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewUserBattlResult' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'viewUserBattlResult.battlId DESC '  

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserFavoritesSongsFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserFavoritesSongsFind]
 @fromParam nvarchar(MAX) = ' viewUserFavoritesSongs ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'totalSong DESC ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewUserFavoritesSongs' 
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'totalSong DESC ' 

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY totalSong DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	  
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserFavoritesSongsGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserFavoritesSongsGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewUserFavoritesSongs ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' songId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = 'viewUserFavoritesSongs' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

  DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'songId DESC ' 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserTotalVotesFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserTotalVotesFind]
 @fromParam nvarchar(MAX) = ' viewUserTotalVotes ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'total DESC ' ,
 @pageNumber int = 0,
 @rowCount int = 5
 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 
 DECLARE @query nvarchar(MAX)	
  
 DECLARE @from nvarchar(MAX)	
     IF @fromParam	IS NOT NULL	 
		SET @from = @fromParam	 
	 else
		SET @from = ' viewUserTotalVotes '
 
 DECLARE @where nvarchar(MAX)	 
     IF @whereParam IS NOT NULL	
      SET @where = ' where ' + @whereParam + ')'
     else
		 SET @where = ')' 
  
 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam	IS NOT NULL	 
	SET @orderBy = @orderByParam	 
else
	SET @orderBy = 'total DESC '

 
  DECLARE @wherePaging nvarchar(MAX)	 
	IF @pageNumber=0 
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, @pageNumber) + ' AND ' + convert(varchar, (@rowCount)) 
	ELSE
	 SET @wherePaging = ' WHERE     ROW BETWEEN ' + convert(varchar, (@pageNumber * @rowCount)+1) + ' AND ' + convert(varchar, (@rowCount * (@pageNumber+1))) 

 
 set @query = ' WITH DATA AS ('+
    ' SELECT    *,'+
	' ROW_NUMBER() OVER(ORDER BY total DESC) AS ROW '+
    ' FROM ' + @from + 
     @where  +  	
	' SELECT    DISTINCT *'+
	' FROM      DATA ' +
	@wherePaging + 
	' ORDER BY  ' + @orderBy
	
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[viewUserTotalVotesGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[viewUserTotalVotesGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' viewUserTotalVotes ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' battlId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)	
  
 DECLARE @from nvarchar(MAX)	
     IF @fromParam	IS NOT NULL	 
		SET @from = @fromParam	 
	 else
		SET @from = ' viewUserTotalVotes '

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)	 
 IF @orderByParam	IS NOT NULL	 
	SET @orderBy = @orderByParam	 
else
	SET @orderBy = 'battlId DESC '

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[voteAdd]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[voteAdd]
  @battlId int,
  @songId int,
  @profileId int,
  @votes int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 INSERT	 
 INTO	[vote](  [battlId], [songId], [profileId], [votes]) 
  VALUES ( @battlId, @songId, @profileId, @votes) 
 SELECT SCOPE_IDENTITY() END
GO
/****** Object:  StoredProcedure [dbo].[voteFind]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[voteFind]
  @fromParam nvarchar(MAX) = ' vote ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = 'name' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 

 DECLARE @from nvarchar(MAX)	 
 IF @fromParam	  IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = ' vote ' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 
 DECLARE @orderBy nvarchar(MAX)	 
 
 SET @orderBy = @orderByParam	 
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'voteId DESC'	 


 set @query = ' SELECT DISTINCT * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT DISTINCT * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[voteGetTop]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[voteGetTop]
  @topParam int = 10, 
 @fromParam nvarchar(MAX) = ' vote ', 
 @whereParam nvarchar(MAX) = NULL, 
 @orderByParam nvarchar(MAX) = ' voteId DESC ' 
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 DECLARE @query nvarchar(MAX)	 
 DECLARE @top nvarchar(50)	 
 SET @top = ' TOP ' + CONVERT(nvarchar(50),@topParam)
 	 
 DECLARE @from nvarchar(MAX)	 
 IF @fromParam	  IS NOT NULL	 
 SET @from = @fromParam	 
 else
 SET @from = ' vote ' 

 DECLARE @where nvarchar(MAX)	 
 SET @where = @whereParam	 

 DECLARE @orderBy nvarchar(MAX)  
 IF @orderByParam IS NOT NULL	 
 SET @orderBy = @orderByParam	 
 else
 set @orderBy = 'voteId DESC'	 

 set @query = ' SELECT ' + @top + ' * FROM ' + @from + ' order by '+ @orderBy		 
 IF @whereParam IS NOT NULL	 
 set @query = 'SELECT ' + @top + ' * FROM ' + @from +' where '+ @where + ' order by '+ @orderBy	 
 EXEC(@query)	 
 END
GO
/****** Object:  StoredProcedure [dbo].[voteRemove]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[voteRemove]
  @voteId int 
 AS 
 BEGIN 
 delete from vote where voteId = @voteId 
 END
GO
/****** Object:  StoredProcedure [dbo].[voteUpdate]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[voteUpdate]
  @voteId int,
  @battlId int,
  @songId int,
  @profileId int,
  @votes int
 AS 
 BEGIN 
 SET NOCOUNT ON;	 
 UPDATE	vote 
 SET  battlId =@battlId , songId =@songId , profileId =@profileId , votes =@votes 
 where voteId = @voteId 
 END
GO
/****** Object:  Table [dbo].[action]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action](
	[actionId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_action] PRIMARY KEY CLUSTERED 
(
	[actionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[activityLog]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activityLog](
	[activityLogId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[actionId] [int] NOT NULL,
	[data] [datetime] NOT NULL,
 CONSTRAINT [PK_activityLog] PRIMARY KEY CLUSTERED 
(
	[activityLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[address]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[profileId] [int] NOT NULL,
	[country] [nvarchar](150) NULL,
	[city] [nvarchar](150) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[album]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[album](
	[albumId] [int] IDENTITY(1,1) NOT NULL,
	[artistId] [int] NOT NULL,
	[year] [datetime] NULL,
	[albumCover] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_album] PRIMARY KEY CLUSTERED 
(
	[albumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[artist]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist](
	[artistId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[description] [nvarchar](max) NULL,
	[picture] [nvarchar](350) NULL,
 CONSTRAINT [PK_artist] PRIMARY KEY CLUSTERED 
(
	[artistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[artistContact]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artistContact](
	[idArtistContact] [int] IDENTITY(1,1) NOT NULL,
	[bandcamp] [nvarchar](250) NULL,
	[soundcloud] [nvarchar](250) NULL,
	[website] [nvarchar](250) NULL,
	[tumblr] [nvarchar](250) NULL,
	[facebook] [nvarchar](250) NULL,
	[twitter] [nvarchar](250) NULL,
	[artistId] [int] NULL,
	[email] [nvarchar](250) NULL,
 CONSTRAINT [PK_artistContact] PRIMARY KEY CLUSTERED 
(
	[idArtistContact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[battl]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[battl](
	[battlId] [int] IDENTITY(1,1) NOT NULL,
	[firstSongId] [int] NOT NULL,
	[secondSongId] [int] NOT NULL,
	[startTime] [datetime] NOT NULL,
	[endTime] [datetime] NOT NULL,
	[battlDate] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_battl] PRIMARY KEY CLUSTERED 
(
	[battlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discography]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discography](
	[discographyId] [int] IDENTITY(1,1) NOT NULL,
	[artistId] [int] NOT NULL,
 CONSTRAINT [PK_discography] PRIMARY KEY CLUSTERED 
(
	[discographyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ownerTable]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ownerTable](
	[ownerTableId] [int] NOT NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_ownerTable] PRIMARY KEY CLUSTERED 
(
	[ownerTableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profile]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[profileId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[picture] [nvarchar](550) NOT NULL,
	[upadted] [datetime] NOT NULL,
	[removed] [bit] NOT NULL,
 CONSTRAINT [PK_profile] PRIMARY KEY CLUSTERED 
(
	[profileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[social]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social](
	[socialId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[socialTypeId] [int] NULL,
 CONSTRAINT [PK_social] PRIMARY KEY CLUSTERED 
(
	[socialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[socialType]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[socialType](
	[socialTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_socialType] PRIMARY KEY CLUSTERED 
(
	[socialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[song]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[song](
	[songId] [int] IDENTITY(1,1) NOT NULL,
	[albumId] [int] NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[duration] [nchar](8) NOT NULL,
	[trackNumber] [int] NOT NULL,
	[soundCloudUrl] [nvarchar](550) NULL,
 CONSTRAINT [PK_song] PRIMARY KEY CLUSTERED 
(
	[songId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tag]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag](
	[tagId] [int] IDENTITY(1,1) NOT NULL,
	[ownerTableId] [int] NOT NULL,
	[ownerId] [int] NOT NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_tag] PRIMARY KEY CLUSTERED 
(
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempTable]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempTable](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[birthdate] [datetime] NULL,
	[password] [nvarchar](8) NOT NULL,
	[created] [datetime] NOT NULL,
	[udated] [datetime] NULL,
	[gender] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[birthdate] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[created] [datetime] NOT NULL,
	[udated] [datetime] NULL,
	[gender] [nvarchar](1) NOT NULL,
	[customId] [nvarchar](50) NULL,
	[email] [nvarchar](255) NULL,
	[country] [nvarchar](100) NULL,
	[city] [nvarchar](250) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vote]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vote](
	[voteId] [int] IDENTITY(1,1) NOT NULL,
	[battlId] [int] NULL,
	[songId] [int] NOT NULL,
	[profileId] [int] NOT NULL,
	[votes] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewAlbumArtistSongTotalVotes]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAlbumArtistSongTotalVotes]
AS
SELECT     TOP (100) PERCENT dbo.vote.songId, SUM(dbo.vote.votes) AS total, dbo.song.name AS songName, dbo.album.name AS albumName, dbo.artist.name AS artistName, 
                      dbo.artist.artistId, dbo.album.albumCover, dbo.battl.battlDate, dbo.artist.picture,dbo.battl.battlId
FROM         dbo.album INNER JOIN
                      dbo.artist ON dbo.album.artistId = dbo.artist.artistId INNER JOIN
                      dbo.song ON dbo.album.albumId = dbo.song.albumId INNER JOIN
                      dbo.vote ON dbo.song.songId = dbo.vote.songId INNER JOIN
                      dbo.battl ON dbo.vote.battlId = dbo.battl.battlId
GROUP BY dbo.vote.songId, dbo.song.name, dbo.album.name, dbo.artist.name, dbo.artist.artistId, dbo.album.albumCover, dbo.battl.battlDate,dbo.battl.battlId, 
                      dbo.artist.picture
ORDER BY artistName
GO
/****** Object:  View [dbo].[ViewAlbumArtistSongTotalVotesByArtist]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAlbumArtistSongTotalVotesByArtist]
AS
SELECT   DISTINCT artistId, SUM(total) AS total, albumName, artistName, albumCover,picture
FROM         dbo.viewAlbumArtistSongTotalVotes 
GROUP BY artistId, albumName, artistName,albumCover, picture
GO
/****** Object:  View [dbo].[ViewBattl]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewBattl]
AS
SELECT DISTINCT 
                      TOP (100) PERCENT battl.battlId, battl.active, battl.firstSongId, battl.startTime, battl.endTime, battl.battlDate, album.albumCover AS firstAlbumCover, 
                      song.name AS firstSongName, album.name AS firstAlbumName, battl.secondSongId, artist.name AS firstArtistName, artist.artistId AS firstArtistId, 
                      song.soundCloudUrl AS firstSoundCloudUrl, ISNULL((SELECT SUM(votes) AS votes FROM vote WHERE (battlId = battl.battlId) AND (songId = battl.firstSongId)),0) AS firstSongVotes, song_1.soundCloudUrl AS secondSoundCloudUrl, 
                      song_1.name AS secondSongName, album_1.albumCover AS secondAlbumCover, album_1.name AS secondAlbumName, artist_1.artistId AS secondArtistId, 
                      artist_1.name AS secondArtistName, ISNULL((SELECT SUM(votes) AS votes FROM vote WHERE (battlId = battl.battlId) AND (songId = battl.secondSongId)),0) AS secondSongVotes
FROM         song AS song_1 INNER JOIN
                      song INNER JOIN
                      album ON song.albumId = album.albumId INNER JOIN
                      battl ON song.songId = battl.firstSongId INNER JOIN
                      artist ON album.artistId = artist.artistId ON song_1.songId = battl.secondSongId INNER JOIN
                      album AS album_1 ON song_1.albumId = album_1.albumId INNER JOIN
                      artist AS artist_1 ON album_1.artistId = artist_1.artistId LEFT OUTER JOIN
                      vote ON battl.firstSongId = vote.songId AND battl.battlId = vote.battlId LEFT OUTER JOIN
                      vote AS vote_1 ON battl.secondSongId = vote_1.songId AND battl.battlId = vote_1.battlId
ORDER BY battl.battlId DESC
GO
/****** Object:  View [dbo].[ViewBattlResults]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewBattlResults]
AS
SELECT     battlId, firstSongId, firstArtistName, firstSongName, secondSongId, secondArtistName, secondSongName, firstAlbumName, firstAlbumCover, secondAlbumCover, 
                      secondAlbumName, secondArtistId, firstArtistId, battlDate, active, firstSongVotes as totalFirst, secondSongVotes as totalSecond
FROM         ViewBattl
WHERE     (active = 0)
GO
/****** Object:  View [dbo].[ViewPastBattls]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPastBattls]
AS
/*SELECT     dbo.battl.battlId, dbo.battl.active, dbo.battl.firstSongId, dbo.song.albumId AS firstAlbumId, dbo.album.artistId AS firstArtistId, dbo.song.name AS firstSongName, 
                      dbo.album.name AS firstAlbumName, dbo.artist.name AS firstArtistName, dbo.battl.secondSongId, song_1.albumId AS secondAlbumId, 
                      album_1.artistId AS secondArtistId, song_1.name AS secondSongName, album_1.name AS secondAlbumName, artist_1.name AS secondArtistName, 
                      dbo.album.albumCover AS firstAlbumCover, album_1.albumCover AS secondAlbumCover
FROM         dbo.song INNER JOIN
                      dbo.battl ON dbo.song.songId = dbo.battl.firstSongId INNER JOIN
                      dbo.album ON dbo.song.albumId = dbo.album.albumId INNER JOIN
                      dbo.artist ON dbo.album.artistId = dbo.artist.artistId INNER JOIN
                      dbo.song AS song_1 ON dbo.battl.secondSongId = song_1.songId INNER JOIN
                      dbo.album AS album_1 ON song_1.albumId = album_1.albumId INNER JOIN
                      dbo.artist AS artist_1 ON album_1.artistId = artist_1.artistId
                      
where dbo.battl.active =0-*/
SELECT     ViewBattlResults.battlId, ViewBattlResults.firstSongId, ViewBattlResults.secondSongId, ViewBattlResults.totalFirst, ViewBattlResults.firstAlbumCover, 
                      ViewBattlResults.secondAlbumCover, ViewBattlResults.secondAlbumName, ViewBattlResults.secondArtistId, ViewBattlResults.firstArtistId, ViewBattlResults.battlDate, 
                      ViewBattlResults.firstAlbumName, ViewBattlResults.totalSecond, ViewBattlResults.secondSongName, ViewBattlResults.secondArtistName, 
                      ViewBattlResults.firstSongName, ViewBattlResults.firstArtistName, battl.active
FROM         ViewBattlResults INNER JOIN
                      battl ON ViewBattlResults.battlId = battl.battlId
WHERE     (battl.active = 0)
GO
/****** Object:  View [dbo].[ViewTopAlbums]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTopAlbums]
AS
SELECT     artistId, SUM(total) as totalVotes, albumName, artistName, albumCover, Convert(Date, Convert(VarChar, battlDate)) as battlDate
FROM         dbo.ViewAlbumArtistSongTotalVotes
GROUP BY artistId,albumName, artistName, albumCover,battlDate
GO
/****** Object:  View [dbo].[ViewTopSongs]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTopSongs]
AS
SELECT     TOP (100) PERCENT artistId, songId, songName, artistName, albumName, albumCover, SUM(total) AS totalVotes,Convert(Date, Convert(VarChar, battlDate)) as battlDate
FROM         dbo.ViewAlbumArtistSongTotalVotes
GROUP BY artistId, songId, songName, artistName, albumName, albumCover, battlDate
ORDER BY totalVotes DESC
GO
/****** Object:  View [dbo].[ViewTopSongsPercentage]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTopSongsPercentage]
AS
SELECT     TOP (1000) artistId, songId, songName, artistName, albumName, albumCover, totalVotes, CONVERT(decimal, totalVotes) / 100 *
                          (SELECT     SUM(totalVotes) AS Expr1
                            FROM          dbo.ViewTopSongs) AS percentage
FROM         dbo.ViewTopSongs AS ViewTopSongs_1
ORDER BY totalVotes DESC
GO
/****** Object:  View [dbo].[ViewUserBattlResult]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserBattlResult]
AS


SELECT    ViewBattlResults.battlId, ViewBattlResults.firstSongId, ViewBattlResults.secondSongId, ViewBattlResults.totalFirst, ViewBattlResults.firstAlbumCover, 
                      ViewBattlResults.secondAlbumCover, ViewBattlResults.secondAlbumName, ViewBattlResults.secondArtistId, ViewBattlResults.firstArtistId, ViewBattlResults.battlDate, 
                      ViewBattlResults.firstAlbumName, ViewBattlResults.totalSecond, ViewBattlResults.secondSongName, ViewBattlResults.secondArtistName, 
                      ViewBattlResults.firstSongName, ViewBattlResults.firstArtistName, vote.profileId AS profileIdFirst, vote_1.profileId AS profileIdSecond
FROM         ViewBattlResults LEFT OUTER JOIN
                      vote ON ViewBattlResults.firstSongId = vote.songId LEFT OUTER JOIN
                      vote AS vote_1 ON ViewBattlResults.secondSongId = vote_1.songId
GO
/****** Object:  View [dbo].[ViewUserBattlWonLostResult]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserBattlWonLostResult]
AS
SELECT     battlId, firstSongId, secondSongId, totalFirst, firstAlbumCover, secondAlbumCover, secondAlbumName, firstArtistId, secondArtistId, battlDate, firstAlbumName, 
                      totalSecond, secondSongName, secondArtistName, firstSongName, firstArtistName, profileIdFirst, profileIdSecond
FROM         dbo.ViewUserBattlResult
GROUP BY battlId, firstSongId, secondSongId, totalFirst, firstAlbumCover, secondAlbumCover, secondAlbumName, firstArtistId, secondArtistId, battlDate, firstAlbumName, 
                      totalSecond, secondSongName, secondArtistName, firstSongName, firstArtistName, profileIdFirst, profileIdSecond
GO
/****** Object:  View [dbo].[ViewUserTotalVotes]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserTotalVotes]
AS
SELECT       SUM(vote.votes) AS total, usuario.name, profile.profileId, profile.picture
FROM         vote INNER JOIN
                      profile ON vote.profileId = profile.profileId INNER JOIN
                      usuario ON profile.userId = usuario.usuarioId INNER JOIN
                      song ON vote.songId = song.songId
GROUP BY  profile.profileId,usuario.name,profile.picture
GO
/****** Object:  View [dbo].[ViewTopUsers]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTopUsers]
AS
SELECT     TOP (100) PERCENT profileId, SUM(total) AS totalVotes, name, picture
FROM         dbo.ViewUserTotalVotes
GROUP BY profileId, name, picture
ORDER BY totalVotes DESC
GO
/****** Object:  View [dbo].[ViewTopUsersPercentage]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTopUsersPercentage]
AS
SELECT     TOP (1000) profileId, name,picture, totalVotes, CONVERT(decimal, totalVotes) / 100 *
                          (SELECT     SUM(totalVotes) AS Expr1
                            FROM          dbo.ViewTopUsers) AS percentage
FROM         dbo.ViewTopUsers AS ViewTopUsers_1
ORDER BY totalVotes DESC
GO
/****** Object:  View [dbo].[ViewUserTotalVotesBySong]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserTotalVotesBySong]
AS
SELECT       SUM(vote.votes) AS total, usuario.name, profile.profileId, profile.picture,song.songId
FROM         vote INNER JOIN
                      profile ON vote.profileId = profile.profileId INNER JOIN
                      usuario ON profile.userId = usuario.usuarioId INNER JOIN
                      song ON vote.songId = song.songId
GROUP BY  profile.profileId,usuario.name,profile.picture,song.songId
GO
/****** Object:  View [dbo].[ViewUserFavoritesSongs]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserFavoritesSongs]
AS
SELECT      dbo.ViewUserTotalVotesBySong.profileId,dbo.ViewUserTotalVotesBySong.songId, SUM(dbo.ViewUserTotalVotesBySong.total) AS totalSong, 
                      dbo.song.albumId, dbo.album.artistId, dbo.album.albumCover, dbo.album.name AS albumName, dbo.artist.name AS artistName, dbo.song.name as songName
FROM         dbo.album INNER JOIN
                      dbo.song ON dbo.album.albumId = dbo.song.albumId INNER JOIN
                      dbo.artist ON dbo.album.artistId = dbo.artist.artistId RIGHT OUTER JOIN
                      dbo.ViewUserTotalVotesBySong ON dbo.song.songId = dbo.ViewUserTotalVotesBySong.songId
GROUP BY dbo.ViewUserTotalVotesBySong.songId, dbo.ViewUserTotalVotesBySong.profileId, dbo.song.albumId, dbo.album.artistId, dbo.album.albumCover, dbo.album.name, dbo.artist.name, 
                       dbo.song.name,dbo.song.songId
GO
/****** Object:  View [dbo].[ViewActivityByHour]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewActivityByHour]
AS
SELECT     CONVERT(varchar(2), data, 8) AS hour, COUNT(*) AS totalByHour
FROM         dbo.activityLog
WHERE     (actionId = 929)
GROUP BY CONVERT(varchar(2), data, 8)
GO
/****** Object:  View [dbo].[ViewAlbumArtistSongTotalVotesIon]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAlbumArtistSongTotalVotesIon]
AS
SELECT     TOP (100) PERCENT dbo.vote.songId, SUM(dbo.vote.votes) AS total, dbo.song.name AS songName, dbo.album.name AS albumName, dbo.artist.name AS artistName, 
                      dbo.artist.artistId, dbo.album.albumCover, dbo.artist.picture
FROM         dbo.album INNER JOIN
                      dbo.artist ON dbo.album.artistId = dbo.artist.artistId INNER JOIN
                      dbo.song ON dbo.album.albumId = dbo.song.albumId INNER JOIN
                      dbo.vote ON dbo.song.songId = dbo.vote.songId
   
GROUP BY dbo.vote.songId, dbo.song.name, dbo.album.name, dbo.artist.name, dbo.artist.artistId, dbo.album.albumCover, 
                      dbo.artist.picture
ORDER BY artistName
GO
/****** Object:  View [dbo].[ViewArtistContact]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewArtistContact]
AS
SELECT     dbo.artist.name, dbo.artist.description, dbo.artist.picture, dbo.artist.artistId, dbo.artistContact.idArtistContact, dbo.artistContact.bandcamp, 
                      dbo.artistContact.soundcloud, dbo.artistContact.website, dbo.artistContact.tumblr, dbo.artistContact.facebook, dbo.artistContact.twitter, dbo.artistContact.email
FROM         dbo.artist INNER JOIN
                      dbo.artistContact ON dbo.artist.artistId = dbo.artistContact.artistId
GO
/****** Object:  View [dbo].[ViewArtists]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewArtists]
AS
SELECT     artistId, name, description, picture
FROM         dbo.artist
GO
/****** Object:  View [dbo].[ViewGenderTotals]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewGenderTotals]
AS
SELECT     (SELECT     COUNT(*) AS Expr1
                       FROM          dbo.usuario
                       WHERE      (gender = 'M')) AS totalMale,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.usuario AS usuario_2
                            WHERE      (gender = 'F')) AS totalFemale, COUNT(*) AS total
FROM         dbo.usuario AS usuario_1
GO
/****** Object:  View [dbo].[ViewUserAges]    Script Date: 02/01/2015 12:33:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserAges]
AS
SELECT     DATEDIFF(year, birthdate, SYSDATETIME()) AS age
FROM         dbo.usuario
WHERE     (DATEDIFF(year, birthdate, SYSDATETIME()) > 0)
GROUP BY DATEDIFF(year, birthdate, SYSDATETIME())
GO
ALTER TABLE [dbo].[activityLog] ADD  CONSTRAINT [DF_activityLog_date]  DEFAULT (getdate()) FOR [data]
GO
ALTER TABLE [dbo].[album] ADD  CONSTRAINT [DF_album_albumCover]  DEFAULT (N'default-album-cover.jpg') FOR [albumCover]
GO
ALTER TABLE [dbo].[battl] ADD  CONSTRAINT [DF_battl_active]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[profile] ADD  CONSTRAINT [DF_profile_picture]  DEFAULT (N'default-picture.jpg') FOR [picture]
GO
ALTER TABLE [dbo].[profile] ADD  CONSTRAINT [DF_profile_upadted]  DEFAULT (getdate()) FOR [upadted]
GO
ALTER TABLE [dbo].[profile] ADD  CONSTRAINT [DF_profile_removed]  DEFAULT ((0)) FOR [removed]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF_user_gender]  DEFAULT (N'M') FOR [gender]
GO
ALTER TABLE [dbo].[vote] ADD  CONSTRAINT [DF_vote_votes]  DEFAULT ((0)) FOR [votes]
GO
ALTER TABLE [dbo].[activityLog]  WITH CHECK ADD  CONSTRAINT [FK_activityLog_action] FOREIGN KEY([actionId])
REFERENCES [dbo].[action] ([actionId])
GO
ALTER TABLE [dbo].[activityLog] CHECK CONSTRAINT [FK_activityLog_action]
GO
ALTER TABLE [dbo].[activityLog]  WITH CHECK ADD  CONSTRAINT [FK_activityLog_user] FOREIGN KEY([userId])
REFERENCES [dbo].[usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[activityLog] CHECK CONSTRAINT [FK_activityLog_user]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_profile] FOREIGN KEY([profileId])
REFERENCES [dbo].[profile] ([profileId])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_profile]
GO
ALTER TABLE [dbo].[album]  WITH CHECK ADD  CONSTRAINT [FK_album_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[album] CHECK CONSTRAINT [FK_album_artist]
GO
ALTER TABLE [dbo].[artistContact]  WITH CHECK ADD  CONSTRAINT [FK_artistContact_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[artistContact] CHECK CONSTRAINT [FK_artistContact_artist]
GO
ALTER TABLE [dbo].[discography]  WITH CHECK ADD  CONSTRAINT [FK_discography_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[discography] CHECK CONSTRAINT [FK_discography_artist]
GO
ALTER TABLE [dbo].[profile]  WITH CHECK ADD  CONSTRAINT [FK_profile_user] FOREIGN KEY([userId])
REFERENCES [dbo].[usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[profile] CHECK CONSTRAINT [FK_profile_user]
GO
ALTER TABLE [dbo].[social]  WITH CHECK ADD  CONSTRAINT [FK_social_socialType] FOREIGN KEY([socialTypeId])
REFERENCES [dbo].[socialType] ([socialTypeId])
GO
ALTER TABLE [dbo].[social] CHECK CONSTRAINT [FK_social_socialType]
GO
ALTER TABLE [dbo].[social]  WITH CHECK ADD  CONSTRAINT [FK_social_user] FOREIGN KEY([userId])
REFERENCES [dbo].[usuario] ([usuarioId])
GO
ALTER TABLE [dbo].[social] CHECK CONSTRAINT [FK_social_user]
GO
ALTER TABLE [dbo].[song]  WITH CHECK ADD  CONSTRAINT [FK_song_album] FOREIGN KEY([albumId])
REFERENCES [dbo].[album] ([albumId])
GO
ALTER TABLE [dbo].[song] CHECK CONSTRAINT [FK_song_album]
GO
ALTER TABLE [dbo].[tag]  WITH CHECK ADD  CONSTRAINT [FK_tag_ownerTable] FOREIGN KEY([ownerTableId])
REFERENCES [dbo].[ownerTable] ([ownerTableId])
GO
ALTER TABLE [dbo].[tag] CHECK CONSTRAINT [FK_tag_ownerTable]
GO
ALTER TABLE [dbo].[vote]  WITH CHECK ADD  CONSTRAINT [FK_vote_battl] FOREIGN KEY([battlId])
REFERENCES [dbo].[battl] ([battlId])
GO
ALTER TABLE [dbo].[vote] CHECK CONSTRAINT [FK_vote_battl]
GO
ALTER TABLE [dbo].[vote]  WITH CHECK ADD  CONSTRAINT [FK_vote_profile] FOREIGN KEY([profileId])
REFERENCES [dbo].[profile] ([profileId])
GO
ALTER TABLE [dbo].[vote] CHECK CONSTRAINT [FK_vote_profile]
GO
ALTER TABLE [dbo].[vote]  WITH CHECK ADD  CONSTRAINT [FK_vote_song] FOREIGN KEY([songId])
REFERENCES [dbo].[song] ([songId])
GO
ALTER TABLE [dbo].[vote] CHECK CONSTRAINT [FK_vote_song]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "activityLog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewActivityByHour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewActivityByHour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "album"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 174
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "song"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 125
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vote"
            Begin Extent = 
               Top = 6
               Left = 680
               Bottom = 125
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "battl"
            Begin Extent = 
               Top = 142
               Left = 783
               Bottom = 261
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "album"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 174
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "song"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 125
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vote"
            Begin Extent = 
               Top = 6
               Left = 680
               Bottom = 125
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "battl"
            Begin Extent = 
               Top = 142
               Left = 783
               Bottom = 261
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotesIon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotesIon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAlbumArtistSongTotalVotesIon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "artist"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 212
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artistContact"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 232
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewArtistContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewArtistContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "artist"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewArtists'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewArtists'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[26] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[21] 4[26] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[57] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "song"
            Begin Extent = 
               Top = 5
               Left = 418
               Bottom = 190
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "album"
            Begin Extent = 
               Top = 0
               Left = 708
               Bottom = 153
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "battl"
            Begin Extent = 
               Top = 154
               Left = 142
               Bottom = 312
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "song_1"
            Begin Extent = 
               Top = 206
               Left = 434
               Bottom = 353
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "album_1"
            Begin Extent = 
               Top = 185
               Left = 643
               Bottom = 351
               Right = 803
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist"
            Begin Extent = 
               Top = 4
               Left = 894
               Bottom = 123
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist_1"
            Begin Extent = 
               Top = 189
               Left = 862
               Bottom = 308
               Right = 1022
            End
            DisplayFlags = 280
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBattl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          TopColumn = 0
         End
         Begin Table = "vote"
            Begin Extent = 
               Top = 11
               Left = 142
               Bottom = 166
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vote_1"
            Begin Extent = 
               Top = 324
               Left = 151
               Bottom = 476
               Right = 311
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1890
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1605
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBattl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBattl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "album"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBattlResults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewBattlResults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "usuario_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewGenderTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewGenderTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[4] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "song"
            Begin Extent = 
               Top = 5
               Left = 232
               Bottom = 153
               Right = 392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "battl"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "album"
            Begin Extent = 
               Top = 3
               Left = 479
               Bottom = 146
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "artist"
            Begin Extent = 
               Top = 4
               Left = 734
               Bottom = 108
               Right = 894
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "song_1"
            Begin Extent = 
               Top = 166
               Left = 236
               Bottom = 285
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "album_1"
            Begin Extent = 
               Top = 160
               Left = 503
               Bottom = 306
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist_1"
            Begin Extent = 
               Top = 178
               Left = 740
               Bottom = 282
               Right = 900
            End
            DisplayFlags = 280
            ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPastBattls'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2310
         Width = 2310
         Width = 1500
         Width = 1500
         Width = 1890
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2550
         Table = 2925
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPastBattls'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPastBattls'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[25] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewAlbumArtistSongTotalVotes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2460
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopAlbums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopAlbums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[5] 4[22] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewAlbumArtistSongTotalVotes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopSongs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopSongs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewTopSongs_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopSongsPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopSongsPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[4] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewUserTotalVotes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTopUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserAges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserAges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[10] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewBattlResults"
            Begin Extent = 
               Top = 0
               Left = 372
               Bottom = 161
               Right = 548
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ViewUserTotalVotes"
            Begin Extent = 
               Top = 33
               Left = 81
               Bottom = 152
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ViewUserTotalVotes_1"
            Begin Extent = 
               Top = 3
               Left = 688
               Bottom = 171
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3135
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserBattlResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserBattlResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[11] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ViewUserTotalVotes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "artist"
            Begin Extent = 
               Top = 69
               Left = 794
               Bottom = 205
               Right = 970
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "song"
            Begin Extent = 
               Top = 20
               Left = 292
               Bottom = 191
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "album"
            Begin Extent = 
               Top = 17
               Left = 549
               Bottom = 176
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserFavoritesSongs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserFavoritesSongs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserFavoritesSongs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[19] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 177
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vote"
            Begin Extent = 
               Top = 8
               Left = 549
               Bottom = 186
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "profile"
            Begin Extent = 
               Top = 32
               Left = 296
               Bottom = 183
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserTotalVotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserTotalVotes'
GO
