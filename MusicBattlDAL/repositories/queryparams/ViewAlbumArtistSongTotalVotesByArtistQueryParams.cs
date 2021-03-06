using MusicBattlDAL.interfaces;
using MusicBattlDAL.repositories.interfaces;

namespace MusicBattlDAL.concrete
{
    public class ViewAlbumArtistSongTotalVotesByArtistQueryParams : IViewAlbumArtistSongTotalVotesByArtistQueryParams , IDataQuery
    {
        #region IViewAlbumArtistSongTotalVotesByArtistQueryParams Members

        private string _artistId;

        public string ArtistId
        {
            get { return _artistId; }
            set { _artistId = value; }
        }

        private string _total;

        public string Total
        {
            get { return _total; }
            set { _total = value; }
        }

        private string _albumName;

        public string AlbumName
        {
            get { return _albumName; }
            set { _albumName = value; }
        }

        private string _artistName;

        public string ArtistName
        {
            get { return _artistName; }
            set { _artistName = value; }
        }

        private string _albumCover;

        public string AlbumCover
        {
            get { return _albumCover; }
            set { _albumCover = value; }
        }

        private string _picture;

        public string Picture
        {
            get { return _picture; }
            set { _picture = value; }
        }

        #endregion IViewAlbumArtistSongTotalVotesByArtistQueryParams Members

        #region IDataQuery Members

        private string _column;
        private string _from;
        private string _where;
        private string _orderBy;
        private int _page = 0;

        public int Page
        {
            get { return _page; }
            set { _page = value; }
        }

        private int _rowCount = 0;

        public int RowCount
        {
            get { return _rowCount; }
            set { _rowCount = value; }
        }

        public string From
        {
            get
            {
                return _from;
            }
            set
            {
                _from = value;
            }
        }

        public string Where
        {
            get
            {
                return _where;
            }
            set
            {
                _where = value;
            }
        }

        public string OrderBy
        {
            get
            {
                return _orderBy;
            }
            set
            {
                _orderBy = value;
            }
        }

        public string Column
        {
            get
            {
                return _column;
            }
            set
            {
                _column = value;
            }
        }

        #endregion IDataQuery Members
    }
}