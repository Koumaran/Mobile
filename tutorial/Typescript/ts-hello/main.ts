class Point {
    x: number;
    y: number;

    //constructeur qui permet d'initialisé la class
    constructor(_x?: number, y?: number) { // les "?" permet de rendre le paramètre optionnelle, non obligatoire
        this.x = _x;
        this.y = y;
    }

    draw() {
        console.log('X: ' + this.x + ', Y: ' + this.y);
    }
}

let point = new Point(100, 200);
point.draw();