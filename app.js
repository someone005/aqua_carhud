$(function(){
    window.addEventListener('message', (event) => {
        var item = event.data;

        if (item !== undefined && item.typ === "carhud") {
            if (item.status === true) {
                document.getElementById("box").style.marginBottom = "0%";
            } else if (item.status === false) {
                document.getElementById("box").style.marginBottom = "-10%";
            }
        } else if (item !== undefined && item.typ === "zmien") {
            document.getElementById("kilometry").innerHTML = item.predkosc;
            document.getElementById("ulica").innerHTML = item.ulica;
            document.getElementById("pasek").style.width = item.obroty + "%";
        }
    });
});