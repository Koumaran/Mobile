var Point = (function () {
    function Point() {
    }
    Point.prototype.draw = function () {
        console.log('X: ' + this.x + ', Y: ' + this.y);
    };
    Point.prototype.getDistance = function (another) {
        //..
    };
    return Point;
}());
var point = new Point();
point.x = 100;
point.y = 150;
point.draw();
