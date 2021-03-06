using MusicBattlDAL.models.interfaces;

namespace MusicBattlDAL
{
    public class ViewTopSongs : IViewTopSongs
    {
        #region Properties

        private int _artistId;

        public int ArtistId
        {
            get { return _artistId; }
            set { _artistId = value; }
        }

        private int _songId;

        public int SongId
        {
            get { return _songId; }
            set { _songId = value; }
        }

        private string _songName;

        public string SongName
        {
            get { return _songName; }
            set { _songName = value; }
        }

        private string _artistName;

        public string ArtistName
        {
            get { return _artistName; }
            set { _artistName = value; }
        }

        private string _albumName;

        public string AlbumName
        {
            get { return _albumName; }
            set { _albumName = value; }
        }

        private string _albumCover;

        public string AlbumCover
        {
            get { return _albumCover; }
            set { _albumCover = value; }
        }

        private int? _totalVotes;

        public int? TotalVotes
        {
            get { return _totalVotes; }
            set { _totalVotes = value; }
        }

        #endregion Properties

        #region Constructor

        public ViewTopSongs()
        {
        }

        #endregion Constructor
    }
}