using MusicBattlDAL.interfaces;
using MusicBattlDAL.repositories.interfaces;

namespace MusicBattlDAL.concrete
{
    public class ArtistQueryParams : IArtistQueryParams , IDataQuery
    {
        #region IArtistQueryParams Members

        private string _artistId;

        public string ArtistId
        {
            get { return _artistId; }
            set { _artistId = value; }
        }

        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        private string _description;

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        #endregion IArtistQueryParams Members

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