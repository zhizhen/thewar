function fmod (a, b) {
    var t = a % b;
    if (Math.abs(t) > b / 2){
        t = Math.abs(b) - Math.abs(t);
    }
    return t;
}

module.exports = {
    fmod: fmod
}