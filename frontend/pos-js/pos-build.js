! function (e) {
    function t(t) {
        for (var n, a, i = t[0], c = t[1], l = t[2], s = 0, p = []; s < i.length; s++) a = i[s], Object.prototype.hasOwnProperty.call(o, a) && o[a] && p.push(o[a][0]), o[a] = 0;
        for (n in c) Object.prototype.hasOwnProperty.call(c, n) && (e[n] = c[n]);
        for (f && f(t); p.length;) p.shift()();
        return u.push.apply(u, l || []), r()
    }

    function r() {
        for (var e, t = 0; t < u.length; t++) {
            for (var r = u[t], n = !0, i = 1; i < r.length; i++) {
                var c = r[i];
                0 !== o[c] && (n = !1)
            }
            n && (u.splice(t--, 1), e = a(a.s = r[0]))
        }
        return e
    }
    var n = {},
        o = {
            1: 0
        },
        u = [];

    function a(t) {
        if (n[t]) return n[t].exports;
        var r = n[t] = {
            i: t,
            l: !1,
            exports: {}
        };
        return e[t].call(r.exports, r, r.exports, a), r.l = !0, r.exports
    }
    a.e = function (e) {
        var t = [],
            r = o[e];
        if (0 !== r)
            if (r) t.push(r[2]);
            else {
                var n = new Promise((function (t, n) {
                    r = o[e] = [t, n]
                }));
                t.push(r[2] = n);
                var u, i = document.createElement("script");
                i.charset = "utf-8", i.timeout = 120, a.nc && i.setAttribute("nonce", a.nc), i.src = function (e) {
                    return a.p + "static/js/" + ({}[e] || e) + "." + {
                        3: "a1d19409"
                    }[e] + ".chunk.js"
                }(e);
                var c = new Error;
                u = function (t) {
                    i.onerror = i.onload = null, clearTimeout(l);
                    var r = o[e];
                    if (0 !== r) {
                        if (r) {
                            var n = t && ("load" === t.type ? "missing" : t.type),
                                u = t && t.target && t.target.src;
                            c.message = "Loading chunk " + e + " failed.\n(" + n + ": " + u + ")", c.name = "ChunkLoadError", c.type = n, c.request = u, r[1](c)
                        }
                        o[e] = void 0
                    }
                };
                var l = setTimeout((function () {
                    u({
                        type: "timeout",
                        target: i
                    })
                }), 12e4);
                i.onerror = i.onload = u, document.head.appendChild(i)
            } return Promise.all(t)
    }, a.m = e, a.c = n, a.d = function (e, t, r) {
        a.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: r
        })
    }, a.r = function (e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, a.t = function (e, t) {
        if (1 & t && (e = a(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var r = Object.create(null);
        if (a.r(r), Object.defineProperty(r, "default", {
            enumerable: !0,
            value: e
        }), 2 & t && "string" != typeof e)
            for (var n in e) a.d(r, n, function (t) {
                return e[t]
            }.bind(null, n));
        return r
    }, a.n = function (e) {
        var t = e && e.__esModule ? function () {
            return e.default
        } : function () {
            return e
        };
        return a.d(t, "a", t), t
    }, a.o = function (e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, a.p = "/", a.oe = function (e) {
        throw console.error(e), e
    };
    var i = this.webpackJsonptek_store = this.webpackJsonptek_store || [],
        c = i.push.bind(i);
    i.push = t, i = i.slice();
    for (var l = 0; l < i.length; l++) t(i[l]);
    var f = c;
    r()
}(this.webpackJsonptek_store = this.webpackJsonptek_store || []).push([
    [0], {
        107: function (e, t, n) { },
        130: function (e, t, n) { },
        14: function (e, t, n) {
            "use strict";
            n.d(t, "f", (function () {
                return c
            })), n.d(t, "e", (function () {
                return a
            })), n.d(t, "c", (function () {
                return r
            })), n.d(t, "d", (function () {
                return l
            })), n.d(t, "b", (function () {
                return d
            })), n.d(t, "a", (function () {
                return u
            }));
            var c = function (e, t) {
                var n = ("string" === typeof e ? e : e.toString()).split(".");
                if (t <= 0) return n[0];
                var c = n[1] || "";
                if (c.length > t) return "".concat(n[0], ".").concat(c.substr(0, t));
                for (; c.length < t;) c += "0";
                return "".concat(n[0], ".").concat(c)
            },
                a = function (e) {
                    var t, n = o(e),
                        a = e.product_row.product.unit_price,
                        r = +a * n / 100,
                        l = "exclusive" === e.product_row.product.tax_type ? +a : +a + r,
                        d = null !== (t = e.product_row.quantity) && void 0 !== t ? t : 0,
                        u = l,
                        b = (u - (e.product_row.discount && e.product_row.discount.discount_amount ? s(e, u) : 0)).toFixed(2),
                        m = 0,
                        j = 0;
                    if (e.modifiers.length > 0) {
                        e.modifiers.forEach((function (e) {
                            var t = i(e),
                                n = c(e.default_sell_price, 4);
                            j += +n, t > 0 && (m += n * t / 100)
                        })), b = (+b + +m + j).toFixed(2)
                    }
                    return (+b * d).toFixed(2)
                },
                r = function (e) {
                    var t = 0;
                    return e.forEach((function (e) {
                        t += parseFloat(a(e))
                    })), t.toFixed(2)
                },
                s = function (e, t) {
                    return "percentage" === e.product_row.discount.discount_type ? +t / 100 * +e.product_row.discount.discount_amount : +e.product_row.discount.discount_amount
                },
                o = function (e) {
                    var t = 0;
                    if (null != e.product_row.product.tax_id) {
                        var n = e.product_row.all_tax_dropdown.filter((function (t) {
                            return t.id === +e.product_row.product.tax_id
                        }));
                        n.length > 0 && (t = n[0].amount)
                    } else t = e.product_row.tax_dropdown ? e.product_row.tax_dropdown.amount : +e.product_row.product.tax_id;
                    return +t
                },
                i = function (e) {
                    return +(e.tax_dropdown ? e.tax_dropdown.amount : 0)
                },
                l = function (e) {
                    var t = 0;
                    return e.forEach((function (e) {
                        var n, a = 0,
                            r = 0,
                            l = null !== (n = e.product_row.quantity) && void 0 !== n ? n : 0;
                        if (e.modifiers.forEach((function (e) {
                            if (e.tax_dropdown) {
                                var t = i(e);
                                r = c(e.default_sell_price, 4), t > 0 && (a += (r * t / 100).toFixed(2) * l)
                            }
                        })), e.product_row.tax_dropdown) {
                            var d, u = +c(e.product_row.product.unit_price, 4),
                                b = (e.product_row.discount && e.product_row.discount.discount_amount && s(e, u), null !== (d = e.modifiers) && void 0 !== d ? d : []),
                                m = o(e);
                            if (b.forEach((function (e) {
                                parseFloat(e.sell_price_inc_tax)
                            })), m > 0) {
                                var j = (u * m / 100).toFixed(2) * l;
                                t = +t + +j + +a
                            }
                        } else t += a
                    })), t.toFixed(2)
                },
                d = function (e) {
                    var t = 0;
                    return e.forEach((function (e) {
                        var n, a = 0,
                            r = null !== (n = e.product_row.quantity) && void 0 !== n ? n : 0;
                        e.modifiers.forEach((function (e) {
                            if (e.tax_dropdown) {
                                var n = i(e);
                                a = c(e.default_sell_price, 4), n > 0 && (t += (a * n / 100).toFixed(2) * r)
                            }
                        }))
                    })), t.toFixed(2)
                },
                u = function (e) {
                    var t = 0;
                    return e.forEach((function (e) {
                        t += b(e)
                    })), parseFloat(t).toFixed(2)
                },
                b = function (e) {
                    var t;
                    if (!e.product_row.discount || !e.product_row.discount.discount_amount) return 0;
                    var n = +e.product_row.product.default_sell_price,
                        a = function (e) {
                            var t, n = null !== (t = e.modifiers) && void 0 !== t ? t : [],
                                a = 0;
                            return n.forEach((function (e) {
                                a += +c(e.sell_price_inc_tax, 2)
                            })), +a.toFixed(2)
                        }(e),
                        r = null !== (t = e.product_row.quantity) && void 0 !== t ? t : 0;
                    return s(e, n + a * r)
                }
        },
        188: function (e, t, n) {
            "use strict";
            n.r(t);
            var c = n(1),
                a = n.n(c),
                r = n(18),
                s = n.n(r),
                o = (n(102), n(12)),
                i = n(94),
                l = n(41),
                d = (n(107), function (e) {
                    e && e instanceof Function && n.e(3).then(n.bind(null, 195)).then((function (t) {
                        var n = t.getCLS,
                            c = t.getFID,
                            a = t.getFCP,
                            r = t.getLCP,
                            s = t.getTTFB;
                        n(e), c(e), a(e), r(e), s(e)
                    }))
                }),
                u = (n(43), n(2)),
                b = n(6),
                m = Object(l.b)({
                    category: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.b.FETCH_CATEGORY:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    products: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.j.FETCH_ALL_PRODUCT:
                            case u.j.FETCH_PRODUCTS_CLICKABLE:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    locations: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.f.FETCH_LOCATION:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    user: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.g.LOGIN_USER:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    serviceman: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.m.FETCH_SERVICEMAN:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    customers: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.e.ADD_CUSTOMER_DATA:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    tables: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.p.FETCH_TABLE:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    featured_products: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.j.FETCH_FAVORITE:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    modifierProduct: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.h.MODIFIER_PRODUCT:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    search: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.e.SEARCH_CUSTOMER:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    isLoading: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.d.IS_LOADING:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    toastMessage: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.d.ADD_TOAST:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    registerDetails: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.l.FETCH_REGISTER_DETAILS:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    closeRegisters: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.c.FETCH_CLOSE_REGISTER:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    cashRegister: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.c.CASH_CLOSE_REGISTER:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    suspendedSales: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.o.FETCH_SUSPENDED_SALES:
                                return t.payload;
                            case u.o.DELETE_SUSPENDED_SALES:
                                return Object(b.a)(Object(b.a)({}, e), {}, {
                                    sales: e.sales.filter((function (e) {
                                        return e.id !== t.payload
                                    }))
                                });
                            case u.o.DELETE_ALL_SUSPENDED_SALES:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    recentTransactions: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.k.FETCH_FINAL_TRANSACTION:
                                return t.payload;
                            case u.k.DELETE_TRANSACTION:
                                return e.filter((function (e) {
                                    return e.id !== t.payload
                                }));
                            default:
                                return e
                        }
                    },
                    editSuspendedSale: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.o.EDIT_SUSPENDED_SALES:
                                return t.payload;
                            default:
                                return e
                        }
                    },
                    paymentPrints: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                            t = arguments.length > 1 ? arguments[1] : void 0;
                        switch (t.type) {
                            case u.i.PAYMENT_PRINT:
                                return t.payload;
                            default:
                                return e
                        }
                    }
                }),
                j = n(3),
                p = (n(130), n(59), n(131), n(28)),
                h = n(5),
                x = n.n(h),
                O = n(7),
                f = n(8),
                _ = function (e) {
                    return {
                        type: u.d.IS_LOADING,
                        payload: e
                    }
                },
                y = function (e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                        n = !(arguments.length > 2 && void 0 !== arguments[2]) || arguments[2];
                    return function () {
                        var c = Object(O.a)(x.a.mark((function c(a) {
                            var r;
                            return x.a.wrap((function (c) {
                                for (; ;) switch (c.prev = c.next) {
                                    case 0:
                                        return n && a(_(!0)), r = "get-products?location_id=".concat(e), 1 === t && (r += "&is_favourite=1"), c.next = 5, f.a.get(r).then((function (e) {
                                            a({
                                                type: u.j.FETCH_ALL_PRODUCT,
                                                payload: e.data.products
                                            }), n && a(_(!1))
                                        })).catch((function (e) {
                                            var t = e.error;
                                            console.log("error", t)
                                        }));
                                    case 5:
                                    case "end":
                                        return c.stop()
                                }
                            }), c)
                        })));
                        return function (e) {
                            return c.apply(this, arguments)
                        }
                    }()
                },
                g = n(22);

            function v(e, t) {
                var n, c = new Set,
                    a = Object(g.a)(e);
                try {
                    for (a.s(); !(n = a.n()).done;) {
                        var r = n.value;
                        r.hasOwnProperty(t) && c.add(r[t])
                    }
                } catch (s) {
                    a.e(s)
                } finally {
                    a.f()
                }
                return c
            }
            var N = n(9),
                w = n(0),
                S = function (e) {
                    var t, n = e.product,
                        a = e.closeModifierModel,
                        r = e.addProductInToCart,
                        s = Object(c.useState)(null !== (t = n.modifiers) && void 0 !== t ? t : []),
                        o = Object(j.a)(s, 2),
                        i = o[0],
                        l = o[1],
                        d = n.modifiers ? v(n.modifiers, "id") : [],
                        u = Object(c.useState)(new Set(d)),
                        b = Object(j.a)(u, 2),
                        m = b[0],
                        h = b[1],
                        x = function () {
                            a()
                        };
                    Object(N.b)("keydown", (function (e) {
                        var t = e.key;
                        N.a.includes(String(t)) && a()
                    }));
                    var O = function (e) {
                        return m.has(e)
                    },
                        f = function (e, t) {
                            return Object(w.jsx)("div", {
                                className: "".concat(O(e.id) ? "add-product-modal__active-block" : "", " add-product-modal__source-block"),
                                onClick: function () {
                                    return function (e) {
                                        O(e.id) ? (l(i.filter((function (t) {
                                            return t.id !== e.id
                                        }))), m.delete(e.id), h(m)) : (l([].concat(Object(p.a)(i), [e])), h(new Set([].concat(Object(p.a)(m), [e.id]))))
                                    }(e)
                                },
                                children: Object(w.jsxs)("div", {
                                    className: "text-center",
                                    children: [Object(w.jsx)("p", {
                                        className: "add-product-modal__type-items w-100 mb-0",
                                        children: e.name
                                    }), Object(w.jsxs)("p", {
                                        className: "add-product-modal__price-label w-100 mb-0",
                                        children: [parseFloat(e.sell_price_inc_tax).toFixed(2), " SR"]
                                    })]
                                })
                            }, t)
                        };
                    return Object(w.jsxs)("div", {
                        className: "add-product-modal pos-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: x,
                                    onKeyPress: x,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)("div", {
                                            className: "col-12 border-4 border-lg-end pend-sm-90 mb-sm-4 mb-lg-2 mb-md-3 mt-sm-0 mt-5",
                                            children: Object(w.jsxs)("div", {
                                                className: "border-bottom border-4 d-flex align-items-center justify-content-between mb-4",
                                                children: [Object(w.jsx)("h5", {
                                                    className: "modal-title",
                                                    id: "addProductModalLabel",
                                                    children: "Modifiers"
                                                }), Object(w.jsx)("h5", {
                                                    className: "modal-title",
                                                    id: "addProductModalLabel",
                                                    children: n.product_row.product.product_name
                                                })]
                                            })
                                        }), Object(w.jsx)("div", {
                                            className: "custom-scrollbar",
                                            children: Object(w.jsx)("div", {
                                                className: "col-12 product-height",
                                                children: 0 !== n.modifier_products.length ? n.modifier_products.map((function (e, t) {
                                                    return function (e, t) {
                                                        return Object(w.jsxs)("div", {
                                                            className: "add-product-modal__main-box bg-secondary",
                                                            children: [Object(w.jsx)("h6", {
                                                                className: "top-title py-3 px-4 title-border-bottom mb-0",
                                                                children: e.name
                                                            }), Object(w.jsx)("div", {
                                                                className: "add-product-modal__source-btn-grp py-3 px-2 d-flex flex-wrap mb-3",
                                                                children: e.variations.map((function (e, t) {
                                                                    return f(e, t)
                                                                }))
                                                            })]
                                                        }, t)
                                                    }(e, t)
                                                })) : Object(w.jsx)("h3", {
                                                    className: "text-center active py-3",
                                                    children: "No Modifier Available"
                                                })
                                            })
                                        }), Object(w.jsx)("div", {
                                            className: "text-end mt-5",
                                            children: 0 === n.modifier_products.length ? "" : Object(w.jsx)("button", {
                                                type: "button",
                                                className: "btn btn-primary modal-btn-modifier modal-footer-btn table-modal__add-btn mt-3",
                                                onClick: function () {
                                                    var e = n;
                                                    e.modifiers = i, r(e)
                                                },
                                                children: "Add"
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: x,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: x
                        })]
                    })
                },
                C = n(46),
                E = n(14),
                T = Object(o.b)((function (e) {
                    return {
                        products: e.products,
                        isLoading: e.isLoading
                    }
                }), {
                    fetchProducts: y,
                    fetchProduct: function (e, t, n) {
                        return function () {
                            var c = Object(O.a)(x.a.mark((function c(a) {
                                return x.a.wrap((function (c) {
                                    for (; ;) switch (c.prev = c.next) {
                                        case 0:
                                            return c.next = 2, f.a.get(u.a.GET_PRODUCT_ROW + "?location_id=".concat(e, "&variation_id=").concat(t)).then((function (e) {
                                                e.data.product && e.data.product.product_row ? n({
                                                    product: e.data.product ? e.data.product : null
                                                }) : a({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: e.data.product.msg,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            })).catch((function (e) {
                                                var t = e.response;
                                                a({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return c.stop()
                                    }
                                }), c)
                            })));
                            return function (e) {
                                return c.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.fetchProducts,
                        n = e.products,
                        a = e.cartProducts,
                        r = e.selectedLocationId,
                        s = e.updateCart,
                        o = e.fetchProduct,
                        i = e.isLoading,
                        l = Object(c.useState)([]),
                        d = Object(j.a)(l, 2),
                        u = d[0],
                        b = d[1],
                        m = Object(c.useState)([]),
                        h = Object(j.a)(m, 2),
                        x = h[0],
                        O = h[1],
                        f = Object(c.useState)(null),
                        _ = Object(j.a)(f, 2),
                        y = _[0],
                        N = _[1],
                        T = Object(c.useState)(!1),
                        k = Object(j.a)(T, 2),
                        A = k[0],
                        D = k[1];
                    Object(c.useEffect)((function () {
                        t(r)
                    }), []), Object(c.useEffect)((function () {
                        b(a);
                        var e = a.map((function (e) {
                            return e.product_row.product.variation_id
                        }));
                        O(e)
                    }), [a]);
                    var R = function () {
                        D(!1)
                    },
                        F = function (e) {
                            var t = e.product_row.product.variation_id,
                                n = !0,
                                c = u.filter((function (c) {
                                    if (c.product_row.product.variation_id !== t || e.modifiers.length !== c.modifiers.length) return c;
                                    var a = v(e.modifiers, "id"),
                                        r = v(c.modifiers, "id");
                                    return 0 === function (e, t) {
                                        var n, c = new Set,
                                            a = Object(g.a)(e);
                                        try {
                                            for (a.s(); !(n = a.n()).done;) {
                                                var r = n.value;
                                                t.has(r) || c.add(r)
                                            }
                                        } catch (s) {
                                            a.e(s)
                                        } finally {
                                            a.f()
                                        }
                                        return c
                                    }(a, new Set(r)).size && (c.product_row.quantity = parseInt(c.product_row.quantity) + 1, n = !1), c
                                }));
                            if (n) {
                                c.push(e);
                                var a = x.filter((function (e) {
                                    return e !== t
                                }));
                                O([].concat(Object(p.a)(a), [t]))
                            }
                            b(c), s(c), R()
                        },
                        P = function (e) {
                            o(r, e.id, (function (e) {
                                if (e.product) {
                                    N(e.product);
                                    var t = null;
                                    null != e.product.product_row.product.tax_dropdown && (t = e.product.product_row.product.tax_dropdown[0].id), e.product.product_row.product.tax_id = t, e.product.modifier_products.length ? D(!0) : (e.product.modifiers = [], F(e.product))
                                }
                            }))
                        },
                        L = function (e) {
                            var t = Object(E.f)(e.selling_price, 4);
                            return e.product_tax ? (+t + e.product_tax).toFixed(2) : Object(E.f)(e.selling_price, 2)
                        },
                        I = function (e, t) {
                            return Object(w.jsx)("div", {
                                className: "food-container__item-block",
                                children: Object(w.jsxs)("div", {
                                    className: "".concat((n = e.id, x.includes(n) ? "product-active" : ""), " card border-0 rounded-3"),
                                    "data-bs-toggle": "modal",
                                    "data-bs-target": "#addProductModal",
                                    onClick: function () {
                                        return function (e) {
                                            P(e)
                                        }(e)
                                    },
                                    children: [Object(w.jsxs)("div", {
                                        className: "card-header text-white rounded-top text-center",
                                        children: [" ", e.name, " "]
                                    }), Object(w.jsxs)("div", {
                                        className: "card-body",
                                        children: [Object(w.jsx)("img", {
                                            src: e.product_image_url,
                                            className: "d-block mx-auto my-2",
                                            alt: "burger",
                                            width: "80",
                                            height: "73"
                                        }), Object(w.jsx)("p", {
                                            className: "text-primary text-center mb-0 food-container__price",
                                            children: L(e)
                                        })]
                                    })]
                                })
                            }, t);
                            var n
                        };
                    return Object(w.jsxs)("div", {
                        className: "position-relative",
                        children: [Object(w.jsx)("div", {
                            className: "food-container p-2",
                            children: Object(w.jsx)("div", {
                                className: "row gx-0",
                                children: 0 !== n.length ? n.map((function (e, t) {
                                    return I(e, t)
                                })) : i ? Object(w.jsx)(C.CommonLoading, {}) : Object(w.jsx)("h3", {
                                    className: "text-center",
                                    children: "No Product Available"
                                })
                            })
                        }), A && Object(w.jsx)(S, {
                            product: y,
                            addProductInToCart: F,
                            closeModifierModel: R
                        })]
                    })
                })),
                k = Object(o.b)((function (e) {
                    return {
                        category: e.category
                    }
                }), {
                    fetchCategory: function () {
                        return function () {
                            var e = Object(O.a)(x.a.mark((function e(t) {
                                return x.a.wrap((function (e) {
                                    for (; ;) switch (e.prev = e.next) {
                                        case 0:
                                            return e.next = 2, f.a.get(u.a.CATEGORY).then((function (e) {
                                                t({
                                                    type: u.b.FETCH_CATEGORY,
                                                    payload: e.data
                                                })
                                            })).catch((function (e) {
                                                var t = e.error;
                                                console.log("error", t)
                                            }));
                                        case 2:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function (t) {
                                return e.apply(this, arguments)
                            }
                        }()
                    },
                    fetchProductClickable: function (e, t) {
                        return function () {
                            var n = Object(O.a)(x.a.mark((function n(c) {
                                return x.a.wrap((function (n) {
                                    for (; ;) switch (n.prev = n.next) {
                                        case 0:
                                            return n.next = 2, f.a.get(u.a.PRODUCT + "?location_id=".concat(t, "&category_id=").concat(e)).then((function (e) {
                                                c({
                                                    type: u.j.FETCH_PRODUCTS_CLICKABLE,
                                                    payload: e.data.products
                                                })
                                            })).catch((function (e) {
                                                var t = e.error;
                                                console.log("error", t)
                                            }));
                                        case 2:
                                        case "end":
                                            return n.stop()
                                    }
                                }), n)
                            })));
                            return function (e) {
                                return n.apply(this, arguments)
                            }
                        }()
                    },
                    fetchProducts: y
                })((function (e) {
                    var t = e.fetchCategory,
                        n = e.category,
                        a = e.selectedLocationId,
                        r = e.fetchProductClickable,
                        s = e.fetchProducts,
                        o = Object(c.useState)("All"),
                        i = Object(j.a)(o, 2),
                        l = i[0],
                        d = i[1];
                    Object(c.useEffect)((function () {
                        t()
                    }), []);
                    return Object(w.jsxs)("div", {
                        children: [Object(w.jsxs)("div", {
                            className: "breadcrumb-nav d-flex justify-content-between align-items-center pe-3",
                            children: [Object(w.jsx)("a", {
                                href: "#",
                                className: "btn breadcrumb-nav__nav-title text-decoration-none text-primary rounded-0 border-0",
                                children: l
                            }), Object(w.jsxs)("div", {
                                className: "top-bar_btn-grp",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    onClick: function () {
                                        return s(a), void d("All")
                                    },
                                    className: "btn btn-primary top-bar__text-btn breadcrumb-nav__small-btn me-2 text-white",
                                    children: "ALL"
                                }), Object(w.jsx)("button", {
                                    type: "button",
                                    onClick: function () {
                                        return s(a, 1), void d("Favorites")
                                    },
                                    className: "btn btn-primary top-bar__text-btn breadcrumb-nav__favorite-btn text-white",
                                    children: Object(w.jsx)("i", {
                                        className: "fa fa-heart",
                                        "aria-hidden": "true"
                                    })
                                })]
                            })]
                        }), n.categories && 0 === n.categories.length ? Object(w.jsx)("div", {
                            className: "mini-box p-2 overflow-hidden",
                            children: Object(w.jsx)("div", {
                                className: "row gx-0 flex-nowrap overflow-auto",
                                children: Object(w.jsx)("div", {
                                    className: "mini-box__block active text-primary d-flex align-items-center justify-content-center categories-box",
                                    children: Object(w.jsx)("h5", {
                                        children: "No category"
                                    })
                                })
                            })
                        }, n.id) : "", Object(w.jsx)("div", {
                            className: "mini-box p-2 overflow-hidden",
                            children: Object(w.jsx)("div", {
                                className: "row gx-0 flex-nowrap overflow-auto",
                                children: n.categories && n.categories.map((function (e, t) {
                                    return Object(w.jsx)("div", {
                                        className: "".concat(l === e.name ? "active" : "inactive", " mini-box__block active text-primary d-flex align-items-center justify-content-center"),
                                        onClick: function () {
                                            return function (e) {
                                                d(e.name), r(e.id, a)
                                            }(e)
                                        },
                                        children: null != e.image ? Object(w.jsxs)("div", {
                                            children: [Object(w.jsx)("img", {
                                                src: e.image_url,
                                                className: "d-block mx-auto mt-2",
                                                alt: e.name,
                                                width: "60",
                                                height: "53"
                                            }), e.name]
                                        }) : e.name
                                    }, t)
                                }))
                            })
                        })]
                    })
                })),
                A = function () {
                    return function () {
                        var e = Object(O.a)(x.a.mark((function e(t) {
                            return x.a.wrap((function (e) {
                                for (; ;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2, f.a.get("get-locations").then((function (e) {
                                            t({
                                                type: u.f.FETCH_LOCATION,
                                                payload: e.data
                                            })
                                        })).catch((function (e) {
                                            var t = e.error;
                                            console.log("error", t)
                                        }));
                                    case 2:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })));
                        return function (t) {
                            return e.apply(this, arguments)
                        }
                    }()
                };
            var D = Object(o.b)((function (e) {
                return {
                    locations: e.locations
                }
            }), {
                fetchLocation: A,
                fetchProducts: y
            })((function (e) {
                var t = e.fetchLocation,
                    n = e.fetchProducts,
                    a = e.locations,
                    r = e.setSelectBoxId;
                return Object(c.useEffect)((function () {
                    t()
                }), []), Object(w.jsx)("select", {
                    className: "form-control select2",
                    id: "dashboard_location",
                    onChange: function (e) {
                        return function (e) {
                            n(e.target.value), r(e.target.value)
                        }(e)
                    },
                    children: a.business_locations && a.business_locations.map((function (e, t) {
                        return Object(w.jsx)("option", {
                            value: e.id,
                            className: "option-drop option-color-window",
                            selected: "selected" == e.selected_business_location ? "selected" : "",
                            children: e.name
                        }, t)
                    }))
                })
            })),
                R = n(85),
                F = n(86),
                P = n(13),
                L = n(95),
                I = Object(o.b)((function (e) {
                    return {
                        customers: e.customers,
                        search: e.search
                    }
                }), {
                    createNewCustomer: function (e) {
                        return function () {
                            var t = Object(O.a)(x.a.mark((function t(n) {
                                return x.a.wrap((function (t) {
                                    for (; ;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, f.a.post("store-customer", e).then((function (e) {
                                                n({
                                                    type: u.e.ADD_CUSTOMER_DATA,
                                                    payload: e.data.data
                                                }), n({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: "Customer added successfully",
                                                        display: !0
                                                    }
                                                })
                                            })).catch((function (e) {
                                                var t = e.response;
                                                n({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function (e) {
                                return t.apply(this, arguments)
                            }
                        }()
                    },
                    searchCustomer: function (e) {
                        return function () {
                            var t = Object(O.a)(x.a.mark((function t(n) {
                                return x.a.wrap((function (t) {
                                    for (; ;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, f.a.get("search-customer?query=".concat(e)).then((function (e) {
                                                n({
                                                    type: u.e.SEARCH_CUSTOMER,
                                                    payload: e.data.contacts
                                                })
                                            })).catch((function (e) {
                                                var t = e.error;
                                                console.log("error", t)
                                            }));
                                        case 2:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function (e) {
                                return t.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.createNewCustomer,
                        n = e.searchCustomer,
                        a = e.search,
                        r = e.selectCustomer,
                        s = e.customer,
                        o = Object(c.useState)(!1),
                        i = Object(j.a)(o, 2),
                        l = i[0],
                        d = i[1],
                        u = Object(c.useState)({
                            name: "",
                            mobile: "",
                            selectBox: ""
                        }),
                        m = Object(j.a)(u, 2),
                        p = m[0],
                        h = m[1],
                        x = Object(c.useState)({
                            name: "",
                            mobile: ""
                        }),
                        O = Object(j.a)(x, 2),
                        f = O[0],
                        _ = O[1];
                    Object(c.useEffect)((function () {
                        h((function (e) {
                            return Object(b.a)(Object(b.a)({}, e), {}, Object(P.a)({}, "selectBox", s))
                        }))
                    }), [s]);
                    var y = function () {
                        d(!l), r(p.selectBox), h((function (e) {
                            return Object(b.a)(Object(b.a)({}, e), {}, Object(P.a)({}, "name", e.text))
                        })), h((function (e) {
                            return Object(b.a)(Object(b.a)({}, e), {}, Object(P.a)({}, "mobile", e.number))
                        })), _("")
                    };
                    Object(c.useEffect)((function () {
                        document.body.style.overflow = l ? "hidden" : "unset"
                    }), [l]);
                    var g = function (e) {
                        if (function () {
                            var e = {},
                                t = !1;
                            return p.name ? p.mobile ? t = !0 : e.mobile = "Please enter your mobile" : e.name = "Please enter your name", _(e), t
                        }()) {
                            t(S(e)), d(!1);
                            h({
                                name: "",
                                mobile: ""
                            }), r(p.selectBox)
                        }
                    },
                        v = function (e) {
                            e.persist(), h((function (t) {
                                return Object(b.a)(Object(b.a)({}, t), {}, Object(P.a)({}, e.target.name, e.target.value))
                            }))
                        },
                        S = function () {
                            var e = new FormData;
                            return e.append("name", p.name), e.append("mobile", p.mobile), e
                        },
                        C = [];
                    a.forEach((function (e) {
                        C.push({
                            id: e.id,
                            label: e.text
                        })
                    })), Object(N.b)("keydown", (function (e) {
                        var t = e.key;
                        N.a.includes(String(t)) && d(!1)
                    }));
                    var E = function () {
                        return Object(w.jsx)("button", {
                            type: "button",
                            className: "btn text-primary w-100 h-100 coustom-hover",
                            "data-bs-toggle": "modal",
                            "data-bs-target": "#customerModal",
                            onClick: y,
                            children: "Customer"
                        })
                    };
                    return l ? Object(w.jsxs)("div", {
                        children: [E(), Object(w.jsxs)("div", {
                            className: "customer-modal pos-modal",
                            children: [Object(w.jsx)("div", {
                                className: "modal-dialog modal-dialog-centered hide-show-dialog",
                                children: Object(w.jsxs)("div", {
                                    className: "modal-content border-0 px-2 px-sm-4 py-2",
                                    children: [Object(w.jsx)("button", {
                                        type: "button",
                                        className: "btn-close",
                                        "data-bs-dismiss": "modal",
                                        "aria-label": "Close",
                                        onClick: y,
                                        onKeyPress: y,
                                        children: "X"
                                    }), Object(w.jsx)("div", {
                                        className: "modal-body",
                                        children: Object(w.jsxs)("div", {
                                            className: "row",
                                            children: [Object(w.jsx)("div", {
                                                className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                                children: Object(w.jsxs)("div", {
                                                    className: "mb-5 pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0",
                                                    children: [Object(w.jsx)("h5", {
                                                        className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-4",
                                                        id: "paymentModalLabel",
                                                        children: "Select Customer"
                                                    }), Object(w.jsxs)("form", {
                                                        children: [Object(w.jsx)("div", {
                                                            className: "customer-modal__select-customer bg-secondary p-3 pb-5",
                                                            children: Object(w.jsxs)("div", {
                                                                className: "row align-items-center",
                                                                children: [Object(w.jsx)("label", {
                                                                    htmlFor: "searchCustomer",
                                                                    className: "col-sm-3 col-4 modal-subtitle col-form-label",
                                                                    children: "Search Customer:"
                                                                }), Object(w.jsx)("div", {
                                                                    className: "col-sm-9 col-8 field-w-100",
                                                                    children: Object(w.jsx)(L.a, {
                                                                        className: "basic-single",
                                                                        classNamePrefix: "select",
                                                                        options: C,
                                                                        value: p.selectBox,
                                                                        placeholder: "Search...",
                                                                        openMenuOnClick: !1,
                                                                        onInputChange: function (e) {
                                                                            n(e)
                                                                        },
                                                                        onChange: function (e) {
                                                                            h((function (t) {
                                                                                return Object(b.a)(Object(b.a)({}, t), {}, Object(P.a)({}, "selectBox", e))
                                                                            }))
                                                                        }
                                                                    })
                                                                })]
                                                            })
                                                        }), Object(w.jsxs)("div", {
                                                            className: "customer-modal__new-customer bg-secondary px-3 mb-5 pt-5 pb-5",
                                                            children: [Object(w.jsx)("h6", {
                                                                className: "modal-inner-title mb-4 pt-3",
                                                                children: "New customer"
                                                            }), Object(w.jsxs)("div", {
                                                                className: "row align-items-center mb-3",
                                                                children: [Object(w.jsx)("label", {
                                                                    htmlFor: "searchCustomer",
                                                                    className: "col-sm-3 col-4 modal-subtitle col-form-label",
                                                                    children: "Name*:"
                                                                }), Object(w.jsxs)("div", {
                                                                    className: "col-sm-9 col-8 field-w-100",
                                                                    children: [Object(w.jsx)("input", {
                                                                        type: "text",
                                                                        required: !0,
                                                                        value: p.name,
                                                                        id: "customerName",
                                                                        name: "name",
                                                                        className: "form-control amount-input",
                                                                        "aria-describedby": "search customer",
                                                                        onChange: function (e) {
                                                                            return v(e)
                                                                        }
                                                                    }), Object(w.jsx)("span", {
                                                                        className: "required",
                                                                        style: {
                                                                            color: "red"
                                                                        },
                                                                        children: f.name ? f.name : null
                                                                    })]
                                                                })]
                                                            }), Object(w.jsxs)("div", {
                                                                className: "row align-items-center",
                                                                children: [Object(w.jsx)("label", {
                                                                    htmlFor: "searchCustomer",
                                                                    className: "col-sm-3 col-4 modal-subtitle col-form-label",
                                                                    children: "Mobile*:"
                                                                }), Object(w.jsxs)("div", {
                                                                    className: "col-sm-9 col-8 field-w-100",
                                                                    children: [Object(w.jsx)("input", {
                                                                        type: "number",
                                                                        required: !0,
                                                                        value: p.mobile,
                                                                        id: "customerMobile",
                                                                        name: "mobile",
                                                                        className: "form-control amount-input",
                                                                        "aria-describedby": "search customer",
                                                                        onChange: function (e) {
                                                                            return v(e)
                                                                        }
                                                                    }), Object(w.jsx)("span", {
                                                                        className: "required",
                                                                        style: {
                                                                            color: "red"
                                                                        },
                                                                        children: f.mobile ? f.mobile : null
                                                                    })]
                                                                })]
                                                            })]
                                                        })]
                                                    })]
                                                })
                                            }), Object(w.jsx)("div", {
                                                className: "text-end",
                                                children: Object(w.jsx)("button", {
                                                    type: "button",
                                                    className: "btn btn-primary modal-btn modal-footer-btn customer-modal__add-btn mt-3",
                                                    onClick: function () {
                                                        return g()
                                                    },
                                                    children: "Add"
                                                })
                                            })]
                                        })
                                    })]
                                })
                            }), Object(w.jsx)("div", {
                                className: "bg-overlay",
                                onClick: y,
                                role: "button",
                                tabIndex: "0",
                                "aria-label": "background overlay",
                                onKeyDown: y
                            })]
                        })]
                    }) : E()
                })),
                M = Object(o.b)((function (e) {
                    return {
                        tables: e.tables
                    }
                }), {
                    fetchTableData: function (e) {
                        return function () {
                            var t = Object(O.a)(x.a.mark((function t(n) {
                                return x.a.wrap((function (t) {
                                    for (; ;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, f.a.get("get-tables?location_id=".concat(e)).then((function (e) {
                                                n({
                                                    type: u.p.FETCH_TABLE,
                                                    payload: e.data
                                                })
                                            })).catch((function (e) {
                                                var t = e.error;
                                                console.log("error", t)
                                            }));
                                        case 2:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function (e) {
                                return t.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.fetchTableData,
                        n = e.tables,
                        a = e.onSelectTable,
                        r = e.tableId,
                        s = e.selectedLocationId,
                        o = Object(c.useState)(!1),
                        i = Object(j.a)(o, 2),
                        l = i[0],
                        d = i[1],
                        u = Object(c.useState)(r),
                        b = Object(j.a)(u, 2),
                        m = b[0],
                        p = b[1],
                        h = function () {
                            d(!l)
                        };
                    Object(c.useEffect)((function () {
                        document.body.style.overflow = l ? "hidden" : "unset"
                    })), Object(c.useEffect)((function () {
                        p(r || null)
                    }), [l]), Object(c.useEffect)((function () {
                        t(s)
                    }), [s]);
                    var x = function () {
                        d(!l), p("")
                    },
                        O = Object(c.useCallback)((function (e) {
                            27 === e.keyCode && (d(!1), p(""))
                        }), []);
                    Object(c.useEffect)((function () {
                        return document.addEventListener("keydown", O, !1),
                            function () {
                                document.removeEventListener("keydown", O, !1)
                            }
                    }), []);
                    var f = function (e, t) {
                        return Object(w.jsx)("button", {
                            type: "button",
                            className: "".concat(m === e.id ? "tables-active" : " ", " table-modal__table-btn btn btn-outline-dark d-flex align-items-center justify-content-center"),
                            onClick: function () {
                                return function (e) {
                                    var t = e.id === m ? null : e.id;
                                    p(t)
                                }(e)
                            },
                            children: e.name
                        }, t)
                    },
                        _ = function () {
                            return Object(w.jsx)("button", {
                                type: "button",
                                className: "btn text-primary w-100 h-100 coustom-hover",
                                "data-bs-toggle": "modal",
                                "data-bs-target": "#tableModal",
                                onClick: h,
                                children: "Table"
                            })
                        };
                    return l ? Object(w.jsxs)("div", {
                        children: [_(), Object(w.jsxs)("div", {
                            className: "table-modal pos-modal",
                            children: [Object(w.jsx)("div", {
                                className: "modal-dialog modal-dialog-centered hide-show-dialog",
                                children: Object(w.jsxs)("div", {
                                    className: "modal-content border-0 px-4 py-2",
                                    children: [Object(w.jsx)("button", {
                                        type: "button",
                                        className: "btn-close",
                                        "data-bs-dismiss": "modal",
                                        "aria-label": "Close",
                                        onClick: x,
                                        onKeyPress: x,
                                        children: "X"
                                    }), Object(w.jsx)("div", {
                                        className: "modal-body",
                                        children: Object(w.jsxs)("div", {
                                            className: "row",
                                            children: [Object(w.jsx)("div", {
                                                className: "col-sm-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 mb-5",
                                                children: Object(w.jsxs)("div", {
                                                    className: "pe-lg-2 me-lg-1 mt-4 mt-sm-5 mt-lg-0",
                                                    children: [Object(w.jsx)("h5", {
                                                        className: "modal-title border-bottom border-4 mb-3 mt-1 mt-sm-0",
                                                        id: "tableModalLabel",
                                                        children: "Table"
                                                    }), Object(w.jsx)("div", {
                                                        className: "custom-scrollbar",
                                                        children: Object(w.jsx)("div", {
                                                            className: "table-modal__main-box bg-secondary",
                                                            children: Object(w.jsx)("div", {
                                                                className: "table-modal__table-btn-grp pt-3 px-2 pb-5 d-flex flex-wrap",
                                                                children: n.tables && n.tables.map((function (e, t) {
                                                                    return f(e, t)
                                                                }))
                                                            })
                                                        })
                                                    })]
                                                })
                                            }), Object(w.jsx)("div", {
                                                className: "text-end mt-5",
                                                children: Object(w.jsx)("button", {
                                                    type: "button",
                                                    onClick: function () {
                                                        a(m), d(!1)
                                                    },
                                                    className: "btn btn-primary modal-btn modal-footer-btn table-modal__add-btn mt-3",
                                                    children: "Add"
                                                })
                                            })]
                                        })
                                    })]
                                })
                            }), Object(w.jsx)("div", {
                                className: "bg-overlay",
                                onClick: h,
                                role: "button",
                                tabIndex: "0",
                                "aria-label": "background overlay",
                                onKeyDown: h
                            })]
                        })]
                    }) : _()
                }));
            var U = Object(o.b)((function (e) {
                return {
                    serviceman: e.serviceman
                }
            }), {
                fetchServiceman: function (e) {
                    return function () {
                        var t = Object(O.a)(x.a.mark((function t(n) {
                            return x.a.wrap((function (t) {
                                for (; ;) switch (t.prev = t.next) {
                                    case 0:
                                        return t.next = 2, f.a.get("get-service-staffs?location_id=".concat(e)).then((function (e) {
                                            n({
                                                type: u.m.FETCH_SERVICEMAN,
                                                payload: e.data
                                            })
                                        })).catch((function (e) {
                                            var t = e.error;
                                            console.log("error", t)
                                        }));
                                    case 2:
                                    case "end":
                                        return t.stop()
                                }
                            }), t)
                        })));
                        return function (e) {
                            return t.apply(this, arguments)
                        }
                    }()
                }
            })((function (e) {
                var t = Object(c.useState)(!1),
                    n = Object(j.a)(t, 2),
                    a = n[0],
                    r = n[1],
                    s = Object(c.useState)(!1),
                    o = Object(j.a)(s, 2),
                    i = o[0],
                    l = o[1],
                    d = e.fetchServiceman,
                    u = e.serviceman,
                    b = e.selectedLocationId,
                    m = function () {
                        r(!a)
                    };
                return Object(c.useEffect)((function () {
                    document.body.style.overflow = a ? "hidden" : "unset"
                })), Object(c.useEffect)((function () {
                    d(b)
                }), [b]), Object(w.jsxs)("div", {
                    children: [Object(w.jsx)("button", {
                        type: "button",
                        className: "btn text-primary w-100 h-100 coustom-hover",
                        "data-bs-toggle": "modal",
                        "data-bs-target": "#servicemanModal",
                        onClick: m,
                        children: "Serviceman"
                    }), Object(w.jsxs)("div", {
                        className: "".concat(a ? "serviceman-modal" : null, " pos-modal"),
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: m,
                                    onKeyPress: m,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)("div", {
                                            className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 mb-5",
                                            children: Object(w.jsxs)("div", {
                                                className: "pe-lg-2 me-lg-1 mt-4 mt-sm-5 mt-lg-0",
                                                children: [Object(w.jsx)("h5", {
                                                    className: "modal-title border-bottom border-4 mb-3 mt-1 mt-sm-0",
                                                    id: "servicemanModalLabel",
                                                    children: "Serviceman"
                                                }), Object(w.jsx)("div", {
                                                    className: "serviceman-modal__main-box bg-secondary",
                                                    children: Object(w.jsx)("div", {
                                                        className: "serviceman-modal__service-btn-grp pt-3 px-2 pb-5 d-flex flex-wrap",
                                                        children: u.service_staff && u.service_staff.map((function (e, t) {
                                                            return Object(w.jsx)("button", {
                                                                type: "button",
                                                                className: "".concat(i === e.full_name ? "service-active" : "", " serviceman-modal__service-btn btn btn-outline-dark d-flex align-items-center justify-content-center"),
                                                                onClick: function () {
                                                                    return t = e.full_name, void l(t);
                                                                    var t
                                                                },
                                                                children: e.full_name
                                                            }, t)
                                                        }))
                                                    })
                                                })]
                                            })
                                        }), Object(w.jsx)("div", {
                                            className: "text-end mt-5",
                                            children: Object(w.jsx)("button", {
                                                type: "button",
                                                className: "btn btn-primary modal-btn modal-footer-btn serviceman-modal__add-btn mt-3",
                                                children: "Add"
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: m,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: m
                        })]
                    })]
                })
            })),
                H = function (e) {
                    var t = e.buttonClickValue,
                        n = e.handleClickButton,
                        c = e.removeLastCharacter;
                    return Object(w.jsxs)("div", {
                        className: "row row-cols-3 gx-0",
                        children: [Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 1)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-bottom-0",
                            children: "1"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 2)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "2"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 3)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "3"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 4)
                            },
                            className: "btn text-primary border border-primary rounded-0 border-bottom-0",
                            children: "4"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 5)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "5"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 6)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "6"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 7)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-bottom-0",
                            children: "7"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 8)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "8"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 9)
                            },
                            className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                            children: "9"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            className: "btn numeric-btn text-primary border border-primary rounded-0"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return n(t + 0)
                            },
                            className: "btn text-primary numeric-btn border border-primary rounded-0 border-start-0",
                            children: "0"
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return c()
                            },
                            className: "btn numeric-btn text-white border border-primary rounded-0 border-start-0",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-times calculator__close-box",
                                "aria-hidden": "true"
                            })
                        })]
                    })
                },
                q = n(90),
                Y = function (e) {
                    var t = e.onClickDeleteModal,
                        n = e.onClearCart;
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), Object(w.jsxs)("div", {
                        className: "customer-modal delete-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog delete-content",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close delete-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsxs)("div", {
                                            className: "col-sm-10 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: [Object(w.jsx)("div", {
                                                className: "mb-3 pe-lg-2 me-lg-1 mt-0 mt-lg-0",
                                                children: Object(w.jsx)("h4", {
                                                    className: "modal-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-2",
                                                    id: "deleteModal",
                                                    children: "Delete"
                                                })
                                            }), Object(w.jsx)("p", {
                                                className: "heading-model text-start",
                                                children: "Are you sure want to clear a cart?"
                                            })]
                                        }), Object(w.jsx)("div", {
                                            className: "text-end",
                                            children: Object(w.jsxs)("div", {
                                                className: "d-flex justify-content-end mt-4 align-items-center",
                                                children: [Object(w.jsx)("button", {
                                                    className: "btn btn-primary modal-Yes-btn",
                                                    "aria-label": "login",
                                                    onClick: n,
                                                    children: "Yes"
                                                }), Object(w.jsx)("button", {
                                                    className: "btn btn-primary model-No-btn",
                                                    "aria-label": "Close",
                                                    onClick: t,
                                                    onKeyPress: t,
                                                    children: "No"
                                                })]
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                },
                z = n(30),
                B = n(19),
                K = n.n(B),
                G = Object(o.b)(null, {})((function (e) {
                    var t = e.onClickDeleteSuspendSales,
                        n = e.deleteSuspendSale,
                        c = e.title,
                        a = e.heading;
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), Object(w.jsx)("div", {
                        className: "customer-modal delete-modal",
                        children: Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog delete-content",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsxs)("div", {
                                            className: "col-sm-10 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: [Object(w.jsx)("div", {
                                                className: "mb-3 pe-lg-2 me-lg-1 mt-0 mt-lg-0",
                                                children: Object(w.jsx)("h4", {
                                                    className: "modal-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-2",
                                                    id: "deleteModal",
                                                    children: a
                                                })
                                            }), Object(w.jsx)("p", {
                                                className: "heading-model text-start",
                                                children: c
                                            })]
                                        }), Object(w.jsx)("div", {
                                            className: "text-end",
                                            children: Object(w.jsxs)("div", {
                                                className: "d-flex justify-content-end mt-4 align-items-center",
                                                children: [Object(w.jsx)("button", {
                                                    className: "btn btn-primary modal-Yes-btn",
                                                    "aria-label": "login",
                                                    onClick: n,
                                                    children: "Yes"
                                                }), Object(w.jsx)("button", {
                                                    className: "btn btn-primary model-No-btn",
                                                    "aria-label": "Close",
                                                    onClick: t,
                                                    onKeyPress: t,
                                                    children: "No"
                                                })]
                                            })
                                        })]
                                    })
                                })]
                            })
                        })
                    })
                })),
                W = Object(o.b)((function (e) {
                    return {
                        suspendedSales: e.suspendedSales,
                        editSuspendedSale: e.editSuspendedSale
                    }
                }), {
                    fetchSuspendedSales: z.d,
                    deleteSuspendedSales: z.b,
                    deleteAllSuspendedSales: z.a,
                    editSuspendedSales: z.c
                })((function (e) {
                    var t = e.onPauseClickToggleModal,
                        n = e.fetchSuspendedSales,
                        a = e.suspendedSales,
                        r = e.deleteSuspendedSales,
                        s = e.deleteAllSuspendedSales,
                        o = e.editSuspendedSales,
                        i = Object(c.useState)(!1),
                        l = Object(j.a)(i, 2),
                        d = l[0],
                        u = l[1],
                        b = Object(c.useState)(!1),
                        m = Object(j.a)(b, 2),
                        p = m[0],
                        h = m[1],
                        x = Object(c.useState)(0),
                        O = Object(j.a)(x, 2),
                        f = O[0],
                        _ = O[1];
                    Object(c.useEffect)((function () {
                        n()
                    }), []), Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    }));
                    var y = function (e) {
                        _(e), u(!d)
                    },
                        g = function () {
                            h(!p)
                        },
                        v = function (e, n) {
                            return Object(w.jsxs)("div", {
                                className: "card custom-pause-card",
                                children: [Object(w.jsxs)("ul", {
                                    className: "list-group list-group-flush border-0",
                                    children: [Object(w.jsx)("li", {
                                        className: "list-group-item border-0 custom-color mb-1",
                                        children: e.additional_notes
                                    }), Object(w.jsx)("li", {
                                        className: "list-group-item border-0 custom-color p-0",
                                        children: e.invoice_no
                                    }), Object(w.jsx)("li", {
                                        className: "list-group-item border-0 custom-color p-0",
                                        children: K()(e.sale_date).format("MM/DD/YYYY")
                                    }), Object(w.jsxs)("li", {
                                        className: "list-group-item border-0 custom-color fw-bold mb-2 p-0",
                                        children: [Object(w.jsx)("i", {
                                            className: "fas fa-user me-1"
                                        }), e.name]
                                    }), Object(w.jsxs)("li", {
                                        className: "list-group-item border-0 custom-color p-0",
                                        children: [Object(w.jsx)("i", {
                                            className: "fas fa-cubes me-1"
                                        }), "Total Items: ", e.total_items]
                                    }), Object(w.jsxs)("li", {
                                        className: "list-group-item border-0 custom-color p-0 mb-3",
                                        children: [Object(w.jsx)("i", {
                                            className: "fas fa-money-bill-alt me-1"
                                        }), "Total:", parseFloat(e.final_total).toFixed(2), "\ufdfc"]
                                    })]
                                }, n), Object(w.jsxs)("button", {
                                    type: "button",
                                    onClick: function () {
                                        return n = e.id, o(n), void t(!1);
                                        var n
                                    },
                                    className: "list-group-item border-0 custom-right",
                                    children: ["Edit Sale", Object(w.jsx)("i", {
                                        className: "fas fa-arrow-circle-right ms-1"
                                    })]
                                }), Object(w.jsxs)("button", {
                                    type: "button",
                                    onClick: function () {
                                        return y(e.id)
                                    },
                                    className: "list-group-item border-0 custom-trash",
                                    children: ["Delete", Object(w.jsx)("i", {
                                        className: "fas fa-trash ms-1"
                                    })]
                                }), d && Object(w.jsx)(G, {
                                    onClickDeleteSuspendSales: y,
                                    deleteSuspendSale: function () {
                                        return r(f), void u(!1)
                                    },
                                    title: "Are you sure want to delete sale?",
                                    heading: "Delete"
                                })]
                            }, n)
                        };
                    return 0 === a.length ? "" : Object(w.jsxs)("div", {
                        className: " pause-modal pos-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)("div", {
                                            className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 custom-sales",
                                            children: Object(w.jsxs)("div", {
                                                className: " pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0 customer-modal__select-customer p-3 pb-4",
                                                children: [Object(w.jsx)("h5", {
                                                    className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 mb-sm-4 mb-md-3 mt-sm-0 mt-4",
                                                    id: "paymentModalLabel",
                                                    children: "Suspended Sales"
                                                }), p && Object(w.jsx)(G, {
                                                    onClickDeleteSuspendSales: g,
                                                    deleteSuspendSale: function () {
                                                        return e = a.salesIds, s(e), h(!1), void t(!0);
                                                        var e
                                                    },
                                                    title: "Are you sure want to delete sales?",
                                                    heading: "Delete"
                                                }), Object(w.jsx)("div", {
                                                    className: "row customer-modal__new-customer sales-scroll m-0",
                                                    children: 0 !== a.sales.length ? a.sales.map((function (e, t) {
                                                        return v(e, t)
                                                    })) : Object(w.jsx)("h3", {
                                                        className: "text-center active py-3",
                                                        children: "No Suspended Sales Available"
                                                    })
                                                })]
                                            })
                                        }), Object(w.jsx)("div", {
                                            className: "pause-footer",
                                            children: 0 === a.sales.length ? "" : Object(w.jsxs)("button", {
                                                onClick: g,
                                                className: "btn modal-btn modal-footer-btn customer-modal__add-btn mt-3 pause_footer-btn",
                                                children: [Object(w.jsx)("i", {
                                                    className: "fas fa-trash me-1"
                                                }), "Delete All"]
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                })),
                X = n(24),
                V = n(26),
                J = n(39),
                Q = n(37),
                $ = n(35),
                Z = n.n($),
                ee = Object(o.b)((function (e) {
                    return {
                        registerDetails: e.registerDetails
                    }
                }), {
                    fetchRegisterDetails: function () {
                        return function () {
                            var e = Object(O.a)(x.a.mark((function e(t) {
                                return x.a.wrap((function (e) {
                                    for (; ;) switch (e.prev = e.next) {
                                        case 0:
                                            return e.next = 2, f.a.get("cash-register-details").then((function (e) {
                                                t({
                                                    type: u.l.FETCH_REGISTER_DETAILS,
                                                    payload: e.data
                                                })
                                            })).catch((function (e) {
                                                var n = e.response;
                                                t({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: n.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function (t) {
                                return e.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.onRegisterClickToggleModal,
                        n = e.fetchRegisterDetails,
                        r = e.registerDetails,
                        s = Object(c.useRef)();
                    if (Object(c.useEffect)((function () {
                        n()
                    }), []), Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), 0 === r.length) return "";
                    var o = function (e) {
                        Object(J.a)(n, e);
                        var t = Object(Q.a)(n);

                        function n() {
                            return Object(X.a)(this, n), t.apply(this, arguments)
                        }
                        return Object(V.a)(n, [{
                            key: "render",
                            value: function () {
                                return Object(w.jsx)("div", {
                                    className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 p-2",
                                    children: Object(w.jsxs)("div", {
                                        className: "mb-3 pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0",
                                        children: [Object(w.jsxs)("h5", {
                                            className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-4 details-title",
                                            id: "paymentModalLabel",
                                            children: ["Register Details (", K()(r.register_details.open_time).format("Do MMM, YYYY h:mm A"), " - ", K()(r.register_details.close_time).format("Do MMM, YYYY h:mm A"), ")"]
                                        }), Object(w.jsxs)("div", {
                                            className: "col-sm-12",
                                            children: [Object(w.jsx)("table", {
                                                className: "table",
                                                children: Object(w.jsxs)("tbody", {
                                                    className: "d-inline-table w-100",
                                                    children: [Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Cash On Hand:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.cash_in_hand ? parseFloat(r.register_details.cash_in_hand).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Cash Payment:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_cash ? parseFloat(r.register_details.total_cash).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Cheque Payment:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_cheque ? parseFloat(r.register_details.total_cheque).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Card Payment:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_card ? parseFloat(r.register_details.total_card).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Bank Transfer:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_bank_transfer ? parseFloat(r.register_details.total_bank_transfer).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Advance Payment:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_advance ? parseFloat(r.register_details.total_advance).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: "Other Payments:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsxs)("span", {
                                                                className: "display_currency",
                                                                "data-currency_symbol": "true",
                                                                children: [r.register_details.total_other ? parseFloat(r.register_details.total_other).toFixed(2) : 0, "\ufdfc"]
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        className: "success",
                                                        children: [Object(w.jsx)("th", {
                                                            children: "Total Refund:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsx)("b", {
                                                                children: Object(w.jsxs)("span", {
                                                                    className: "display_currency",
                                                                    "data-currency_symbol": "true",
                                                                    children: [r.register_details.total_refund ? parseFloat(r.register_details.total_refund).toFixed(2) : 0, "\ufdfc"]
                                                                })
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        className: "success",
                                                        children: [Object(w.jsx)("th", {
                                                            children: "Total Payment:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsx)("b", {
                                                                children: Object(w.jsxs)("span", {
                                                                    className: "display_currency",
                                                                    "data-currency_symbol": "true",
                                                                    children: [r.register_details.total_cash ? (parseFloat(r.register_details.total_cash) + parseFloat(r.register_details.cash_in_hand) - parseFloat(r.register_details.total_cash_refund)).toFixed(2) : 0, "\ufdfc"]
                                                                })
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        className: "success",
                                                        children: [Object(w.jsx)("th", {
                                                            children: "Credit Sales:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsx)("b", {
                                                                children: Object(w.jsxs)("span", {
                                                                    className: "display_currency",
                                                                    "data-currency_symbol": "true",
                                                                    children: [r.register_details.total_sale ? parseFloat(r.details.transaction_details.total_sales - r.register_details.total_sale).toFixed(2) : 0, "\ufdfc"]
                                                                })
                                                            })
                                                        })]
                                                    }), Object(w.jsxs)("tr", {
                                                        className: "success",
                                                        children: [Object(w.jsx)("th", {
                                                            children: "Total Sales:"
                                                        }), Object(w.jsx)("td", {
                                                            children: Object(w.jsx)("b", {
                                                                children: Object(w.jsxs)("span", {
                                                                    className: "display_currency",
                                                                    "data-currency_symbol": "true",
                                                                    children: [r.details.transaction_details.total_sales ? parseFloat(r.details.transaction_details.total_sales).toFixed(2) : "0.00", "\ufdfc"]
                                                                })
                                                            })
                                                        })]
                                                    })]
                                                })
                                            }), Object(w.jsx)("hr", {
                                                className: "register-border"
                                            }), Object(w.jsxs)("div", {
                                                className: "col-xs-6",
                                                children: [Object(w.jsx)("b", {
                                                    children: "User : "
                                                }), r.register_details.user_name ? r.register_details.user_name : "N/A", Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                    children: "Email : "
                                                }), r.register_details.email ? r.register_details.email : "N/A", Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                    children: "Business Location : "
                                                }), r.register_details.location_name ? r.register_details.location_name : "N/A", Object(w.jsx)("br", {})]
                                            })]
                                        })]
                                    })
                                })
                            }
                        }]), n
                    }(a.a.Component);
                    return Object(w.jsxs)("div", {
                        className: "register-modal pos-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close custom-close-btn",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)(o, {
                                            ref: s
                                        }), Object(w.jsxs)("div", {
                                            className: "Register-footer",
                                            children: [Object(w.jsx)(Z.a, {
                                                trigger: function () {
                                                    return Object(w.jsxs)("button", {
                                                        type: "button",
                                                        className: "btn btn-primary footer-btn me-2  modal-btn",
                                                        "aria-label": "Print",
                                                        children: [Object(w.jsx)("i", {
                                                            className: "fa fa-print me-1"
                                                        }), "Print"]
                                                    })
                                                },
                                                content: function () {
                                                    return s.current
                                                }
                                            }), Object(w.jsx)("button", {
                                                type: "button",
                                                className: "btn btn-default footer-btn  modal-btn bg-secondary",
                                                "data-dismiss": "modal",
                                                onClick: t,
                                                onKeyPress: t,
                                                children: "Cancel"
                                            })]
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                })),
                te = Object(o.b)((function (e) {
                    return {
                        closeRegisters: e.closeRegisters,
                        cashRegister: e.cashRegister,
                        user: e.user
                    }
                }), {
                    fetchCloseRegister: function () {
                        return function () {
                            var e = Object(O.a)(x.a.mark((function e(t) {
                                return x.a.wrap((function (e) {
                                    for (; ;) switch (e.prev = e.next) {
                                        case 0:
                                            return e.next = 2, f.a.get("cash-register-details").then((function (e) {
                                                t({
                                                    type: u.c.FETCH_CLOSE_REGISTER,
                                                    payload: e.data
                                                })
                                            })).catch((function (e) {
                                                var n = e.response;
                                                t({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: n.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function (t) {
                                return e.apply(this, arguments)
                            }
                        }()
                    },
                    cashCloseRegister: function (e) {
                        return function () {
                            var t = Object(O.a)(x.a.mark((function t(n) {
                                return x.a.wrap((function (t) {
                                    for (; ;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, f.a.post("cash-close-register", e).then((function (e) {
                                                n({
                                                    type: u.c.CASH_CLOSE_REGISTER,
                                                    payload: e.data
                                                }), n({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: "Register closed successfully",
                                                        display: !0
                                                    }
                                                }), window.location.replace("http://localhost:8000/cash-register/create?")
                                            })).catch((function (e) {
                                                var t = e.response;
                                                n({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function (e) {
                                return t.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.onCloseRegisterModal,
                        n = e.fetchCloseRegister,
                        a = e.closeRegisters,
                        r = e.cashCloseRegister,
                        s = e.user,
                        o = Object(c.useState)({
                            closing_amount: 0,
                            closing_note: ""
                        }),
                        i = Object(j.a)(o, 2),
                        l = i[0],
                        d = i[1],
                        u = Object(c.useState)({
                            closing_amount: ""
                        }),
                        m = Object(j.a)(u, 2),
                        p = m[0],
                        h = m[1],
                        x = Object(c.useState)(0),
                        O = Object(j.a)(x, 2),
                        f = O[0],
                        _ = O[1];
                    Object(c.useEffect)((function () {
                        d((function (e) {
                            return Object(b.a)(Object(b.a)({}, e), {}, Object(P.a)({}, "closing_amount", f))
                        }))
                    }), [f]), Object(c.useEffect)((function () {
                        0 !== a.length && _(a.register_details.total_cash ? (parseFloat(a.register_details.total_cash) + parseFloat(a.register_details.cash_in_hand) - parseFloat(a.register_details.total_cash_refund)).toFixed(2) : 0)
                    }), [a]);
                    var y = function (e) {
                        e.persist(), d((function (t) {
                            return Object(b.a)(Object(b.a)({}, t), {}, Object(P.a)({}, e.target.name, e.target.value))
                        }))
                    };
                    Object(c.useEffect)((function () {
                        n()
                    }), []);
                    var g = function (e) {
                        (function () {
                            var e = {},
                                t = !1;
                            return l.closing_amount ? t = !0 : e.closing_amount = "Please Enter Your Total Cash", h(e), t
                        })() && (r(function () {
                            var e = new FormData;
                            return e.append("closing_amount", l.closing_amount), e.append("closing_note", l.closing_note), e.append("user_id", s ? s.id : 0), e
                        }()), t())
                    };
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), 0 === a.length ? "" : Object(w.jsxs)("div", {
                        className: "customer-modal pos-modal current-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)("div", {
                                            className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: Object(w.jsxs)("div", {
                                                className: "pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0",
                                                children: [Object(w.jsxs)("h5", {
                                                    className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-5",
                                                    id: "paymentModalLabel",
                                                    children: ["Current Register (", K()(a.register_details.open_time).format("Do MMM, YYYY h:mm A"), " - ", K()(a.register_details.close_time).format("Do MMM, YYYY h:mm A"), ")"]
                                                }), Object(w.jsxs)("div", {
                                                    className: "current-modal__new-customer",
                                                    children: [Object(w.jsx)("table", {
                                                        className: "table current-table",
                                                        children: Object(w.jsxs)("tbody", {
                                                            className: "current-body",
                                                            children: [Object(w.jsxs)("tr", {
                                                                children: [Object(w.jsx)("td", {
                                                                    children: "Cash On Hand:"
                                                                }), Object(w.jsx)("td", {
                                                                    children: Object(w.jsxs)("span", {
                                                                        className: "display_currency",
                                                                        "data-currency_symbol": "true",
                                                                        children: [a.register_details.cash_in_hand ? parseFloat(a.register_details.cash_in_hand).toFixed(2) : 0, " \ufdfc"]
                                                                    })
                                                                })]
                                                            }), Object(w.jsxs)("tr", {
                                                                children: [Object(w.jsx)("td", {
                                                                    children: "Cash Payment:"
                                                                }), Object(w.jsx)("td", {
                                                                    children: Object(w.jsxs)("span", {
                                                                        className: "display_currency",
                                                                        "data-currency_symbol": "true",
                                                                        children: [a.register_details.total_cash ? parseFloat(a.register_details.total_cash).toFixed(2) : 0, "\ufdfc"]
                                                                    })
                                                                })]
                                                            }), Object(w.jsxs)("tr", {
                                                                children: [Object(w.jsx)("td", {
                                                                    children: "Total Sales:"
                                                                }), Object(w.jsx)("td", {
                                                                    children: Object(w.jsxs)("span", {
                                                                        className: "display_currency",
                                                                        "data-currency_symbol": "true",
                                                                        children: [a.register_details.total_sale ? parseFloat(a.register_details.total_sale).toFixed(2) : 0, " \ufdfc "]
                                                                    })
                                                                })]
                                                            }), Object(w.jsxs)("tr", {
                                                                className: "success custom-success",
                                                                children: [Object(w.jsx)("th", {
                                                                    children: "Total Payment:"
                                                                }), Object(w.jsx)("td", {
                                                                    children: Object(w.jsx)("b", {
                                                                        children: Object(w.jsxs)("span", {
                                                                            className: "display_currency",
                                                                            "data-currency_symbol": "true",
                                                                            children: [f, " \ufdfc"]
                                                                        })
                                                                    })
                                                                })]
                                                            })]
                                                        })
                                                    }), Object(w.jsx)("hr", {
                                                        className: "current_register"
                                                    }), Object(w.jsxs)("div", {
                                                        className: "row",
                                                        children: [Object(w.jsx)("div", {
                                                            className: "col-sm-4",
                                                            children: Object(w.jsxs)("div", {
                                                                className: "form-group custom-group",
                                                                children: [Object(w.jsx)("label", {
                                                                    htmlFor: "closing_amount",
                                                                    className: "mb-2",
                                                                    children: "Total Cash:*"
                                                                }), Object(w.jsx)("input", {
                                                                    className: "form-control input_number",
                                                                    required: !0,
                                                                    value: l.closing_amount,
                                                                    name: "closing_amount",
                                                                    type: "number",
                                                                    id: "closing_amount",
                                                                    onChange: function (e) {
                                                                        return y(e)
                                                                    }
                                                                }), Object(w.jsx)("span", {
                                                                    className: "required",
                                                                    style: {
                                                                        color: "red"
                                                                    },
                                                                    children: p.closing_amount ? p.closing_amount : null
                                                                })]
                                                            })
                                                        }), Object(w.jsx)("div", {
                                                            className: "col-sm-12",
                                                            children: Object(w.jsxs)("div", {
                                                                className: "form-group custom-group",
                                                                children: [Object(w.jsx)("label", {
                                                                    htmlFor: "closing_note",
                                                                    className: "mb-2",
                                                                    children: "Closing Note:"
                                                                }), Object(w.jsx)("textarea", {
                                                                    className: "form-control close-textarea",
                                                                    placeholder: "Closing Note",
                                                                    rows: "3",
                                                                    value: l.closing_note,
                                                                    name: "closing_note",
                                                                    cols: "50",
                                                                    id: "closing_note",
                                                                    onChange: function (e) {
                                                                        return y(e)
                                                                    }
                                                                })]
                                                            })
                                                        })]
                                                    }), Object(w.jsx)("div", {
                                                        className: "row",
                                                        children: Object(w.jsxs)("div", {
                                                            className: "col-xs-6 mb-3",
                                                            children: [Object(w.jsx)("b", {
                                                                children: "User : "
                                                            }), a.register_details.user_name ? a.register_details.user_name : "N/A", Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                                children: "Email : "
                                                            }), a.register_details.email ? a.register_details.email : "N/A", Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                                children: "Business Location : "
                                                            }), a.register_details.location_name ? a.register_details.location_name : "N/A", Object(w.jsx)("br", {})]
                                                        })
                                                    })]
                                                })]
                                            })
                                        }), Object(w.jsxs)("div", {
                                            className: "modal-footer",
                                            children: [Object(w.jsx)("button", {
                                                type: "button",
                                                className: "btn btn-default current-text current-footer-btn",
                                                "data-dismiss": "modal",
                                                "aria-label": "Close",
                                                onClick: t,
                                                onKeyPress: t,
                                                children: "Cancel"
                                            }), Object(w.jsx)("button", {
                                                type: "submit",
                                                className: "btn btn-primary current-footer-btn",
                                                "data-bs-dismiss": "modal",
                                                "aria-label": "Close",
                                                onClick: function () {
                                                    return g()
                                                },
                                                onKeyPress: t,
                                                children: "Close Register"
                                            })]
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                })),
                ne = n(193),
                ce = n(194),
                ae = function (e) {
                    var t = e.onClickDeleteTransaction,
                        n = e.deleteTransactions;
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), Object(w.jsx)("div", {
                        className: "customer-modal delete-modal",
                        children: Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog delete-content",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsxs)("div", {
                                            className: "col-sm-10 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: [Object(w.jsx)("div", {
                                                className: "mb-3 pe-lg-2 me-lg-1 mt-0 mt-lg-0",
                                                children: Object(w.jsx)("h4", {
                                                    className: "modal-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-2",
                                                    id: "deleteModal",
                                                    children: "Delete"
                                                })
                                            }), Object(w.jsx)("p", {
                                                className: "heading-model text-start",
                                                children: "Are you sure want to delete recent transaction?"
                                            })]
                                        }), Object(w.jsx)("div", {
                                            className: "text-end",
                                            children: Object(w.jsxs)("div", {
                                                className: "d-flex justify-content-end mt-4 align-items-center",
                                                children: [Object(w.jsx)("button", {
                                                    className: "btn btn-primary modal-Yes-btn",
                                                    "aria-label": "login",
                                                    onClick: n,
                                                    children: "Yes"
                                                }), Object(w.jsx)("button", {
                                                    className: "btn btn-primary model-No-btn",
                                                    "aria-label": "Close",
                                                    onClick: t,
                                                    onKeyPress: t,
                                                    children: "No"
                                                })]
                                            })
                                        })]
                                    })
                                })]
                            })
                        })
                    })
                },
                re = function (e) {
                    Object(J.a)(n, e);
                    var t = Object(Q.a)(n);

                    function n() {
                        return Object(X.a)(this, n), t.apply(this, arguments)
                    }
                    return Object(V.a)(n, [{
                        key: "render",
                        value: function () {
                            var e = this.props.transactionDetails,
                                t = [];
                            if (!e) return Object(w.jsx)("div", {});
                            var n = function (e) {
                                var t = 0;
                                return e.print && e.print.appliedTax.forEach((function (e) {
                                    t += e.tax_amount
                                })), +t.toFixed(4)
                            }(e),
                                c = n + e.print.modifier_tax,
                                a = (e.print.final_total, parseFloat(c).toFixed(2), 0),
                                r = function (e) {
                                    var t = [];
                                    return e.forEach((function (e) {
                                        0 === +e.sell_price_inc_tax && t.push(e.variation)
                                    })), 0 === t.length ? "" : Object(w.jsxs)("tr", {
                                        children: [Object(w.jsx)("td", {}), Object(w.jsx)("td", {
                                            style: {
                                                fontSize: "14px"
                                            },
                                            children: t.join(",")
                                        }), Object(w.jsx)("td", {
                                            style: {
                                                textAlign: "end",
                                                padding: "0"
                                            }
                                        }), Object(w.jsx)("td", {
                                            style: {
                                                textAlign: "end",
                                                padding: "0"
                                            }
                                        }), Object(w.jsx)("td", {
                                            style: {
                                                textAlign: "end",
                                                padding: "0"
                                            }
                                        })]
                                    })
                                };
                            return Object(w.jsx)("div", {
                                style: {
                                    fontFamily: "'Playfair Display', serif"
                                },
                                children: Object(w.jsxs)("div", {
                                    style: {
                                        width: "100%",
                                        padding: "25px"
                                    },
                                    children: [Object(w.jsx)("table", {
                                        style: {
                                            width: "100%"
                                        },
                                        children: Object(w.jsx)("tbody", {
                                            children: Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("th", {
                                                    style: {
                                                        fontWeight: "unset",
                                                        width: "50%"
                                                    },
                                                    children: K()(new Date).format("DD/MM/YYYY")
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        fontWeight: "unset",
                                                        width: "50%"
                                                    },
                                                    children: "POS- \u0627\u0644\u0643 \u0634\u0627\u0648\u0631\u0645\u0627"
                                                })]
                                            })
                                        })
                                    }), Object(w.jsx)("br", {}), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%",
                                            marginBottom: "5px"
                                        },
                                        children: Object(w.jsx)("div", {
                                            style: {
                                                fontWeight: "unset"
                                            },
                                            dangerouslySetInnerHTML: {
                                                __html: e.print.header_text
                                            }
                                        })
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%"
                                        },
                                        children: Object(w.jsx)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(w.jsx)("tr", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: Object(w.jsxs)("td", {
                                                    style: {
                                                        textAlign: "start",
                                                        width: "100%"
                                                    },
                                                    children: [Object(w.jsxs)("p", {
                                                        style: {
                                                            margin: "0"
                                                        },
                                                        children: [Object(w.jsx)("b", {
                                                            style: {
                                                                fontSize: "21px",
                                                                textTransform: "uppercase"
                                                            },
                                                            children: e.print.location_name
                                                        }), Object(w.jsx)("br", {}), e.print.address, Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                            style: {
                                                                fontSize: "14px"
                                                            },
                                                            children: "VAT:"
                                                        }), " 123456789vat", Object(w.jsx)("br", {}), Object(w.jsx)("b", {
                                                            style: {
                                                                fontSize: "15px"
                                                            },
                                                            children: e.print.invoice_heading
                                                        })]
                                                    }), Object(w.jsx)("hr", {
                                                        style: {
                                                            border: "1px solid #000000",
                                                            marginBottom: "0",
                                                            marginTop: "15px"
                                                        }
                                                    })]
                                                })
                                            })
                                        })
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%",
                                            marginBottom: "5px"
                                        },
                                        children: Object(w.jsx)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "start",
                                                        fontWeight: "unset",
                                                        width: "100%",
                                                        padding: "0"
                                                    },
                                                    children: Object(w.jsx)("b", {
                                                        children: e.print.invoice_no_prefix
                                                    })
                                                }), Object(w.jsx)("th", {}), Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "end",
                                                        fontWeight: "unset",
                                                        padding: "0"
                                                    },
                                                    children: e.print.invoice_no
                                                })]
                                            })
                                        })
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%",
                                            marginBottom: "10px"
                                        },
                                        children: Object(w.jsx)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "start",
                                                        fontWeight: "unset",
                                                        padding: "0"
                                                    },
                                                    children: Object(w.jsx)("b", {
                                                        children: e.print.date_label
                                                    })
                                                }), Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "end",
                                                        fontWeight: "unset",
                                                        padding: "0",
                                                        whiteSpace: "nowrap"
                                                    },
                                                    children: e.print.invoice_date
                                                })]
                                            })
                                        })
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%",
                                            marginBottom: "5px"
                                        },
                                        children: Object(w.jsxs)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: [Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("th", {
                                                    style: {
                                                        borderBottom: " 2.5px dashed #b3b2b2",
                                                        paddingLeft: "5px"
                                                    },
                                                    children: "#"
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        width: "45%",
                                                        padding: "5px",
                                                        borderBottom: "2.5px dashed #b3b2b2"
                                                    },
                                                    children: e.print.table_product_label
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "right",
                                                        padding: "0",
                                                        borderBottom: "2.5px dashed #b3b2b2"
                                                    },
                                                    children: e.print.table_qty_label
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "right",
                                                        padding: "0",
                                                        borderBottom: "2.5px dashed #b3b2b2"
                                                    },
                                                    children: e.print.table_unit_price_label
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "right",
                                                        padding: "0",
                                                        borderBottom: "2.5px dashed #b3b2b2"
                                                    },
                                                    children: e.print.table_subtotal_label
                                                })]
                                            }), e.print && e.print.lines.map((function (e, n) {
                                                var c = +Object(E.f)(e.unit_price, 4) + e.single_product_tax,
                                                    s = +c.toFixed(2) * e.quantity;
                                                return Object(w.jsxs)(w.Fragment, {
                                                    children: [Object(w.jsxs)("tr", {
                                                        children: [Object(w.jsx)("td", {
                                                            children: n + 1
                                                        }), Object(w.jsx)("td", {
                                                            children: e.name
                                                        }), Object(w.jsxs)("td", {
                                                            style: {
                                                                textAlign: "end",
                                                                padding: "0"
                                                            },
                                                            children: [e.quantity, " ", e.units]
                                                        }), Object(w.jsx)("td", {
                                                            style: {
                                                                textAlign: "end",
                                                                padding: "0"
                                                            },
                                                            children: c.toFixed(2)
                                                        }), Object(w.jsx)("td", {
                                                            style: {
                                                                textAlign: "end",
                                                                padding: "0"
                                                            },
                                                            children: s.toFixed(2)
                                                        })]
                                                    }, n), e.modifiers && 0 !== e.modifiers.length ? e.modifiers.map((function (n, c) {
                                                        0 === +n.sell_price_inc_tax && t.push(n.variation);
                                                        var r = Object(E.f)(n.unit_price_inc_tax, 4),
                                                            s = 0;
                                                        n.tax_id && n.tax_id > 0 && (s = r * n.tax_amount / 100, a += s.toFixed(2) * e.quantity);
                                                        var o = (+r + s).toFixed(2);
                                                        if (+n.sell_price_inc_tax > 0) return Object(w.jsxs)("tr", {
                                                            children: [Object(w.jsx)("td", {}), Object(w.jsx)("td", {
                                                                style: {
                                                                    fontSize: "14px"
                                                                },
                                                                children: n.variation
                                                            }), Object(w.jsxs)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0",
                                                                    fontSize: "14px"
                                                                },
                                                                children: [n.quantity, " ", n.units]
                                                            }), Object(w.jsx)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0",
                                                                    fontSize: "14px"
                                                                },
                                                                children: o
                                                            }), Object(w.jsx)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0",
                                                                    fontSize: "14px"
                                                                },
                                                                children: (o * n.quantity).toFixed(2)
                                                            })]
                                                        }, c)
                                                    })) : null, e.modifiers && 0 !== e.modifiers.length && r(e.modifiers)]
                                                })
                                            }))]
                                        })
                                    }), Object(w.jsx)("hr", {
                                        style: {
                                            border: "1px solid black",
                                            marginTop: "15px"
                                        }
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%"
                                        },
                                        children: Object(w.jsxs)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: [Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "right",
                                                        width: "65%",
                                                        fontSize: "18px",
                                                        padding: "0"
                                                    },
                                                    children: e.print.subtotal_label
                                                }), Object(w.jsx)("th", {
                                                    style: {
                                                        textAlign: "end",
                                                        fontSize: "18px",
                                                        padding: "0"
                                                    },
                                                    children: (e.print.final_total - (a + n)).toFixed(2) + "\ufdfc "
                                                })]
                                            }), Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "right",
                                                        width: "65%"
                                                    },
                                                    children: "Tax"
                                                }), Object(w.jsxs)("td", {
                                                    style: {
                                                        textAlign: "end"
                                                    },
                                                    children: ["(+) \ufdfc ", (a + n).toFixed(2)]
                                                })]
                                            }), Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "right",
                                                        width: "65%"
                                                    },
                                                    children: Object(w.jsx)("b", {
                                                        style: {
                                                            fontSize: "18px"
                                                        },
                                                        children: e.print.total_label
                                                    })
                                                }), Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "end"
                                                    },
                                                    children: Object(w.jsx)("b", {
                                                        children: e.print.total
                                                    })
                                                })]
                                            }), e.print.payments && 0 !== e.print.payments.length ? e.print.payments.map((function (e, t) {
                                                return Object(w.jsxs)("tr", {
                                                    children: [Object(w.jsxs)("td", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%",
                                                            fontSize: "15px"
                                                        },
                                                        children: [e.method, "(", e.date, ")"]
                                                    }), Object(w.jsx)("td", {
                                                        style: {
                                                            textAlign: "end"
                                                        },
                                                        children: e.amount
                                                    })]
                                                }, t)
                                            })) : null, Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "right",
                                                        width: "65%"
                                                    },
                                                    children: e.print.total_paid_label
                                                }), Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "end"
                                                    },
                                                    children: e.print.total_paid
                                                })]
                                            }), Object(w.jsxs)("tr", {
                                                children: [Object(w.jsx)("td", {
                                                    style: {
                                                        textAlign: "right",
                                                        width: "65%"
                                                    },
                                                    children: e.print.total_due_label
                                                }), Object(w.jsxs)("td", {
                                                    style: {
                                                        textAlign: "end"
                                                    },
                                                    children: [e.print.total_due, " "]
                                                })]
                                            })]
                                        })
                                    }), Object(w.jsx)("hr", {
                                        style: {
                                            border: "1px solid #000000"
                                        }
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%"
                                        },
                                        children: Object(w.jsx)("div", {
                                            style: {
                                                fontWeight: "unset"
                                            },
                                            dangerouslySetInnerHTML: {
                                                __html: e.print.footer_text
                                            }
                                        })
                                    }), Object(w.jsx)("table", {
                                        style: {
                                            width: "100%"
                                        },
                                        children: Object(w.jsx)("tbody", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(w.jsx)("tr", {
                                                children: Object(w.jsx)("td", {
                                                    children: Object(w.jsx)("p", {
                                                        style: {
                                                            textAlign: "center",
                                                            margin: "0"
                                                        },
                                                        children: e.print.additional_notes
                                                    })
                                                })
                                            })
                                        })
                                    })]
                                })
                            })
                        }
                    }]), n
                }(a.a.PureComponent),
                se = Object(o.b)((function (e) {
                    return {
                        recentTransactions: e.recentTransactions,
                        isLoading: e.isLoading
                    }
                }), {
                    fetchFinalTransaction: function (e) {
                        var t = !(arguments.length > 1 && void 0 !== arguments[1]) || arguments[1];
                        return function () {
                            var n = Object(O.a)(x.a.mark((function n(c) {
                                return x.a.wrap((function (n) {
                                    for (; ;) switch (n.prev = n.next) {
                                        case 0:
                                            return t && c(_(!0)), n.next = 3, f.a.get("get-recent-transactions?status=".concat(e)).then((function (e) {
                                                c({
                                                    type: u.k.FETCH_FINAL_TRANSACTION,
                                                    payload: e.data.transactions
                                                }), t && c(_(!1))
                                            })).catch((function (e) {
                                                var n = e.response;
                                                c({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: n.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                }), t && c(_(!1))
                                            }));
                                        case 3:
                                        case "end":
                                            return n.stop()
                                    }
                                }), n)
                            })));
                            return function (e) {
                                return n.apply(this, arguments)
                            }
                        }()
                    },
                    deleteTransaction: function (e) {
                        return function () {
                            var t = Object(O.a)(x.a.mark((function t(n) {
                                return x.a.wrap((function (t) {
                                    for (; ;) switch (t.prev = t.next) {
                                        case 0:
                                            return t.next = 2, f.a.post("recent-transaction-delete?transaction_id=".concat(e)).then((function () {
                                                n({
                                                    type: u.k.DELETE_TRANSACTION,
                                                    payload: e
                                                })
                                            })).catch((function (e) {
                                                var t = e.response;
                                                n({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        type: u.q.ERROR,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return t.stop()
                                    }
                                }), t)
                            })));
                            return function (e) {
                                return t.apply(this, arguments)
                            }
                        }()
                    },
                    editSuspendedSales: z.c
                })((function (e) {
                    var t = e.onRecentClickToggleModal,
                        n = e.fetchFinalTransaction,
                        a = e.recentTransactions,
                        r = e.isLoading,
                        s = e.deleteTransaction,
                        o = e.editSuspendedSales,
                        i = e.closeModal,
                        l = Object(c.useState)(!1),
                        d = Object(j.a)(l, 2),
                        u = d[0],
                        b = d[1],
                        m = Object(c.useState)(0),
                        p = Object(j.a)(m, 2),
                        h = p[0],
                        x = p[1],
                        O = Object(c.useState)(null),
                        f = Object(j.a)(O, 2),
                        _ = f[0],
                        y = f[1],
                        g = Object(c.useState)(!1),
                        v = Object(j.a)(g, 2),
                        S = v[0],
                        E = v[1],
                        T = Object(c.useRef)(),
                        k = function (e) {
                            b(!u), x(e)
                        };
                    Object(c.useEffect)((function () {
                        n("final")
                    }), []);
                    var A = Object($.useReactToPrint)({
                        content: function () {
                            return T.current
                        }
                    }),
                        D = function (e, t) {
                            return Object(w.jsx)("table", {
                                className: "table bg-white recent-modal__custom-recent-table table-responsive",
                                children: Object(w.jsx)("tbody", {
                                    className: "recent-modal__recent-tbody",
                                    children: Object(w.jsxs)("tr", {
                                        className: "cursor-pointer recent-modal__recent-row",
                                        children: [Object(w.jsx)("td", {
                                            children: t + 1
                                        }), Object(w.jsxs)("td", {
                                            className: "custom-data",
                                            children: [e.invoice_no, " ", e.contact.name]
                                        }), Object(w.jsx)("td", {
                                            className: "display_currency",
                                            title: parseFloat(e.final_total).toFixed(2),
                                            children: parseFloat(e.final_total).toFixed(2)
                                        }), Object(w.jsxs)("td", {
                                            className: "display_icon",
                                            children: [Object(w.jsx)("a", {
                                                href: "#",
                                                onClick: function () {
                                                    return t = e.id, i(), void o(t);
                                                    var t
                                                },
                                                className: "delete-sale",
                                                children: Object(w.jsx)("i", {
                                                    className: "fas fa-pen text-muted",
                                                    "aria-hidden": "true",
                                                    title: "Click to edit"
                                                })
                                            }), Object(w.jsx)("a", {
                                                href: "#",
                                                onClick: function () {
                                                    return k(e.id)
                                                },
                                                children: Object(w.jsx)("i", {
                                                    className: "fa fa-trash text-danger",
                                                    title: "Click to delete"
                                                })
                                            }), u && Object(w.jsx)(ae, {
                                                onClickDeleteTransaction: k,
                                                deleteTransactions: function () {
                                                    return s(h), void b(!1)
                                                }
                                            }), Object(w.jsx)("a", {
                                                href: "#",
                                                className: "print-invoice-link print-icon",
                                                onMouseEnter: function () {
                                                    return y(e), void E(!0)
                                                },
                                                onClick: A,
                                                children: Object(w.jsx)("i", {
                                                    className: "fa fa-print text-muted",
                                                    "aria-hidden": "true",
                                                    title: "Click to print"
                                                })
                                            })]
                                        })]
                                    })
                                })
                            }, t)
                        },
                        R = function () {
                            return Object(w.jsx)("div", {
                                children: 0 !== a.length ? a.map((function (e, t) {
                                    return D(e, t)
                                })) : r ? Object(w.jsx)(C.CommonLoading, {}) : Object(w.jsx)("h3", {
                                    className: "text-center py-3 highlight-color",
                                    children: "No Recent Transactions Available"
                                })
                            })
                        };
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), Object(w.jsxs)("div", {
                        className: "recent-modal pos-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close custom-close-btn",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsx)("div", {
                                        className: "row",
                                        children: Object(w.jsx)("div", {
                                            className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4 h-top-75",
                                            children: Object(w.jsxs)("div", {
                                                className: "mb-5 pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0",
                                                children: [Object(w.jsx)("h5", {
                                                    className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-4",
                                                    id: "paymentModalLabel",
                                                    children: "Recent Transactions"
                                                }), Object(w.jsxs)(ne.a, {
                                                    defaultActiveKey: "final",
                                                    onSelect: function (e) {
                                                        n(e)
                                                    },
                                                    id: "uncontrolled-tab-example",
                                                    className: "recent-tabs mb-3",
                                                    children: [Object(w.jsx)(ce.a, {
                                                        eventKey: "final",
                                                        title: "Final",
                                                        value: "final",
                                                        children: R()
                                                    }), Object(w.jsx)(ce.a, {
                                                        eventKey: "quotation",
                                                        title: "Quotation",
                                                        value: "quotation",
                                                        children: R()
                                                    }), Object(w.jsx)(ce.a, {
                                                        eventKey: "draft",
                                                        title: "Draft",
                                                        value: "draft",
                                                        children: R()
                                                    }), Object(w.jsx)("div", {
                                                        className: "d-none",
                                                        children: S && Object(w.jsx)(re, {
                                                            ref: T,
                                                            transactionDetails: _
                                                        })
                                                    })]
                                                })]
                                            })
                                        })
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                })),
                oe = Object(o.b)((function (e) {
                    return {
                        suspendedSales: e.suspendedSales,
                        editSuspendedSale: e.editSuspendedSale
                    }
                }))((function (e) {
                    var t = e.onClickFullScreen,
                        n = e.editSuspendedSale,
                        a = Object(c.useState)(!0),
                        r = Object(j.a)(a, 2),
                        s = r[0],
                        o = r[1],
                        i = Object(c.useState)(!1),
                        l = Object(j.a)(i, 2),
                        d = l[0],
                        u = l[1],
                        b = Object(c.useState)(!1),
                        m = Object(j.a)(b, 2),
                        p = m[0],
                        h = m[1],
                        x = Object(c.useState)(!1),
                        O = Object(j.a)(x, 2),
                        f = O[0],
                        _ = O[1],
                        y = Object(c.useState)(!1),
                        g = Object(j.a)(y, 2),
                        v = g[0],
                        N = g[1];
                    Object(c.useEffect)((function () {
                        var e = setInterval((function () {
                            navigator.onLine ? o(!0) : o(!1)
                        }), 1e3);
                        return function () {
                            return clearInterval(e)
                        }
                    }), []);
                    var S = function () {
                        u(!d)
                    },
                        C = function () {
                            h(!p)
                        },
                        E = function () {
                            _(!f)
                        },
                        T = function () {
                            N(!v)
                        };
                    Object(c.useEffect)((function () {
                        document.body.style.overflow = p ? "hidden" : "unset"
                    }), [p]), Object(c.useEffect)((function () {
                        document.body.style.overflow = v ? "hidden" : "unset"
                    }), [v]), Object(c.useEffect)((function () {
                        document.body.style.overflow = d ? "hidden" : "unset"
                    }), [d]), Object(c.useEffect)((function () {
                        document.body.style.overflow = f ? "hidden" : "unset"
                    }), [f]);
                    return Object(w.jsxs)("div", {
                        className: "top-bar_btn-grp d-flex flex-wrap justify-content-end",
                        children: [Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                return t()
                            },
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Fullscreen",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-window-maximize",
                                "aria-hidden": "true"
                            })
                        }), Object(w.jsx)("button", {
                            type: "button",
                            "data-bs-toggle": "modal",
                            "data-bs-target": "#servicemanModal",
                            onClick: S,
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Suspended Order",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-pause",
                                "aria-hidden": "true"
                            })
                        }), d && Object(w.jsx)(W, {
                            editSuspendedSale: n,
                            onPauseClickToggleModal: S
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: T,
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Recent Transactions",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-clock",
                                "aria-hidden": "true"
                            })
                        }), v && Object(w.jsx)(se, {
                            onRecentClickToggleModal: T,
                            closeModal: function () {
                                N(!1)
                            }
                        }), Object(w.jsx)("button", {
                            type: "button",
                            "data-bs-toggle": "modal",
                            "data-bs-target": "#servicemanModal",
                            onClick: C,
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Register Details",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-briefcase",
                                "aria-hidden": "true"
                            })
                        }), p && Object(w.jsx)(ee, {
                            onRegisterClickToggleModal: C
                        }), Object(w.jsx)("button", {
                            type: "button",
                            "data-bs-target": "#servicemanModal",
                            onClick: E,
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Current Register",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-times",
                                "aria-hidden": "true"
                            })
                        }), f && Object(w.jsx)(te, {
                            onCloseRegisterModal: E
                        }), Object(w.jsx)("button", {
                            type: "button",
                            onClick: function () {
                                window.location.replace("http://localhost:8000/home")
                            },
                            className: "btn btn-light top-bar__text-btn me-2 text-primary",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Back to Dashboard",
                            children: Object(w.jsx)("i", {
                                className: "fa fa-tachometer-alt",
                                "aria-hidden": "true"
                            })
                        }), Object(w.jsx)("button", {
                            type: "button",
                            "data-toggle": "tooltip",
                            "data-placement": "top",
                            title: "Internet Connection",
                            className: "".concat(s ? "text-primary" : "text-danger", " btn btn-light top-bar__text-btn"),
                            children: Object(w.jsx)("i", {
                                className: "fa  fa-wifi",
                                "aria-hidden": "true"
                            })
                        })]
                    })
                })),
                ie = n(40),
                le = function (e) {
                    var t = e.clickProductDetailModal,
                        n = e.cartProduct,
                        a = e.onProductUpdateInCart,
                        r = Object(c.useState)(n),
                        s = Object(j.a)(r, 2),
                        o = s[0],
                        i = s[1],
                        l = Object(c.useState)(""),
                        d = Object(j.a)(l, 2),
                        u = d[0],
                        b = d[1],
                        m = Object(c.useState)(0),
                        p = Object(j.a)(m, 2),
                        h = p[0],
                        x = p[1],
                        O = Object(c.useState)(""),
                        f = Object(j.a)(O, 2),
                        _ = f[0],
                        y = f[1],
                        g = Object(c.useState)(""),
                        v = Object(j.a)(g, 2),
                        S = v[0],
                        C = v[1],
                        E = Object(c.useState)(""),
                        T = Object(j.a)(E, 2),
                        k = T[0],
                        A = T[1],
                        D = Object(c.useState)(""),
                        R = Object(j.a)(D, 2),
                        F = R[0],
                        P = R[1];
                    if (Object(c.useEffect)((function () {
                        i(n), b(parseFloat(n.product_row.product.unit_price).toFixed(2)), x(o.product_row.discount.discount_amount ? parseFloat(o.product_row.discount.discount_amount).toFixed(2) : 0), y(o.product_row.discount.discount_type), C(n.product_row.product.warranty_id), A(n.product_row.product.tax_id ? n.product_row.product.tax_id : n.product_row.tax_dropdown && n.product_row.tax_dropdown.id), P(n.product_row.product.sell_line_note)
                    }), [n]), Object(N.b)("keydown", (function (e) {
                        var t = e.key;
                        N.a.includes(String(t)) && L()
                    })), !n) return "";
                    var L = function () {
                        t()
                    },
                        I = function () {
                            var e = o;
                            e.product_row.discount.discount_amount = h, e.product_row.product.unit_price = u, e.product_row.discount.discount_type = _, e.product_row.product.warranty_id = S, e.product_row.product.tax_id = k, e.product_row.product.sell_line_note = F, a(e), t()
                        };
                    return Object(w.jsxs)("div", {
                        className: "customer-modal pos-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content border-0 px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: function () {
                                        return L()
                                    },
                                    onKeyPress: function () {
                                        return L()
                                    },
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsx)("div", {
                                            className: "col-lg-11 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: Object(w.jsxs)("div", {
                                                className: "mb-5 pe-lg-2 me-lg-1 mt-0 mt-sm-5 mt-lg-0",
                                                children: [Object(w.jsxs)("h5", {
                                                    className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-4",
                                                    id: "paymentModalLabel",
                                                    children: [o.product_row.product.product_name, " - ", o.product_row.product.product_id]
                                                }), Object(w.jsxs)("div", {
                                                    className: "customer-modal__select-customer bg-secondary p-3 pb-5",
                                                    children: [Object(w.jsxs)("div", {
                                                        className: "row align-items-center",
                                                        children: [Object(w.jsxs)("div", {
                                                            children: [Object(w.jsx)("label", {
                                                                htmlFor: "searchCustomer",
                                                                className: "col-12 modal-subtitle col-form-label",
                                                                children: "Unit Price:"
                                                            }), Object(w.jsx)("div", {
                                                                className: "col-12 field-w-100",
                                                                children: Object(w.jsx)("input", {
                                                                    disabled: !o.product_row.edit_price,
                                                                    name: "amount",
                                                                    type: "number",
                                                                    className: "form-control amount-input",
                                                                    onChange: function (e) {
                                                                        b(e.target.value)
                                                                    },
                                                                    value: u
                                                                })
                                                            })]
                                                        }), Object(w.jsxs)("div", {
                                                            className: "col-6 col-xs-12 col-sm-6 field-w-100",
                                                            children: [Object(w.jsx)("label", {
                                                                htmlFor: "searchCustomer",
                                                                className: "col-6 col-xs-12 col-sm-6 modal-subtitle col-form-label",
                                                                children: "Discount Type:"
                                                            }), Object(w.jsxs)("select", {
                                                                className: "form-control select2 input-border",
                                                                id: "searchCustomer",
                                                                disabled: !o.product_row.edit_discount,
                                                                onChange: function (e) {
                                                                    return function (e) {
                                                                        y(e.target.value)
                                                                    }(e)
                                                                },
                                                                value: _,
                                                                children: [Object(w.jsx)("option", {
                                                                    value: "fixed",
                                                                    children: "Fixed"
                                                                }), Object(w.jsx)("option", {
                                                                    value: "percentage",
                                                                    children: "Percentage"
                                                                })]
                                                            }), o.product_row.discount.formated_ends_at ? Object(w.jsxs)("div", {
                                                                children: ["Discount: Dics applied (Ends at: ", o.product_row.discount.formated_ends_at, ")"]
                                                            }) : ""]
                                                        }), Object(w.jsxs)("div", {
                                                            className: "col-6 col-xs-12 col-sm-6 field-w-100",
                                                            children: [Object(w.jsx)("label", {
                                                                htmlFor: "searchCustomer",
                                                                className: "col-6 col-xs-12 col-sm-6 modal-subtitle col-form-label",
                                                                children: "Discount Amount:"
                                                            }), Object(w.jsx)("input", {
                                                                id: "courseDurationInput",
                                                                type: "number",
                                                                min: "0",
                                                                pattern: "[0-9]*",
                                                                onChange: function (e) {
                                                                    return function (e) {
                                                                        var t = e.target.value ? e.target.value : " ";
                                                                        x(t)
                                                                    }(e)
                                                                },
                                                                className: "form-control amount-input",
                                                                "aria-describedby": "search customer",
                                                                value: h,
                                                                disabled: !o.product_row.edit_discount
                                                            })]
                                                        }), o.product_row.enabled_tax && Object(w.jsxs)("div", {
                                                            className: "col-6 col-xs-12 col-sm-6",
                                                            children: [Object(w.jsx)("label", {
                                                                htmlFor: "searchCustomer",
                                                                className: "col-6 col-xs-12 col-sm-6 modal-subtitle col-form-label",
                                                                children: "Tax:"
                                                            }), Object(w.jsxs)("select", {
                                                                className: "form-control select2 input-border",
                                                                id: "searchCustomer",
                                                                onChange: function (e) {
                                                                    A(e.target.value)
                                                                },
                                                                value: k,
                                                                children: [Object(w.jsx)("option", {
                                                                    value: " ",
                                                                    children: "Please select"
                                                                }), 0 !== o.product_row.all_tax_dropdown.length && o.product_row.all_tax_dropdown.map((function (e, t) {
                                                                    return Object(w.jsx)("option", {
                                                                        value: e.id,
                                                                        className: "option-drop new",
                                                                        children: e.name
                                                                    }, t)
                                                                }))]
                                                            })]
                                                        }), o.product_row.enabled_warranties && Object(w.jsxs)("div", {
                                                            className: "col-6 col-xs-12 col-sm-6",
                                                            children: [Object(w.jsx)("label", {
                                                                htmlFor: "warranty",
                                                                className: "col-6 col-xs-12 col-sm-6 modal-subtitle col-form-label",
                                                                children: "Warranty:"
                                                            }), Object(w.jsxs)("select", {
                                                                className: "form-control select2 input-border",
                                                                id: "warranty",
                                                                onChange: function (e) {
                                                                    C(e.target.value)
                                                                },
                                                                value: S,
                                                                children: [Object(w.jsx)("option", {
                                                                    value: "Please select",
                                                                    children: "Please select"
                                                                }), o.product_row.warranties.map((function (e, t) {
                                                                    return Object(w.jsx)("option", {
                                                                        value: e.id,
                                                                        className: "option-drop new",
                                                                        children: e.name
                                                                    }, t)
                                                                }))]
                                                            })]
                                                        }), Object(w.jsx)("label", {
                                                            htmlFor: "searchCustomer",
                                                            className: "col-12 modal-subtitle col-form-label",
                                                            children: "Description:"
                                                        }), Object(w.jsx)("div", {
                                                            className: "col-12 field-w-100",
                                                            children: Object(w.jsx)("div", {
                                                                className: "overflow-hidden textarea-box",
                                                                children: Object(w.jsx)("textarea", {
                                                                    id: "searchCustomer",
                                                                    value: F,
                                                                    onChange: function (e) {
                                                                        P(e.target.value)
                                                                    },
                                                                    className: "form-control amount-input description-input",
                                                                    "aria-describedby": "search customer"
                                                                })
                                                            })
                                                        })]
                                                    }), Object(w.jsx)("p", {
                                                        children: "Add product IMEI, Serial number or other informations here."
                                                    })]
                                                })]
                                            })
                                        }), Object(w.jsx)("div", {
                                            className: "text-end",
                                            children: Object(w.jsx)("button", {
                                                type: "button",
                                                onClick: function () {
                                                    return I()
                                                },
                                                onKeyPress: function () {
                                                    return I()
                                                },
                                                className: "btn btn-primary modal-btn modal-footer-btn customer-modal__add-btn mt-3",
                                                children: "Save"
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: L,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: L
                        })]
                    })
                },
                de = function (e) {
                    var t = e.onClickSuspendItemModal,
                        n = e.suspendedItem;
                    return Object(N.b)("keydown", (function (e) {
                        var n = e.key;
                        N.a.includes(String(n)) && t()
                    })), Object(w.jsxs)("div", {
                        className: "customer-modal delete-modal",
                        children: [Object(w.jsx)("div", {
                            className: "modal-dialog modal-dialog-centered hide-show-dialog delete-content",
                            children: Object(w.jsxs)("div", {
                                className: "modal-content px-2 px-sm-4 py-2",
                                children: [Object(w.jsx)("button", {
                                    type: "button",
                                    className: "btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    onClick: t,
                                    onKeyPress: t,
                                    children: "X"
                                }), Object(w.jsx)("div", {
                                    className: "modal-body",
                                    children: Object(w.jsxs)("div", {
                                        className: "row",
                                        children: [Object(w.jsxs)("div", {
                                            className: "col-sm-10 col-12 border-4 border-lg-end pe-lg-0 pe-sm-4",
                                            children: [Object(w.jsx)("div", {
                                                className: "mb-3 pe-lg-2 me-lg-1 mt-0 mt-lg-0",
                                                children: Object(w.jsx)("h4", {
                                                    className: "modal-title border-bottom border-4 mb-3 pend-sm-90 mb-sm-4 mb-md-3 mt-sm-0 mt-2",
                                                    id: "deleteModal",
                                                    children: "Alert"
                                                })
                                            }), Object(w.jsx)("p", {
                                                className: "heading-model text-start",
                                                children: "Are you sure want to add sales?"
                                            })]
                                        }), Object(w.jsx)("div", {
                                            className: "text-end",
                                            children: Object(w.jsxs)("div", {
                                                className: "d-flex justify-content-end mt-4 align-items-center",
                                                children: [Object(w.jsx)("button", {
                                                    className: "btn btn-primary modal-Yes-btn",
                                                    "aria-label": "login",
                                                    onClick: n,
                                                    children: "Yes"
                                                }), Object(w.jsx)("button", {
                                                    className: "btn btn-primary model-No-btn",
                                                    "aria-label": "Close",
                                                    onClick: t,
                                                    onKeyPress: t,
                                                    children: "No"
                                                })]
                                            })
                                        })]
                                    })
                                })]
                            })
                        }), Object(w.jsx)("div", {
                            className: "bg-overlay",
                            onClick: t,
                            role: "button",
                            tabIndex: "0",
                            "aria-label": "background overlay",
                            onKeyDown: t
                        })]
                    })
                },
                ue = Object(o.b)((function (e) {
                    return {
                        user: e.user,
                        locations: e.locations,
                        toastMessage: e.toastMessage,
                        editSuspendedSale: e.editSuspendedSale,
                        customers: e.customers
                    }
                }), {
                    fetchLoginUser: function () {
                        return function () {
                            var e = Object(O.a)(x.a.mark((function e(t) {
                                return x.a.wrap((function (e) {
                                    for (; ;) switch (e.prev = e.next) {
                                        case 0:
                                            return e.next = 2, f.a.get(u.a.LOGIN_USER).then((function (e) {
                                                t({
                                                    type: u.g.LOGIN_USER,
                                                    payload: e.data.user
                                                })
                                            })).catch((function (e) {
                                                Object(R.a)(e)
                                            }));
                                        case 2:
                                        case "end":
                                            return e.stop()
                                    }
                                }), e)
                            })));
                            return function (t) {
                                return e.apply(this, arguments)
                            }
                        }()
                    },
                    fetchLocation: A,
                    suspendedProduct: function (e, t) {
                        return function () {
                            var n = Object(O.a)(x.a.mark((function n(c) {
                                return x.a.wrap((function (n) {
                                    for (; ;) switch (n.prev = n.next) {
                                        case 0:
                                            return n.next = 2, f.a.post("suspended-sell-note", e).then((function (e) {
                                                c({
                                                    type: u.n.ADD_SUSPENDED_PRODUCT,
                                                    payload: e.data.data
                                                }), c({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: e.data.msg,
                                                        display: !0
                                                    }
                                                }), t({
                                                    status: !0
                                                })
                                            })).catch((function (e) {
                                                var t = e.response;
                                                c({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return n.stop()
                                    }
                                }), n)
                            })));
                            return function (e) {
                                return n.apply(this, arguments)
                            }
                        }()
                    },
                    editSuspendedProduct: function (e, t, n) {
                        return function () {
                            var c = Object(O.a)(x.a.mark((function c(a) {
                                return x.a.wrap((function (c) {
                                    for (; ;) switch (c.prev = c.next) {
                                        case 0:
                                            return c.next = 2, f.a.post("update-suspended-sell?transaction_id=".concat(t), e).then((function (e) {
                                                a({
                                                    type: u.n.ADD_SUSPENDED_PRODUCT,
                                                    payload: e.data.data
                                                }), a({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: e.data.msg,
                                                        display: !0
                                                    }
                                                }), n({
                                                    status: !0
                                                })
                                            })).catch((function (e) {
                                                var t = e.response;
                                                a({
                                                    type: u.d.ADD_TOAST,
                                                    payload: {
                                                        text: t.data.message,
                                                        display: !0
                                                    }
                                                })
                                            }));
                                        case 2:
                                        case "end":
                                            return c.stop()
                                    }
                                }), c)
                            })));
                            return function (e) {
                                return c.apply(this, arguments)
                            }
                        }()
                    }
                })((function (e) {
                    var t = e.fetchLoginUser,
                        n = e.user,
                        a = e.fetchLocation,
                        r = e.locations,
                        s = e.suspendedProduct,
                        o = e.toastMessage,
                        i = e.editSuspendedSale,
                        l = e.editSuspendedProduct,
                        d = e.customers,
                        u = Object(c.useState)(null),
                        m = Object(j.a)(u, 2),
                        p = m[0],
                        h = m[1],
                        x = Object(c.useState)(0),
                        O = Object(j.a)(x, 2),
                        f = O[0],
                        _ = O[1],
                        y = Object(c.useState)(!1),
                        g = Object(j.a)(y, 2),
                        v = g[0],
                        N = g[1],
                        S = Object(c.useState)(""),
                        C = Object(j.a)(S, 2),
                        A = C[0],
                        R = C[1],
                        P = Object(c.useState)(!1),
                        L = Object(j.a)(P, 2),
                        z = L[0],
                        B = L[1],
                        K = Object(c.useState)(!1),
                        G = Object(j.a)(K, 2),
                        W = G[0],
                        X = G[1],
                        V = Object(c.useState)(!1),
                        J = Object(j.a)(V, 2),
                        Q = J[0],
                        $ = J[1],
                        Z = Object(c.useState)({}),
                        ee = Object(j.a)(Z, 2),
                        te = ee[0],
                        ne = ee[1],
                        ce = Object(c.useState)(null),
                        ae = Object(j.a)(ce, 2),
                        re = ae[0],
                        se = ae[1],
                        ue = Object(c.useState)(null),
                        be = Object(j.a)(ue, 2),
                        me = be[0],
                        je = be[1],
                        pe = Object(c.useState)(null),
                        he = Object(j.a)(pe, 2),
                        xe = he[0],
                        Oe = he[1],
                        fe = Object(c.useState)(null),
                        _e = Object(j.a)(fe, 2),
                        ye = _e[0],
                        ge = _e[1],
                        ve = Object(c.useState)(0),
                        Ne = Object(j.a)(ve, 2),
                        we = Ne[0],
                        Se = Ne[1],
                        Ce = Object(c.useState)([]),
                        Ee = Object(j.a)(Ce, 2),
                        Te = Ee[0],
                        ke = Ee[1],
                        Ae = Object(c.useState)(null),
                        De = Object(j.a)(Ae, 2),
                        Re = (De[0], De[1]);
                    if (Object(c.useEffect)((function () {
                        document.body.style.overflow = z ? "hidden" : "unset"
                    })), Object(c.useEffect)((function () {
                        if (d.data) {
                            var e = {
                                id: d.data.id,
                                label: d.data.name
                            };
                            je(e)
                        }
                    }), [d]), Object(c.useEffect)((function () {
                        if (0 !== i.length) {
                            var e = {
                                id: i.products[0].product_row.product.contact_id,
                                label: i.products[0].product_row.product.customer_name
                            };
                            ke(i.products), Se(i.transaction_id), je(e)
                        }
                    }), [i]), Object(c.useEffect)((function () {
                        t(), a()
                    }), []), Object(c.useEffect)((function () {
                        ne(o), setTimeout((function () {
                            ne(!1)
                        }), 15e3)
                    }), [o]), Object(c.useEffect)((function () {
                        r.business_locations && 0 !== r.business_locations.length && r.business_locations.map((function (e) {
                            "selected" === e.selected_business_location ? h(e.id) : h(r.business_locations[0].id)
                        }))
                    }), [r]), !p) return "";
                    var Fe = function () {
                        B(!z)
                    },
                        Pe = function () {
                            $(!Q)
                        },
                        Le = function (e) {
                            ke(e)
                        },
                        Ie = function () {
                            N(!v)
                        },
                        Me = function (e) {
                            var t = [];
                            return e.forEach((function (e, n) {
                                0 === +e.sell_price_inc_tax && t.push(e.name)
                            })), 0 === t.length ? "" : Object(w.jsx)("p", {
                                className: "product-checkout__text mb-0",
                                children: t.join(",")
                            })
                        },
                        Ue = function (e, t) {
                            var n, c = e.product_row.product,
                                a = null !== (n = e.modifiers) && void 0 !== n ? n : [];
                            return Object(w.jsx)("div", {
                                className: "border-bottom border-2 product-box",
                                onClick: function () {
                                    return function (e) {
                                        R(""), _(e)
                                    }(t)
                                },
                                children: Object(w.jsxs)("div", {
                                    className: "".concat(f === t ? "active_todoList" : "", " product-block row align-items-center gx-0"),
                                    children: [Object(w.jsx)("div", {
                                        className: "col-7",
                                        children: Object(w.jsxs)("div", {
                                            className: "product-checkout__product",
                                            children: [Object(w.jsx)("h2", {
                                                className: "product-checkout__title mb-0",
                                                onClick: function () {
                                                    return se(e), void X(!0)
                                                },
                                                children: c.product_name
                                            }), a.map((function (e, t) {
                                                return function (e, t) {
                                                    return +e.sell_price_inc_tax > 0 ? Object(w.jsxs)("p", {
                                                        className: "product-checkout__text mb-0",
                                                        children: [e.name, " ", parseFloat(e.sell_price_inc_tax).toFixed(2), " SR"]
                                                    }, t) : ""
                                                }(e, t)
                                            })), Me(a)]
                                        })
                                    }), Object(w.jsx)("div", {
                                        className: "col-2",
                                        children: Object(w.jsx)("input", {
                                            type: "text",
                                            className: "product-checkout__qty text-center mb-0 custom_input",
                                            value: e.product_row.quantity
                                        })
                                    }), Object(w.jsx)("div", {
                                        className: "col-3",
                                        children: Object(w.jsxs)("div", {
                                            className: "d-flex align-middle justify-content-around align-items-center",
                                            children: [Object(w.jsx)("span", {
                                                className: "product-checkout__sub-total",
                                                children: Object(E.e)(e)
                                            }), Object(w.jsx)("span", {
                                                className: "product-checkout__trash-icon text-danger",
                                                children: Object(w.jsx)("i", {
                                                    className: "fas fa-trash-alt",
                                                    onClick: function () {
                                                        return function (e) {
                                                            var t = Te.filter((function (t, n) {
                                                                return n !== e
                                                            }));
                                                            Le(t), Re(e)
                                                        }(t)
                                                    }
                                                })
                                            })]
                                        })
                                    })]
                                })
                            }, t)
                        },
                        He = {
                            carts: Te,
                            user: n,
                            updateCart: Le,
                            customer: me,
                            transactionId: we,
                            selectedLocationId: p,
                            serviceManId: ye,
                            tableId: xe
                        };
                    return Object(w.jsx)(q.a, {
                        isFullScreen: v,
                        onChange: function () {
                            return Ie()
                        },
                        children: Object(w.jsxs)("div", {
                            className: "POS-page custom-border demo",
                            children: [Object(w.jsx)("div", {
                                className: "container-fluid px-0",
                                children: Object(w.jsx)("div", {
                                    className: "top-bar d-flex align-items-center ",
                                    children: Object(w.jsxs)("div", {
                                        className: "row w-100 gx-0 custom-pospage",
                                        children: [Object(w.jsxs)("div", {
                                            className: "col-lg-4 container-full-width bg-white",
                                            children: [Object(w.jsxs)("div", {
                                                className: "d-flex justify-content-between align-items-center top-bar__top-nav px-3",
                                                children: [Object(w.jsxs)("div", {
                                                    className: "top-bar_btn-grp d-flex flex-wrap",
                                                    children: [Object(w.jsx)("button", {
                                                        type: "button",
                                                        onClick: Pe,
                                                        disabled: 0 === Te.length,
                                                        className: "btn btn-light top-bar__mini-btn d-flex align-items-center justify-content-center me-4 text-primary",
                                                        children: Object(w.jsx)("i", {
                                                            className: "fa fa-pause",
                                                            "aria-hidden": "true"
                                                        })
                                                    }), Object(w.jsx)("button", {
                                                        type: "button",
                                                        onClick: Fe,
                                                        disabled: 0 === Te.length,
                                                        className: "btn btn-light top-bar__mini-btn d-flex align-items-center justify-content-center text-primary",
                                                        children: Object(w.jsx)("i", {
                                                            className: "fa fa-times",
                                                            "aria-hidden": "true"
                                                        })
                                                    })]
                                                }), Q && Object(w.jsx)(de, {
                                                    onClickSuspendItemModal: Pe,
                                                    suspendedItem: function () {
                                                        $(!1);
                                                        var e = [];
                                                        e.push({
                                                            cart: Te,
                                                            finalTotal: Object(E.c)(Te),
                                                            suspended: 1,
                                                            customerId: me ? me.id : "no_customer_select",
                                                            serviceManId: ye,
                                                            tableId: xe
                                                        }), we ? l(Object(ie.a)(e, p), we, (function (e) {
                                                            e.status && (ke([]), je(""), Se(0))
                                                        })) : s(Object(ie.a)(e, p), (function (e) {
                                                            e.status && (ke([]), je(""))
                                                        }))
                                                    }
                                                }), z && Object(w.jsx)(Y, {
                                                    onClickDeleteModal: Fe,
                                                    onClearCart: function () {
                                                        Le([]), B(!1)
                                                    }
                                                }), Object(w.jsxs)("div", {
                                                    className: "top-bar_btn-grp d-flex align-items-center",
                                                    children: [Object(w.jsx)("button", {
                                                        type: "button",
                                                        onClick: function () {
                                                            return function () {
                                                                var e = f - 1;
                                                                e < 0 && (e = Te.length - 1), _(e), R("")
                                                            }()
                                                        },
                                                        className: "d-flex align-items-center justify-content-center btn btn-light top-bar__round-mini-btn me-4 text-primary rounded-circle",
                                                        children: Object(w.jsx)("i", {
                                                            className: "fa fa-angle-up arrow-icon",
                                                            "aria-hidden": "true"
                                                        })
                                                    }), Object(w.jsx)("button", {
                                                        type: "button",
                                                        onClick: function () {
                                                            return function () {
                                                                var e = f + 1;
                                                                e === Te.length && (e = 0), R(""), _(e)
                                                            }()
                                                        },
                                                        className: "d-flex align-items-center justify-content-center btn btn-light top-bar__round-mini-btn text-primary rounded-circle",
                                                        children: Object(w.jsx)("i", {
                                                            className: "fa fa-angle-down arrow-icon",
                                                            "aria-hidden": "true"
                                                        })
                                                    })]
                                                })]
                                            }), Object(w.jsxs)("div", {
                                                className: "product-checkout mb-3",
                                                children: [Object(w.jsx)("div", {
                                                    className: "product-checkout__navs d-flex align-items-center px-3",
                                                    children: Object(w.jsxs)("div", {
                                                        className: "row w-100 gx-0",
                                                        children: [Object(w.jsx)("div", {
                                                            className: "col-7",
                                                            children: Object(w.jsx)("h4", {
                                                                className: "product-checkout__first-title mb-0 ms-1",
                                                                children: "Product"
                                                            })
                                                        }), Object(w.jsx)("div", {
                                                            className: "col-2",
                                                            children: Object(w.jsx)("h4", {
                                                                className: "product-checkout__first-title mb-0 text-center",
                                                                children: "QTY"
                                                            })
                                                        }), Object(w.jsx)("div", {
                                                            className: "col-3",
                                                            children: Object(w.jsx)("h4", {
                                                                className: "product-checkout__first-title mb-0 text-center",
                                                                children: "Sub-Total"
                                                            })
                                                        })]
                                                    })
                                                }), Object(w.jsx)("div", {
                                                    className: "cart-scrollbar",
                                                    children: Object(w.jsx)("div", {
                                                        className: "mb-4",
                                                        children: Te && Te.map((function (e, t) {
                                                            return Ue(e, t)
                                                        }))
                                                    })
                                                }), Object(w.jsx)("hr", {
                                                    className: "border-line mb-0"
                                                }), Object(w.jsx)("div", {
                                                    className: "product-checkout__navs-end px-3",
                                                    children: Object(w.jsxs)("div", {
                                                        className: "row w-100 gx-0 align-items-center",
                                                        children: [Object(w.jsxs)("div", {
                                                            className: "col-9 inline-div",
                                                            children: [Object(w.jsxs)("p", {
                                                                className: "product-checkout__final-total mb-0",
                                                                children: ["Total: ", Object(E.c)(Te), " SR"]
                                                            }), Object(w.jsxs)("div", {
                                                                children: [Object(w.jsxs)("p", {
                                                                    className: "product-checkout__modifier-tax mb-0 custom-text",
                                                                    children: ["Modifier Tax: ", Object(E.b)(Te), " SR"]
                                                                }), Object(w.jsxs)("p", {
                                                                    className: "product-checkout__tax mb-0 custom-text",
                                                                    children: ["TAX: ", Object(E.d)(Te), " SR"]
                                                                })]
                                                            })]
                                                        }), Object(w.jsx)("div", {
                                                            className: "col-3",
                                                            children: Object(w.jsxs)("p", {
                                                                className: "product-checkout__discount mb-0 text-center custom-text",
                                                                children: ["Discount: ", Object(E.a)(Te), " SR"]
                                                            })
                                                        })]
                                                    })
                                                })]
                                            }), Object(w.jsx)("div", {
                                                className: "calculator",
                                                children: Object(w.jsxs)("div", {
                                                    className: "row gx-0",
                                                    children: [Object(w.jsx)("div", {
                                                        className: "col-4 text-center border border-primary border-end-0 border-bottom-0",
                                                        children: Object(w.jsx)(I, {
                                                            selectCustomer: function (e) {
                                                                je(e)
                                                            },
                                                            customer: me
                                                        })
                                                    }), Object(w.jsx)("div", {
                                                        className: "col-4 text-center border border-primary border-end-0 border-bottom-0",
                                                        children: Object(w.jsx)(U, {
                                                            selectedLocationId: p,
                                                            onSelectService: function (e) {
                                                                ge(e)
                                                            },
                                                            serviceId: ye
                                                        })
                                                    }), Object(w.jsx)("div", {
                                                        className: "col-4 text-center border border-primary border-bottom-0",
                                                        children: Object(w.jsx)(M, {
                                                            selectedLocationId: p,
                                                            onSelectTable: function (e) {
                                                                Oe(e)
                                                            },
                                                            tableId: xe
                                                        })
                                                    }), Object(w.jsx)("div", {
                                                        className: "col-12",
                                                        children: Object(w.jsxs)("div", {
                                                            className: "row gx-0",
                                                            children: [Object(w.jsx)("div", {
                                                                className: "col-6 text-center border border-primary d-flex align-items-center justify-content-center",
                                                                children: Object(w.jsx)(F.a, Object(b.a)({}, He))
                                                            }), Object(w.jsx)("div", {
                                                                className: "col-6",
                                                                children: Object(w.jsx)(H, {
                                                                    buttonClickValue: A,
                                                                    handleClickButton: function (e) {
                                                                        R(e),
                                                                            function (e, t) {
                                                                                var n = Te.slice();
                                                                                n[t].product_row.quantity = e, Le(n)
                                                                            }(e, f)
                                                                    },
                                                                    removeLastCharacter: function () {
                                                                        var e = Te.slice(),
                                                                            t = 1 === e[f].product_row.quantity ? 0 : e[f].product_row.quantity.toString().slice(0, -1);
                                                                        e[f].product_row.quantity = t || 0, ke(e), R(A.slice(0, -1))
                                                                    }
                                                                })
                                                            })]
                                                        })
                                                    })]
                                                })
                                            })]
                                        }), Object(w.jsxs)("div", {
                                            className: "col-lg-8 container-full-width pe-0 right-top",
                                            children: [Object(w.jsxs)("div", {
                                                className: "right-content d-md-flex justify-content-md-between align-items-center top-bar__top-nav pe-3 ps-3 py-3 py-md-0",
                                                children: [Object(w.jsx)("nav", {
                                                    "aria-label": "breadcrumb",
                                                    className: "me-3 mb-3 mb-md-0",
                                                    children: Object(w.jsxs)("ul", {
                                                        className: "breadcrumb mb-0",
                                                        children: [Object(w.jsx)("li", {
                                                            className: "breadcrumb-item",
                                                            children: Object(w.jsx)("a", {
                                                                href: "#",
                                                                className: "text-white text-decoration-none",
                                                                children: Object(w.jsx)(D, {
                                                                    setSelectBoxId: function (e) {
                                                                        h(parseInt(e))
                                                                    }
                                                                })
                                                            })
                                                        }), Object(w.jsx)("li", {
                                                            className: "breadcrumb-item text-white user-padding",
                                                            "aria-current": "page",
                                                            children: n.first_name
                                                        })]
                                                    })
                                                }), Object(w.jsx)(oe, {
                                                    onClickFullScreen: Ie,
                                                    suspendedSales: i
                                                })]
                                            }), Object(w.jsx)(k, {
                                                selectedLocationId: p
                                            }), Object(w.jsx)(T, {
                                                selectedLocationId: p,
                                                updateCart: function (e) {
                                                    _(Te.length), R(""), Le(e)
                                                },
                                                cartProducts: Te
                                            })]
                                        })]
                                    })
                                })
                            }), W && Object(w.jsx)(le, {
                                clickProductDetailModal: function () {
                                    X(!1)
                                },
                                cartProduct: re,
                                onProductUpdateInCart: function (e) {
                                    var t = Te.slice();
                                    t[f] = e, Le(t)
                                }
                            }), te.display ? Object(w.jsxs)("div", {
                                className: "notification-toaster d-flex align-items-center justify-content-between",
                                children: [Object(w.jsx)("p", {
                                    className: "mb-0",
                                    children: o.text
                                }), Object(w.jsx)("button", {
                                    type: "button",
                                    onClick: function () {
                                        ne(!1)
                                    },
                                    className: "notification-toaster__close-icon btn-close",
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close",
                                    children: "X"
                                })]
                            }) : ""]
                        })
                    })
                })),
                be = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || l.c,
                me = Object(l.d)(m, be(Object(l.a)(i.a)));
            s.a.render(Object(w.jsx)("div", {
                children: Object(w.jsx)(o.a, {
                    store: me,
                    children: Object(w.jsx)(ue, {})
                })
            }), document.getElementById("root")), d()
        },
        2: function (e, t, n) {
            "use strict";
            n.d(t, "d", (function () {
                return c
            })), n.d(t, "a", (function () {
                return a
            })), n.d(t, "g", (function () {
                return r
            })), n.d(t, "b", (function () {
                return s
            })), n.d(t, "j", (function () {
                return o
            })), n.d(t, "f", (function () {
                return i
            })), n.d(t, "e", (function () {
                return l
            })), n.d(t, "m", (function () {
                return d
            })), n.d(t, "p", (function () {
                return u
            })), n.d(t, "h", (function () {
                return b
            })), n.d(t, "n", (function () {
                return m
            })), n.d(t, "q", (function () {
                return j
            })), n.d(t, "l", (function () {
                return p
            })), n.d(t, "c", (function () {
                return h
            })), n.d(t, "o", (function () {
                return x
            })), n.d(t, "k", (function () {
                return O
            })), n.d(t, "i", (function () {
                return f
            }));
            n(1), n(30);
            var c = {
                IS_LOADING: "IS_LOADING",
                ADD_TOAST: "ADD_TOAST",
                REMOVE_TOAST: "REMOVE_TOAST"
            },
                a = {
                    CATEGORY: "get-categories",
                    PRODUCT: "get-products",
                    LOGIN_USER: "login-user",
                    GET_PRODUCT_ROW: "get-product-row"
                },
                r = {
                    LOGIN_USER: "LOGIN_USER"
                },
                s = {
                    FETCH_CATEGORY: "FETCH_CATEGORY"
                },
                o = {
                    FETCH_ALL_PRODUCT: "FETCH_ALL_PRODUCT",
                    FETCH_PRODUCTS_CLICKABLE: "FETCH_PRODUCTS_CLICKABLE",
                    FETCH_FAVORITE: "FETCH_FAVORITE"
                },
                i = {
                    FETCH_LOCATION: "FETCH_LOCATION"
                },
                l = {
                    ADD_CUSTOMER_DATA: "ADD_CUSTOMER_DATA",
                    SEARCH_CUSTOMER: "SEARCH_CUSTOMER"
                },
                d = {
                    FETCH_SERVICEMAN: "FETCH_SERVICEMAN"
                },
                u = {
                    FETCH_TABLE: "FETCH_TABLE"
                },
                b = {
                    MODIFIER_PRODUCT: "MODIFIER_PRODUCT"
                },
                m = {
                    ADD_SUSPENDED_PRODUCT: "ADD_SUSPENDED_PRODUCT"
                },
                j = {
                    ERROR: "error"
                },
                p = {
                    FETCH_REGISTER_DETAILS: "FETCH_REGISTER_DETAILS"
                },
                h = {
                    FETCH_CLOSE_REGISTER: "FETCH_CLOSE_REGISTER",
                    CASH_CLOSE_REGISTER: "CASH_CLOSE_REGISTER"
                },
                x = {
                    FETCH_SUSPENDED_SALES: "FETCH_SUSPENDED_SALES",
                    DELETE_SUSPENDED_SALES: "DELETE_SUSPENDED_SALES",
                    DELETE_ALL_SUSPENDED_SALES: "DELETE_ALL_SUSPENDED_SALES",
                    EDIT_SUSPENDED_SALES: "EDIT_SUSPENDED_SALES"
                },
                O = {
                    FETCH_FINAL_TRANSACTION: "FETCH_FINAL_TRANSACTION",
                    DELETE_TRANSACTION: "DELETE_TRANSACTION"
                },
                f = {
                    PAYMENT_PRINT: "PAYMENT_PRINT"
                }
        },
        30: function (e, t, n) {
            "use strict";
            n.d(t, "d", (function () {
                return i
            })), n.d(t, "b", (function () {
                return l
            })), n.d(t, "a", (function () {
                return d
            })), n.d(t, "c", (function () {
                return u
            }));
            var c = n(5),
                a = n.n(c),
                r = n(7),
                s = n(8),
                o = n(2),
                i = function () {
                    return function () {
                        var e = Object(r.a)(a.a.mark((function e(t) {
                            return a.a.wrap((function (e) {
                                for (; ;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2, s.a.get("get-suspended-sells").then((function (e) {
                                            t({
                                                type: o.o.FETCH_SUSPENDED_SALES,
                                                payload: e.data
                                            })
                                        })).catch((function (e) {
                                            var n = e.response;
                                            t({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: n.data.message,
                                                    type: o.q.ERROR,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })));
                        return function (t) {
                            return e.apply(this, arguments)
                        }
                    }()
                },
                l = function (e) {
                    return function () {
                        var t = Object(r.a)(a.a.mark((function t(n) {
                            return a.a.wrap((function (t) {
                                for (; ;) switch (t.prev = t.next) {
                                    case 0:
                                        return t.next = 2, s.a.post("delete-suspended-sell?sell_id=".concat(e)).then((function () {
                                            n({
                                                type: o.o.DELETE_SUSPENDED_SALES,
                                                payload: e
                                            })
                                        })).catch((function (e) {
                                            var t = e.response;
                                            n({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: t.data.message,
                                                    type: o.q.ERROR,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return t.stop()
                                }
                            }), t)
                        })));
                        return function (e) {
                            return t.apply(this, arguments)
                        }
                    }()
                },
                d = function (e) {
                    return function () {
                        var t = Object(r.a)(a.a.mark((function t(n) {
                            return a.a.wrap((function (t) {
                                for (; ;) switch (t.prev = t.next) {
                                    case 0:
                                        return t.next = 2, s.a.post("delete-all-suspended-sells?value=".concat([e])).then((function () {
                                            n({
                                                type: o.o.DELETE_ALL_SUSPENDED_SALES,
                                                payload: []
                                            })
                                        })).catch((function (e) {
                                            var t = e.response;
                                            n({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: t.data.message,
                                                    type: o.q.ERROR,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return t.stop()
                                }
                            }), t)
                        })));
                        return function (e) {
                            return t.apply(this, arguments)
                        }
                    }()
                },
                u = function (e) {
                    return function () {
                        var t = Object(r.a)(a.a.mark((function t(n) {
                            return a.a.wrap((function (t) {
                                for (; ;) switch (t.prev = t.next) {
                                    case 0:
                                        return t.next = 2, s.a.get("edit-suspended-sell?transaction_id=".concat(e)).then((function (e) {
                                            n({
                                                type: o.o.EDIT_SUSPENDED_SALES,
                                                payload: e.data
                                            })
                                        })).catch((function (e) {
                                            var t = e.response;
                                            n({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: t.data.msg,
                                                    type: o.q.ERROR,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return t.stop()
                                }
                            }), t)
                        })));
                        return function (e) {
                            return t.apply(this, arguments)
                        }
                    }()
                }
        },
        40: function (e, t, n) {
            "use strict";
            n(14);
            t.a = function (e, t) {
                var n = new FormData,
                    c = e[0],
                    a = c.sub_type,
                    r = c.search_product,
                    s = c.pay_term_number,
                    o = c.pay_term_type,
                    i = c.price_group,
                    l = (c.line_discount_amount, c.lot_no_line_id),
                    d = c.discount_type,
                    u = c.discount_amount,
                    b = c.cart,
                    m = c.paymentCarts,
                    j = c.changeReturn,
                    p = c.finalTotal,
                    h = c.suspended,
                    x = c.customerId,
                    O = c.transactionId,
                    f = c.serviceManId,
                    _ = c.tableId;
                return n.append("location_id", t || 0), n.append("sub_type", a || ""), n.append("contact_id", x || "no_customer_select"), n.append("search_product", r || ""), n.append("pay_term_number", s || ""), n.append("pay_term_type", o || ""), n.append("price_group", i || 0), n.append("res_table_id", _ || ""), n.append("res_waiter_id", f || ""), n.append("transaction_date", ""), n.append("transactionId", O || null), b && b.map((function (e, t) {
                    n.append("products[".concat(t, "][product_type]"), "includes"), n.append("products[".concat(t, "][unit_price]"), e.product_row.product.unit_price ? e.product_row.product.unit_price : "0.00"), n.append("products[".concat(t, "][line_discount_type]"), e.product_row.discount ? e.product_row.discount.discount_type : "fixed"), n.append("products[".concat(t, "][line_discount_amount]"), e.product_row.discount ? e.product_row.discount.discount_amount : "0.00"), n.append("products[".concat(t, "][item_tax]"), "0.00"), n.append("products[".concat(t, "][tax_id]"), e.product_row.product.tax_id && "inclusive" === e.product_row.product.tax_type ? e.product_row.product.tax_id : "inclusive" === e.product_row.product.tax_type && e.product_row.tax_dropdown ? e.product_row.tax_dropdown.id : ""), n.append("products[".concat(t, "][sell_line_note]"), e.product_row.product.sell_line_note ? e.product_row.product.sell_line_note : ""), n.append("products[".concat(t, "][lot_no_line_id]"), l || ""), n.append("products[".concat(t, "][product_id]"), e.product_row.product.product_id), n.append("products[".concat(t, "][variation_id]"), e.product_row.product.variation_id), n.append("products[".concat(t, "][enable_stock]"), e.product_row.product.enable_stock), n.append("products[".concat(t, "][quantity]"), e.product_row.quantity), n.append("products[".concat(t, "][product_unit_id]"), e.product_row.product.unit_id), n.append("products[".concat(t, "][base_unit_multiplier]"), "1"), n.append("products[".concat(t, "][unit_price_inc_tax]"), e.product_row.product.unit_price ? e.product_row.product.unit_price : "0.00"), e.modifiers && e.modifiers.map((function (c) {
                        n.append("products[".concat(t, "][modifier][]"), c.id), n.append("products[".concat(t, "][modifier_price][]"), c.default_sell_price), n.append("products[".concat(t, "][modifier_quantity][]"), e.product_row.quantity), n.append("products[".concat(t, "][modifier_set_id][]"), c.product_variation_id)
                    }))
                })), n.append("discount_type", d || "percentage"), n.append("discount_amount", u || "0.00"), n.append("rp_redeemed", "0"), n.append("rp_redeemed_amount", "0"), n.append("tax_rate_id", "1"), n.append("tax_calculation_amount", "0.00"), n.append("advance_balance", "0.00"), m && m.map((function (e, t) {
                    n.append("payment[".concat(t, "][amount]"), e.amount), n.append("payment[".concat(t, "][method]"), e.payment_type), n.append("payment[".concat(t, "][account_id]"), ""), n.append("payment[".concat(t, "][card_number]"), ""), n.append("payment[".concat(t, "][card_holder_name]"), ""), n.append("payment[".concat(t, "][card_transaction_number]"), ""), n.append("payment[".concat(t, "][card_type]"), "credit"), n.append("payment[".concat(t, "][card_month]"), ""), n.append("payment[".concat(t, "][card_year]"), ""), n.append("payment[".concat(t, "][card_security]"), ""), n.append("payment[".concat(t, "][cheque_number]"), ""), n.append("payment[".concat(t, "][bank_account_number]"), ""), n.append("payment[".concat(t, "][transaction_no_1]"), ""), n.append("payment[".concat(t, "][transaction_no_2]"), ""), n.append("payment[".concat(t, "][transaction_no_3]"), ""), n.append("payment[".concat(t, "][note]"), "")
                })), n.append("sale_note", ""), n.append("staff_note", ""), n.append("change_return", j || "0"), n.append("additional_notes", ""), n.append("is_suspend", h || 0), n.append("recur_interval", ""), n.append("recur_interval_type", "days"), n.append("recur_repetitions", ""), n.append("subscription_repeat_on", ""), n.append("is_enabled_stock", ""), n.append("final_total", p || 0), n.append("discount_type_modal", "percentage"), n.append("discount_amount_modal", ""), n.append("order_tax_modal", ""), n.append("shipping_details_modal", ""), n.append("shipping_address_modal", ""), n.append("shipping_charges_modal", ""), n.append("shipping_status_modal", ""), n.append("delivered_to_modal", ""), n.append("status", "final"), n
            }
        },
        43: function (e, t, n) { },
        59: function (e, t, n) { },
        64: function (e, t, n) {
            "use strict";
            n.d(t, "a", (function () {
                return i
            })), n.d(t, "b", (function () {
                return l
            }));
            var c = n(5),
                a = n.n(c),
                r = n(7),
                s = n(8),
                o = n(2),
                i = function (e, t) {
                    return function () {
                        var n = Object(r.a)(a.a.mark((function n(c) {
                            return a.a.wrap((function (n) {
                                for (; ;) switch (n.prev = n.next) {
                                    case 0:
                                        return n.next = 2, s.a.post("finalize-payment", e).then((function (e) {
                                            c({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: e.data.msg,
                                                    display: !0
                                                }
                                            }), null !== e.data.receipt ? (c({
                                                type: o.i.PAYMENT_PRINT,
                                                payload: e.data.receipt.print
                                            }), "app" === e.data.receipt.print.receipt_printer_type ? t({
                                                status: !0,
                                                receipt: !1,
                                                data: e.data.receipt
                                            }) : t({
                                                status: !0,
                                                receipt: !0,
                                                data: e.data.receipt.print
                                            })) : t({
                                                status: !1,
                                                receipt: !1
                                            })
                                        })).catch((function (e) {
                                            var t = e.response;
                                            c({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: t.data.msg,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return n.stop()
                                }
                            }), n)
                        })));
                        return function (e) {
                            return n.apply(this, arguments)
                        }
                    }()
                },
                l = function (e, t, n) {
                    return function () {
                        var c = Object(r.a)(a.a.mark((function c(r) {
                            return a.a.wrap((function (c) {
                                for (; ;) switch (c.prev = c.next) {
                                    case 0:
                                        return c.next = 2, s.a.post("update-finalize-payment?transaction_id=".concat(t), e).then((function (e) {
                                            r({
                                                type: o.i.PAYMENT_PRINT,
                                                payload: e.data.receipt.print
                                            }), null !== e.data.receipt ? (r({
                                                type: o.i.PAYMENT_PRINT,
                                                payload: e.data.receipt.print
                                            }), n({
                                                status: !0,
                                                receipt: !0,
                                                data: e.data.receipt.print
                                            })) : n({
                                                status: !1,
                                                receipt: !1
                                            })
                                        })).catch((function (e) {
                                            var t = e.response;
                                            r({
                                                type: o.d.ADD_TOAST,
                                                payload: {
                                                    text: t.data.msg,
                                                    display: !0
                                                }
                                            })
                                        }));
                                    case 2:
                                    case "end":
                                        return c.stop()
                                }
                            }), c)
                        })));
                        return function (e) {
                            return c.apply(this, arguments)
                        }
                    }()
                }
        },
        8: function (e, t, n) {
            "use strict";
            var c = n(82),
                a = n.n(c),
                r = {
                    URL: window.location.protocol + "//" + window.location.hostname + ":8000"
                }.URL;
            t.a = a.a.create({
                withCredentials: !0,
                baseURL: r
            })
        },
        86: function (e, t, n) {
            "use strict";
            (function (e) {
                var c = n(28),
                    a = n(3),
                    r = n(24),
                    s = n(26),
                    o = n(39),
                    i = n(37),
                    l = n(1),
                    d = n.n(l),
                    u = (n(43), n(59), n(14)),
                    b = n(9),
                    m = n(12),
                    j = n(87),
                    p = n(88),
                    h = n(64),
                    x = n(19),
                    O = n.n(x),
                    f = n(35),
                    _ = n(40),
                    y = n(89),
                    g = n(0),
                    v = "cash",
                    N = "card",
                    w = function (e) {
                        Object(o.a)(n, e);
                        var t = Object(i.a)(n);

                        function n() {
                            return Object(r.a)(this, n), t.apply(this, arguments)
                        }
                        return Object(s.a)(n, [{
                            key: "render",
                            value: function () {
                                var e = this.props.paymentPrint,
                                    t = this.props.user,
                                    n = [];
                                if (!e || 0 === e.length) return Object(g.jsx)("div", {});
                                var c = function (e) {
                                    var t = 0;
                                    return e && e.appliedTax.forEach((function (e) {
                                        t += e.tax_amount
                                    })), +t.toFixed(4)
                                }(e),
                                    a = c + e.modifier_tax,
                                    r = (e.final_total, parseFloat(a).toFixed(2), 0),
                                    s = function (e) {
                                        var t = [];
                                        return e.forEach((function (e) {
                                            0 === +e.sell_price_inc_tax && t.push(e.variation)
                                        })), 0 === t.length ? "" : Object(g.jsxs)("tr", {
                                            children: [Object(g.jsx)("td", {}), Object(g.jsx)("td", {
                                                style: {
                                                    fontSize: "14px"
                                                },
                                                children: t.join(",")
                                            }), Object(g.jsx)("td", {
                                                style: {
                                                    textAlign: "end",
                                                    padding: "0"
                                                }
                                            }), Object(g.jsx)("td", {
                                                style: {
                                                    textAlign: "end",
                                                    padding: "0"
                                                }
                                            }), Object(g.jsx)("td", {
                                                style: {
                                                    textAlign: "end",
                                                    padding: "0"
                                                }
                                            })]
                                        })
                                    };
                                return Object(g.jsx)("div", {
                                    style: {
                                        fontFamily: "'Playfair Display', serif"
                                    },
                                    children: Object(g.jsxs)("div", {
                                        style: {
                                            width: "100%",
                                            padding: "25px"
                                        },
                                        children: [Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsx)("tbody", {
                                                children: Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("th", {
                                                        style: {
                                                            fontWeight: "unset",
                                                            width: "50%",
                                                            fontSize: "15px"
                                                        },
                                                        children: O()(new Date).format("DD/MM/YYYY")
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            fontWeight: "unset",
                                                            width: "50%",
                                                            fontSize: "13px"
                                                        },
                                                        children: "POS- \u0627\u0644\u0643 \u0634\u0627\u0648\u0631\u0645\u0627"
                                                    })]
                                                })
                                            })
                                        }), Object(g.jsx)("br", {}), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsx)("div", {
                                                style: {
                                                    fontWeight: "unset"
                                                },
                                                dangerouslySetInnerHTML: {
                                                    __html: e.header_text
                                                }
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsx)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: Object(g.jsx)("tr", {
                                                    style: {
                                                        width: "100%"
                                                    },
                                                    children: Object(g.jsxs)("td", {
                                                        style: {
                                                            textAlign: "start",
                                                            width: "100%"
                                                        },
                                                        children: [Object(g.jsxs)("p", {
                                                            style: {
                                                                margin: "0"
                                                            },
                                                            children: [Object(g.jsx)("b", {
                                                                style: {
                                                                    fontSize: "18px",
                                                                    textTransform: "uppercase"
                                                                },
                                                                children: e.location_name
                                                            }), Object(g.jsx)("br", {}), e.address, Object(g.jsx)("br", {}), Object(g.jsx)("br", {}), Object(g.jsx)("b", {
                                                                style: {
                                                                    fontSize: "15px"
                                                                },
                                                                children: e.invoice_heading
                                                            })]
                                                        }), Object(g.jsx)("hr", {
                                                            style: {
                                                                border: "1px solid #000000",
                                                                marginBottom: "0",
                                                                marginTop: "15px"
                                                            }
                                                        })]
                                                    })
                                                })
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%",
                                                marginBottom: "5px"
                                            },
                                            children: Object(g.jsx)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "start",
                                                            fontWeight: "unset",
                                                            width: "100%",
                                                            padding: "0",
                                                            fontSize: "15px"
                                                        },
                                                        children: Object(g.jsx)("b", {
                                                            children: e.invoice_no_prefix
                                                        })
                                                    }), Object(g.jsx)("th", {}), Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "end",
                                                            fontWeight: "unset",
                                                            padding: "0",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.invoice_no
                                                    })]
                                                })
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%",
                                                marginBottom: "10px"
                                            },
                                            children: Object(g.jsx)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "start",
                                                            fontWeight: "unset",
                                                            padding: "0",
                                                            fontSize: "15px"
                                                        },
                                                        children: Object(g.jsx)("b", {
                                                            children: e.date_label
                                                        })
                                                    }), Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "end",
                                                            fontWeight: "unset",
                                                            padding: "0",
                                                            whiteSpace: "nowrap",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.invoice_date
                                                    })]
                                                })
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%",
                                                marginBottom: "5px"
                                            },
                                            children: Object(g.jsxs)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: [Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("th", {
                                                        style: {
                                                            borderBottom: " 2.5px dashed #b3b2b2",
                                                            paddingLeft: "5px"
                                                        },
                                                        children: "#"
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            width: "45%",
                                                            padding: "5px",
                                                            borderBottom: "2.5px dashed #b3b2b2",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.table_product_label
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "right",
                                                            padding: "0",
                                                            borderBottom: "2.5px dashed #b3b2b2",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.table_qty_label
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "right",
                                                            padding: "0",
                                                            borderBottom: "2.5px dashed #b3b2b2",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.table_unit_price_label
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "right",
                                                            padding: "0",
                                                            borderBottom: "2.5px dashed #b3b2b2",
                                                            fontSize: "15px"
                                                        },
                                                        children: e.table_subtotal_label
                                                    })]
                                                }), e && e.lines.map((function (e, t) {
                                                    var c = +Object(u.f)(e.unit_price, 4) + e.single_product_tax,
                                                        a = +c.toFixed(2) * e.quantity;
                                                    return Object(g.jsxs)(g.Fragment, {
                                                        children: [Object(g.jsxs)("tr", {
                                                            children: [Object(g.jsx)("td", {
                                                                children: t + 1
                                                            }), Object(g.jsx)("td", {
                                                                children: e.name
                                                            }), Object(g.jsxs)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0"
                                                                },
                                                                children: [e.quantity, " ", e.units]
                                                            }), Object(g.jsx)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0"
                                                                },
                                                                children: c.toFixed(2)
                                                            }), Object(g.jsx)("td", {
                                                                style: {
                                                                    textAlign: "end",
                                                                    padding: "0"
                                                                },
                                                                children: a.toFixed(2)
                                                            })]
                                                        }, t), e.modifiers && 0 !== e.modifiers.length ? e.modifiers.map((function (t, c) {
                                                            0 === +t.sell_price_inc_tax && n.push(t.variation);
                                                            var a = Object(u.f)(t.unit_price_inc_tax, 4),
                                                                s = 0;
                                                            t.tax_id && t.tax_id > 0 && (s = a * t.tax_amount / 100, r += s.toFixed(2) * e.quantity);
                                                            var o = (+a + s).toFixed(2);
                                                            if (+t.sell_price_inc_tax > 0) return Object(g.jsxs)("tr", {
                                                                children: [Object(g.jsx)("td", {}), Object(g.jsx)("td", {
                                                                    style: {
                                                                        fontSize: "14px"
                                                                    },
                                                                    children: t.variation
                                                                }), Object(g.jsxs)("td", {
                                                                    style: {
                                                                        textAlign: "end",
                                                                        padding: "0",
                                                                        fontSize: "14px"
                                                                    },
                                                                    children: [t.quantity, " ", t.units]
                                                                }), Object(g.jsx)("td", {
                                                                    style: {
                                                                        textAlign: "end",
                                                                        padding: "0",
                                                                        fontSize: "14px"
                                                                    },
                                                                    children: o
                                                                }), Object(g.jsx)("td", {
                                                                    style: {
                                                                        textAlign: "end",
                                                                        padding: "0",
                                                                        fontSize: "14px"
                                                                    },
                                                                    children: (o * t.quantity).toFixed(2)
                                                                })]
                                                            }, c)
                                                        })) : null, e.modifiers && 0 !== e.modifiers.length && s(e.modifiers)]
                                                    })
                                                }))]
                                            })
                                        }), Object(g.jsx)("hr", {
                                            style: {
                                                border: "1px solid black",
                                                marginTop: "15px"
                                            }
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsxs)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: [Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%",
                                                            fontSize: "15px",
                                                            padding: "0"
                                                        },
                                                        children: e.subtotal_label
                                                    }), Object(g.jsx)("th", {
                                                        style: {
                                                            textAlign: "end",
                                                            fontSize: "15px",
                                                            padding: "0"
                                                        },
                                                        children: (e.final_total - (r + c)).toFixed(2) + "\ufdfc "
                                                    })]
                                                }), Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%",
                                                            fontSize: "15px"
                                                        },
                                                        children: "Tax"
                                                    }), Object(g.jsxs)("td", {
                                                        style: {
                                                            textAlign: "end"
                                                        },
                                                        children: ["(+) \ufdfc ", (r + c).toFixed(2)]
                                                    })]
                                                }), Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%"
                                                        },
                                                        children: Object(g.jsx)("b", {
                                                            style: {
                                                                fontSize: "15px"
                                                            },
                                                            children: e.total_label
                                                        })
                                                    }), Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "end"
                                                        },
                                                        children: Object(g.jsx)("b", {
                                                            children: e.total
                                                        })
                                                    })]
                                                }), e.payments && 0 !== e.payments.length ? e.payments.map((function (e, t) {
                                                    return Object(g.jsxs)("tr", {
                                                        children: [Object(g.jsxs)("td", {
                                                            style: {
                                                                textAlign: "right",
                                                                width: "65%",
                                                                fontSize: "13px"
                                                            },
                                                            children: [e.method, "(", e.date, ")"]
                                                        }), Object(g.jsx)("td", {
                                                            style: {
                                                                textAlign: "end",
                                                                fontSize: "13px"
                                                            },
                                                            children: e.amount
                                                        })]
                                                    }, t)
                                                })) : null, Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%",
                                                            fontSize: "13px"
                                                        },
                                                        children: e.total_paid_label
                                                    }), Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "end",
                                                            fontSize: "13px"
                                                        },
                                                        children: e.total_paid
                                                    })]
                                                }), Object(g.jsxs)("tr", {
                                                    children: [Object(g.jsx)("td", {
                                                        style: {
                                                            textAlign: "right",
                                                            width: "65%",
                                                            fontSize: "13px"
                                                        },
                                                        children: e.total_due_label
                                                    }), Object(g.jsxs)("td", {
                                                        style: {
                                                            textAlign: "end",
                                                            fontSize: "13px"
                                                        },
                                                        children: [e.total_due, " "]
                                                    })]
                                                })]
                                            })
                                        }), Object(g.jsx)("table", {
                                            clas: "",
                                            style: {
                                                width: "100%",
                                                "text-align": "center"
                                            },
                                            children: Object(g.jsxs)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: ["  ", C(e, r, c, t), " "]
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsx)("div", {
                                                style: {
                                                    fontWeight: "unset"
                                                },
                                                dangerouslySetInnerHTML: {
                                                    __html: e.footer_text
                                                }
                                            })
                                        }), Object(g.jsx)("table", {
                                            style: {
                                                width: "100%"
                                            },
                                            children: Object(g.jsx)("tbody", {
                                                style: {
                                                    width: "100%"
                                                },
                                                children: Object(g.jsx)("tr", {
                                                    children: Object(g.jsx)("td", {
                                                        children: Object(g.jsx)("p", {
                                                            style: {
                                                                textAlign: "center",
                                                                margin: "0"
                                                            },
                                                            children: e.additional_notes
                                                        })
                                                    })
                                                })
                                            })
                                        })]
                                    })
                                })
                            }
                        }]), n
                    }(d.a.PureComponent),
                    S = function (t, n) {
                        var c = [e.from([t], "UTF-8"), e.from([n.length], "UTF-8"), e.from(n, "UTF-8")];
                        return e.concat(c)
                    },
                    C = function (t, c, a, r) {
                        var s = r.tax_number_1,
                            o = r.business_name,
                            i = (n(169).encode("\u0634\u0627\u0648\u0631\u0645\u0627 \u0627\u0644\u0643"), t.total.replace("\ufdfc", "")),
                            l = O.a.utc(new Date).format(),
                            d = (c + a).toFixed(2),
                            u = [S("1", o), S("2", s), S("3", l), S("4", i), S("5", d)],
                            b = e.concat(u),
                            m = b.toString("base64"),
                            j = b.toString("hex");
                        return Object(g.jsxs)("tr", {
                            children: [Object(g.jsx)("td", {
                                children: Object(g.jsx)("div", {
                                    style: {
                                        fontWeight: "unset"
                                    },
                                    children: Object(g.jsx)(y.a, {
                                        value: "".concat(m)
                                    })
                                })
                            }), Object(g.jsx)("td", {
                                children: Object(g.jsxs)("div", {
                                    class: "d-none",
                                    style: {
                                        "word-break": "break-word"
                                    },
                                    children: [Object(g.jsx)("p", {
                                        children: r.first_name
                                    }), Object(g.jsxs)("p", {
                                        children: [m, " "]
                                    }), Object(g.jsx)("p", {
                                        children: j
                                    }), Object(g.jsx)("p", {
                                        children: o
                                    }), Object(g.jsxs)("p", {
                                        children: [" ", s]
                                    }), Object(g.jsx)("p", {
                                        children: l
                                    }), Object(g.jsx)("p", {
                                        children: i
                                    }), Object(g.jsx)("p", {
                                        children: d
                                    })]
                                })
                            })]
                        })
                    },
                    E = function (e) {
                        var t = "print://escpos.org/escpos/net/print?srcTp=uri&srcObj=html&src='";
                        t += encodeURIComponent('"'.concat(e.print_url, '"')), t += "'", window.location.href = t
                    };
                t.a = Object(m.b)(null, {
                    notify: j.a,
                    finalizePayment: h.a,
                    updateFinalizePayment: h.b
                })((function (e) {
                    var t = e.carts,
                        n = e.notify,
                        r = e.finalizePayment,
                        s = e.updateCart,
                        o = e.customer,
                        i = e.transactionId,
                        d = e.updateFinalizePayment,
                        m = e.selectedLocationId,
                        j = e.serviceManId,
                        h = e.tableId,
                        x = e.user,
                        O = Object(l.useState)(!1),
                        y = Object(a.a)(O, 2),
                        S = y[0],
                        C = y[1],
                        T = Object(l.useState)(0),
                        k = Object(a.a)(T, 2),
                        A = k[0],
                        D = k[1],
                        R = Object(l.useState)(0),
                        F = Object(a.a)(R, 2),
                        P = F[0],
                        L = F[1],
                        I = Object(l.useState)(0),
                        M = Object(a.a)(I, 2),
                        U = M[0],
                        H = M[1],
                        q = Object(l.useState)(!1),
                        Y = Object(a.a)(q, 2),
                        z = Y[0],
                        B = Y[1],
                        K = Object(l.useState)(!1),
                        G = Object(a.a)(K, 2),
                        W = G[0],
                        X = G[1],
                        V = Object(l.useState)([]),
                        J = Object(a.a)(V, 2),
                        Q = J[0],
                        $ = J[1],
                        Z = Object(l.useState)([{
                            amount: +A,
                            payment_type: v
                        }]),
                        ee = Object(a.a)(Z, 2),
                        te = ee[0],
                        ne = ee[1],
                        ce = Object(l.useState)(""),
                        ae = Object(a.a)(ce, 2),
                        re = ae[0],
                        se = ae[1],
                        oe = Object(l.useRef)();
                    Object(b.b)("keydown", (function (e) {
                        var t = e.key;
                        b.a.includes(String(t)) && (ie(), X(!1))
                    })), Object(l.useEffect)((function () {
                        var e = Object(u.c)(t);
                        D(+e), pe(e, 0), ne([{
                            amount: +e,
                            payment_type: v
                        }])
                    }), [t, S, s]), Object(l.useEffect)((function () {
                        document.body.style.overflow = S ? "hidden" : "unset"
                    }), [S]);
                    var ie = function () {
                        C(!1), se("")
                    },
                        le = function () {
                            document.getElementById("printReceipt").click()
                        },
                        de = Object(f.useReactToPrint)({
                            content: function () {
                                return oe.current
                            }
                        }),
                        ue = function () {
                            A > 0 ? C(!0) : n("Please add at least one product into cart.")
                        },
                        be = function (e, t) {
                            var n = te.slice();
                            n[t].payment_type = e, ne(n)
                        },
                        me = function (e) {
                            var t = te.slice();
                            t.splice(e, 1), ne(t)
                        },
                        je = function (e, t) {
                            H(e.target.selectionStart), L(t)
                        },
                        pe = function (e, t) {
                            if ("" === e || /^[0-9.\b]+$/.test(e) && 0 !== te.length) {
                                var n = te.slice();
                                n[t].amount = e, ne(n)
                            }
                        },
                        he = function (e) {
                            var t = te.slice(),
                                n = t[P].amount.toString();
                            if (n.includes(".") && "." === e);
                            else {
                                var c = 0;
                                if (U > 0) c = n.substring(0, U) + e + n.substring(U);
                                else c = n + e;
                                t[P].amount = c, ne(t), B(!0)
                            }
                        },
                        xe = function () {
                            var e = te.slice(),
                                t = e[P].amount.toString(),
                                n = 0;
                            if (U > 0) {
                                var c = t.substring(0, U),
                                    a = t.substring(U);
                                c.length > 0 && (c = c.slice(0, -1)), n = c + a
                            } else n = t.slice(0, -1);
                            e[P].amount = +n, ne(e), B(!0)
                        },
                        Oe = function (e) {
                            B(!0);
                            var t = te.slice();
                            t[P].amount = +t[P].amount + +e, ne(t)
                        },
                        fe = function () {
                            var e = 0;
                            return te.forEach((function (t) {
                                e += +t.amount
                            })), +e.toFixed(2)
                        },
                        _e = function () {
                            var e = fe();
                            return A > e ? "0.00" : +(e - A).toFixed(2)
                        },
                        ye = function () {
                            var e = fe();
                            return A < e ? "0.00" : +(A - e).toFixed(2)
                        },
                        ge = function (e, t) {
                            var n = e.amount ? +e.amount : "";
                            return Object(g.jsxs)("div", {
                                className: "".concat(0 === t ? "" : "custom-card-space", " pos-modal payment-modal__payment-method bg-secondary p-3"),
                                children: [te.length > 1 ? Object(g.jsx)("div", {
                                    className: "callout text-end",
                                    children: Object(g.jsx)("button", {
                                        type: "button",
                                        className: "cross-btn",
                                        onClick: function () {
                                            return me(t)
                                        },
                                        children: "X"
                                    })
                                }) : "", Object(g.jsx)("h6", {
                                    className: "modal-subtitle mb-2",
                                    id: "paymentModalLabel",
                                    children: "Payment Method:"
                                }), Object(g.jsxs)("div", {
                                    className: "modal-btn-grp",
                                    children: [Object(g.jsx)("button", {
                                        type: "button",
                                        onClick: function () {
                                            return be(v, t)
                                        },
                                        className: "btn modal-btn ".concat(e.payment_type === v ? "btn-primary me-2" : "btn-secondary me-2"),
                                        children: "Cash"
                                    }), Object(g.jsx)("button", {
                                        type: "button",
                                        onClick: function () {
                                            return be(N, t)
                                        },
                                        className: "btn modal-btn ".concat(e.payment_type === N ? "btn-primary me-2" : "btn-secondary me-2"),
                                        children: "Card"
                                    })]
                                }), Object(g.jsxs)("div", {
                                    className: "row mt-4 align-items-center",
                                    children: [Object(g.jsx)("label", {
                                        htmlFor: "amount",
                                        className: "col-sm-2 col-4 modal-subtitle col-form-label",
                                        children: "Amount:"
                                    }), Object(g.jsxs)("div", {
                                        className: "col-sm-10 col-8 field-w-100",
                                        children: [Object(g.jsx)("input", {
                                            name: "amount",
                                            type: "number",
                                            readOnly: !0,
                                            className: "form-control amount-input read-only-background",
                                            onKeyDown: function (e) {
                                                return je(e, t)
                                            },
                                            onClick: function (e) {
                                                return je(e, t)
                                            },
                                            onFocus: function (e) {
                                                return je(e, t)
                                            },
                                            onChange: function (e) {
                                                return function (e, t) {
                                                    B(!0), pe(e, t)
                                                }(e.target.value, t)
                                            },
                                            value: +n
                                        }), Object(g.jsx)("span", {
                                            className: "required d-flex justify-content-start text-danger",
                                            children: re || null
                                        })]
                                    })]
                                })]
                            }, t)
                        },
                        ve = function () {
                            return Object(g.jsx)("button", {
                                type: "button",
                                className: "btn text-primary w-100 h-100 coustom-hover",
                                "data-bs-toggle": "modal",
                                "data-bs-target": "#paymentModal",
                                onClick: ue,
                                children: "Payment"
                            })
                        };
                    if (!S) return ve();
                    return Object(g.jsxs)("div", {
                        className: "w-100 h-100",
                        children: [ve(), Object(g.jsxs)("div", {
                            className: "payment-modal pos-modal",
                            children: [Object(g.jsx)("div", {
                                className: "modal-dialog modal-dialog-centered hide-show-dialog",
                                children: Object(g.jsxs)("div", {
                                    className: "modal-content border-0 px-2 px-sm-4 py-2",
                                    children: [Object(g.jsx)("button", {
                                        type: "button",
                                        className: "btn-close",
                                        "data-bs-dismiss": "modal",
                                        "aria-label": "Close",
                                        onClick: ie,
                                        onKeyPress: ie,
                                        children: "X"
                                    }), Object(g.jsx)("div", {
                                        className: "modal-body",
                                        children: Object(g.jsxs)("div", {
                                            className: "row",
                                            children: [Object(g.jsxs)("div", {
                                                className: "col-lg-7 col-12 border-4 border-end border-right-0",
                                                children: [Object(g.jsxs)("div", {
                                                    className: "pe-lg-2 me-lg-1 mt-4 mt-sm-5 mt-lg-0",
                                                    children: [Object(g.jsx)("h5", {
                                                        className: "modal-title payment-modal__top-title border-bottom border-4 mb-3 text-start",
                                                        id: "paymentModalLabel",
                                                        children: "Payment"
                                                    }), Object(g.jsx)("div", {
                                                        className: "custom-scrollbar",
                                                        children: te.map((function (e, t) {
                                                            return ge(e, t)
                                                        }))
                                                    })]
                                                }), Object(g.jsx)("button", {
                                                    type: "button",
                                                    className: "btn btn-primary modal-btn w-100 mt-3",
                                                    onClick: function () {
                                                        ne([].concat(Object(c.a)(te), [{
                                                            amount: 0,
                                                            payment_type: v
                                                        }]))
                                                    },
                                                    children: "Add Payment Now"
                                                })]
                                            }), Object(g.jsxs)("div", {
                                                className: "col-lg-5 col-12",
                                                children: [Object(g.jsxs)("div", {
                                                    children: [Object(g.jsxs)("div", {
                                                        className: "payment-modal__widgets ps-lg-2 mt-2 pt-1 d-flex flex-wrap",
                                                        children: [Object(g.jsx)("div", {
                                                            className: "w-100",
                                                            children: Object(g.jsx)("div", {
                                                                className: "payment-modal__widgets-block bg-secondary text-center d-flex flex-wrap align-items-center justify-content-center",
                                                                children: Object(g.jsxs)("div", {
                                                                    children: [Object(g.jsx)("span", {
                                                                        className: "payment-modal__items d-block mb-1",
                                                                        children: "Total Items"
                                                                    }), Object(g.jsx)("strong", {
                                                                        className: "payment-modal__total-items d-block",
                                                                        children: t.length
                                                                    })]
                                                                })
                                                            })
                                                        }), Object(g.jsx)("div", {
                                                            className: "".concat(z && A === fe() ? "bg-div-green" : "bg-secondary", " payment-modal__widgets-block text-center d-flex flex-wrap align-items-center justify-content-center"),
                                                            children: Object(g.jsxs)("div", {
                                                                children: [Object(g.jsxs)("span", {
                                                                    className: "payment-modal__items d-block mb-1",
                                                                    children: ["Total Payable ", x.first_name]
                                                                }), Object(g.jsxs)("strong", {
                                                                    className: "payment-modal__total-items d-block",
                                                                    children: [" \ufdfc ", A, " "]
                                                                }), Object(g.jsx)("input", {
                                                                    type: "hidden",
                                                                    id: "finalTotalWithoutCurrency",
                                                                    value: "".concat(A)
                                                                })]
                                                            })
                                                        }), Object(g.jsx)("div", {
                                                            className: "payment-modal__widgets-block bg-secondary text-center d-flex flex-wrap align-items-center justify-content-center",
                                                            children: Object(g.jsxs)("div", {
                                                                children: [Object(g.jsx)("span", {
                                                                    className: "payment-modal__items d-block mb-1",
                                                                    children: "Total Paying"
                                                                }), Object(g.jsxs)("strong", {
                                                                    className: "payment-modal__total-items d-block",
                                                                    children: ["\ufdfc", fe()]
                                                                })]
                                                            })
                                                        }), Object(g.jsx)("div", {
                                                            className: "".concat(z && _e() > 0 ? "bg-orange" : "bg-secondary", " payment-modal__widgets-block text-center d-flex flex-wrap align-items-center justify-content-center"),
                                                            children: Object(g.jsxs)("div", {
                                                                children: [Object(g.jsx)("span", {
                                                                    className: "payment-modal__items d-block mb-1",
                                                                    children: "Change Return"
                                                                }), Object(g.jsxs)("strong", {
                                                                    className: "payment-modal__total-items d-block",
                                                                    children: ["\ufdfc", _e()]
                                                                })]
                                                            })
                                                        }), Object(g.jsx)("div", {
                                                            className: "".concat(z && ye() > 0 ? "bg-danger" : "bg-secondary", " payment-modal__widgets-block bg-secondary text-center d-flex flex-wrap align-items-center justify-content-center"),
                                                            children: Object(g.jsxs)("div", {
                                                                children: [Object(g.jsx)("span", {
                                                                    className: "payment-modal__items d-block mb-1",
                                                                    children: "Balance"
                                                                }), Object(g.jsxs)("strong", {
                                                                    className: "payment-modal__total-items d-block",
                                                                    children: ["\ufdfc", ye()]
                                                                })]
                                                            })
                                                        })]
                                                    }), Object(g.jsx)("div", {
                                                        className: "calculator payment-modal__payment-calculator ms-lg-3 my-4",
                                                        children: Object(g.jsx)("div", {
                                                            className: "row gx-0",
                                                            children: Object(g.jsx)("div", {
                                                                className: "col-12",
                                                                children: Object(g.jsx)(p.a, {
                                                                    updateAmount: he,
                                                                    addAmount: Oe,
                                                                    clearAmount: xe
                                                                })
                                                            })
                                                        })
                                                    }), Object(g.jsx)("div", {
                                                        className: "text-end",
                                                        children: Object(g.jsx)("button", {
                                                            type: "button",
                                                            onClick: function () {
                                                                return function () {
                                                                    var e = [];
                                                                    e.push({
                                                                        cart: t,
                                                                        paymentCarts: te,
                                                                        changeReturn: _e(),
                                                                        balance: ye(),
                                                                        finalTotal: A,
                                                                        finalTotalWithoutCurrency: A,
                                                                        suspended: 0,
                                                                        customerId: o ? o.id : "no_customer_select",
                                                                        transactionId: i || null,
                                                                        serviceManId: j,
                                                                        tableId: h
                                                                    }), i ? d(Object(_.a)(e, m), i, (function (e) {
                                                                        e.status && ($(e.data), e.receipt ? (X(!0), le(), C(!1), s([])) : (E(e.data), C(!1)))
                                                                    })) : r(Object(_.a)(e, m), (function (e) {
                                                                        e.status && ($(e.data), s([]), e.receipt ? (X(!0), le(), C(!1), s([])) : (E(e.data), C(!1)))
                                                                    })), me()
                                                                }()
                                                            },
                                                            disabled: 0 === fe(),
                                                            className: "btn btn-primary modal-btn/ mt-3 mx-lg-3 modal-footer-btn payment-modal__finalize-btn",
                                                            children: "Finalize"
                                                        })
                                                    })]
                                                }), Object(g.jsx)("div", {
                                                    children: Object(g.jsxs)("div", {
                                                        className: "d-none",
                                                        children: [W ? Object(g.jsx)(w, {
                                                            ref: oe,
                                                            paymentPrint: Q,
                                                            user: x
                                                        }) : "", Object(g.jsx)("button", {
                                                            id: "printReceipt",
                                                            onClick: de,
                                                            children: "Print this out!"
                                                        })]
                                                    })
                                                })]
                                            })]
                                        })
                                    })]
                                })
                            }), Object(g.jsx)("div", {
                                className: "bg-overlay",
                                onClick: ie,
                                role: "button",
                                tabIndex: "0",
                                "aria-label": "background overlay",
                                onKeyDown: ie
                            })]
                        })]
                    })
                }))
            }).call(this, n(70).Buffer)
        },
        87: function (e, t, n) {
            "use strict";
            n.d(t, "a", (function () {
                return o
            }));
            var c = n(5),
                a = n.n(c),
                r = n(7),
                s = n(2),
                o = function (e) {
                    return function () {
                        var t = Object(r.a)(a.a.mark((function t(n) {
                            return a.a.wrap((function (t) {
                                for (; ;) switch (t.prev = t.next) {
                                    case 0:
                                        n({
                                            type: s.d.ADD_TOAST,
                                            payload: {
                                                text: e,
                                                display: !0
                                            }
                                        });
                                    case 1:
                                    case "end":
                                        return t.stop()
                                }
                            }), t)
                        })));
                        return function (e) {
                            return t.apply(this, arguments)
                        }
                    }()
                }
        },
        88: function (e, t, n) {
            "use strict";
            n(1);
            var c = n(0);
            t.a = function (e) {
                var t = e.updateAmount,
                    n = e.addAmount,
                    a = e.clearAmount;
                return Object(c.jsxs)("div", {
                    className: "row row-cols-4 gx-0",
                    children: [Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(1)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-bottom-0",
                        children: "1"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(2)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "2"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(3)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "3"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return n(10)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "+10"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(4)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-bottom-0",
                        children: "4"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(5)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "5"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(6)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "6"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return n(50)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "+50"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(7)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-bottom-0",
                        children: "7"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(8)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "8"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(9)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "9"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return n(100)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0 border-bottom-0",
                        children: "+100"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(".")
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0",
                        children: "."
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return t(0)
                        },
                        className: "btn text-primary numeric-btn border border-primary rounded-0 border-start-0",
                        children: "0"
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return a()
                        },
                        className: "btn numeric-btn text-white border border-primary rounded-0 border-start-0",
                        children: Object(c.jsx)("i", {
                            className: "fa fa-times calculator__close-box big-close",
                            "aria-hidden": "true"
                        })
                    }), Object(c.jsx)("button", {
                        type: "button",
                        onClick: function () {
                            return n(500)
                        },
                        className: "btn numeric-btn text-primary border border-primary rounded-0 border-start-0",
                        children: "+500"
                    })]
                })
            }
        },
        9: function (e, t, n) {
            "use strict";
            n.d(t, "a", (function () {
                return a
            })), n.d(t, "b", (function () {
                return r
            }));
            var c = n(1),
                a = ["27", "Escape"];

            function r(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window,
                    a = Object(c.useRef)();
                Object(c.useEffect)((function () {
                    a.current = t
                }), [t]), Object(c.useEffect)((function () {
                    if (n && n.addEventListener) {
                        var t = function (e) {
                            return a.current(e)
                        };
                        return n.addEventListener(e, t),
                            function () {
                                n.removeEventListener(e, t)
                            }
                    }
                }), [e, n])
            }
        }
    },
    [
        [188, 1, 2]
    ]
]);