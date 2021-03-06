﻿define([
    "text!../../templates/html/versus-list.html",
    "text!../../templates/html/pagination.html",
    "viewModels/battlsWonLostViewModel",
    "views/paging"],
    function (
        html,
        paging,
        ViewModel,
        PagingView) {
        var BattlsLost = Backbone.View.extend({
            el: ".battls-lost",
            initialize: function () {
                this.profileId = master.loginManager.loggedUser.profileId;
                this.model = new ViewModel();
                this.model.bind("change", $.proxy(this.onModelChange, this));
                this.model.url = "/api/UserProfile/GetBattlsLost/{0}/?page={1}&rowCount={2}".format(this.profileId, this.model.page, this.model.collection.length);
                this.render();
                this.model.fetch();
            },
            showLosers: function () {
                var rows = this.$el.find(".versus-row");
                rows.each(function (index) {
                    var elmt = $(this),
                        firstSong = {},
                        secondSong = {};

                    firstSong = elmt.find(".mini-album:not([data-songid=0])").first();
                    secondSong = elmt.find(".mini-album:not([data-songid=0])").last();

                    if (firstSong.data("votes") < secondSong.data("votes")) {
                        firstSong.removeClass("opaque-content");
                        firstSong.find("[data-badge]").addClass("loss");
                        secondSong.find("[data-badge]").addClass("won");
                    } else {
                        secondSong.removeClass("opaque-content");
                        secondSong.find("[data-badge]").addClass("loss");
                        firstSong.find("[data-badge]").addClass("won");
                    }
                });
            },
            render: function () {
                var hbrs = Handlebars.compile(html),
                    tplt;

                tplt = hbrs({ data: this.model.collection, title: "BATTLS LOST" });

                this.$el.find(".ph").html(tplt);
                this.$el.find(".ph").parent().find(".pagination").remove();
                this.$el.find(".ph").parent().append(paging);

                if (this.pagingView) {
                    this.pagingView.dispose();
                }

                this.pagingView = new PagingView({ el: this.$el.find(".pagination").selector, currentPage: this.model.page, total: this.model.total, maxItens: this.model.collection.length * 2 });
                this.pagingView.on("onPaginar", $.proxy(this.onPaginar, this));

                this.showLosers();

                return this;
            },
            events: {
            },
            onPaginar: function (page) {
                this.model.url = "/api/UserProfile/GetBattlsLost/{0}/?page={1}&rowCount={2}".format(this.profileId, page, this.model.collection.length);
                this.model.getPage(page);
            },
            onModelChange: function () {
                this.render();
            }
        });

        return BattlsLost;
    });