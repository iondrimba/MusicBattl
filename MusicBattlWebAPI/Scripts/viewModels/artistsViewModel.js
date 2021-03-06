﻿define([ "collections/artistsCollection"], function ( Collection) {
    var ArtistsViewModel = Backbone.Model.extend({
        url: "/api/Artists/Get/0/0/100",
        initialize: function () {
            this.total = 0;
            this.page = 0;
            this.collection = Collection.toJSON();
            this.bind("change", this.onModelChange);
        },
        getPage: function (page) {
            this.page = page;
            this.url = "api/Artists/Get/0/{0}/{1}".format(page, this.collection.length);
            this.fetch();
        },
        onModelChange: function (data) {
            this.total = data.get("Total");
            var col = data.get("Collection"),
                i = 0,
                total = 0;
            total = col.length;
            for (i; i < total; i += 1) {
                if (col[i].ArtistId) {
                    this.collection[i] = col[i];
                }
            }
        }
    });

    return ArtistsViewModel;
});