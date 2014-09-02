(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.FollowMouse = (function() {
    function FollowMouse(el) {
      var f, _i, _len, _ref;
      this.el = el;
      this._mouseMove = __bind(this._mouseMove, this);
      if (typeof this.el === "string") {
        _ref = document.querySelectorAll(this.el);
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          el = _ref[_i];
          f = new FollowMouse(el);
        }
        return false;
      }
      if (typeof this.el === "object") {
        this.parentNode = this.el.parentNode;
        this.parentNode.style.position = "relative";
        this.parentMiddle = {
          x: (this.parentNode.offsetWidth / 2) + (this.elementOffset(this.parentNode, "offsetLeft")),
          y: (this.parentNode.offsetHeight / 2) + (this.elementOffset(this.parentNode, "offsetTop"))
        };
        this._positionInMiddle();
        this._eventListeners();
      }
    }

    FollowMouse.prototype._positionInMiddle = function() {
      return this.addCss(this.el, {
        position: "absolute",
        top: "50%",
        marginTop: "-" + (this.el.offsetHeight / 2) + "px",
        left: "50%",
        marginLeft: "-" + (this.el.offsetWidth / 2) + "px"
      });
    };

    FollowMouse.prototype._eventListeners = function() {
      return document.addEventListener("mousemove", this._mouseMove);
    };

    FollowMouse.prototype._mouseMove = function(e) {
      var css, newX, newY, x, y;
      x = e.clientX;
      y = e.clientY;
      newX = 0 - (this.parentMiddle.x - x) / (this.el.offsetWidth / 2);
      newY = 0 - (this.parentMiddle.y - y) / (this.el.offsetHeight / 2);
      css = {
        WebkitTransform: "translate3d(" + newX + "px, " + newY + "px, 0px)",
        MozTransform: "translate3d(" + newX + "px, " + newY + "px, 0px)",
        OTransform: "translate3d(" + newX + "px, " + newY + "px, 0px)",
        msTransform: "translate(" + newX + "px, " + newY + "px)",
        transform: "translate3d(" + newX + "px, " + newY + "px, 0px)"
      };
      return this.addCss(this.el, css);
    };

    FollowMouse.prototype.elementOffset = function(e, type) {
      var offset;
      offset = 0;
      while (e) {
        offset += e[type];
        e = e.offsetParent;
      }
      return offset;
    };

    FollowMouse.prototype.addCss = function(el, css) {
      var key, val, _results;
      _results = [];
      for (key in css) {
        val = css[key];
        _results.push(this.el.style[key] = val);
      }
      return _results;
    };

    return FollowMouse;

  })();

}).call(this);
