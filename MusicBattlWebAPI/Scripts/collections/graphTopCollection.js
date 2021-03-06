﻿define([ "models/graphTopModel"], function ( Model) {
    'use strict';
    var GraphTopCollection = new Backbone.Collection([
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 1 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 2 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 3 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 4 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 5 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 6 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 7 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 8 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 9 },
        { ArtistName: "", SongName: "", AlbumName: "", TotalVotes: 0, Total: 0, Index: 10 }
    ], {
        model: Model
    });

    return GraphTopCollection;
});