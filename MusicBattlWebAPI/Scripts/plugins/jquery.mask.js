// jQuery Mask Plugin v1.1.2
// github.com/igorescobar/jQuery-Mask-Plugin
(function (b) {
    var u = function (a, g, f) {
        var c = this; a = b(a);
        var l; g = "function" == typeof g ? g(a.val(),
        f) : g; c.init = function () {
            f = f || {};
            c.byPassKeys = [8, 9, 37, 38, 39, 40, 46]; c.translation = {
                0: { pattern: /\d/ },
                9: { pattern: /\d/, optional: !0 },
                A: { pattern: /[a-zA-Z0-9]/ },
                S: { pattern: /[a-zA-Z]/ }
            };
            c.translation = b.extend({},
            c.translation, f.translation);
            c = b.extend(!0, {},
            c, f);
            a.each(function () {
                a.attr("maxlength", g.length).attr("autocomplete", "off");
                d.destroyEvents();
                d.events();
                d.isInput() || d.val(d.getMasked())
            })
        };
        var d = {
            events: function () {
                a.on("keydown.mask",
                function () { l = d.val() });
                a.on("keyup.mask", d.behaviour);
                a.on("paste.mask", function () {
                    setTimeout(function () { a.keydown().keyup() },
                    100)
                })
            },
            destroyEvents: function () { a.off("keydown.mask").off("keyup.mask").off("paste.mask") },
            isInput: function () { return "input" === a.get(0).tagName.toLowerCase() },
            val: function (s) { return 0 < arguments.length ? d.isInput() ? a.val(s) : a.text(s) : d.isInput() ? a.val() : a.text() },
            behaviour: function (a) {
                a = a || window.event;
                if (-1 === b.inArray(a.keyCode || a.which, c.byPassKeys)) return d.val(d.getMasked()),

                d.callbacks(a)
            },
            getMasked: function () {
                var a = [], b = d.val(),
                e = 0, t = g.length, h = 0, l = b.length, k = 1, m = "push", n; f.reverse ? (m = "unshift", k = -1, e = t - 1, h = l - 1, n = function () { return -1 < e && -1 < h }) : n = function () { return e < t && h < l };
                for (; n() ;
                ) {
                    var p = g.charAt(e),
                    q = c.translation[p], r = b.charAt(h);
                    q ? (r.match(q.pattern) ? (a[m](r),
                    e += k) : !0 == q.optional && (e += k, h -= k),
                    h += k) : (a[m](p),
                    r == p && (h += k),
                    e += k)
                }
                return a.join("")
            },
            callbacks: function (b) {
                var c = d.val(),
                e = d.val() !== l;
                if (!0 === e && "function" == typeof f.onChange) f.onChange(c, b, a, f);

                if (!0 ===
                e && "function" == typeof f.onKeyPress) f.onKeyPress(c, b, a, f);

                if ("function" === typeof f.onComplete && c.length === g.length) f.onComplete(c, b, a, f)
            }
        };
        c.remove = function () {
            d.destroyEvents();
            d.val(c.getCleanVal()).removeAttr("maxlength")
        };
        c.getCleanVal = function () {
            for (var a = [], b = d.val(),
            e = 0, f = g.length; e < f; e++) c.translation[g.charAt(e)] && a.push(b.charAt(e));
            return a.join("")
        };
        c.init()
    };
    b.fn.mask = function (a, g) { return this.each(function () { b(this).data("mask", new u(this, a, g)) }) };
    b.fn.unmask = function () { return this.each(function () { b(this).data("mask").remove() }) };

    b("input[data-mask]").each(function () { b(this).mask(b(this).attr("data-mask")) })
})(window.jQuery || window.Zepto);
