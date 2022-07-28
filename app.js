$(function(){
    window.addEventListener('message', (event) => {
        var item = event.data;

        if (item !== undefined && item.typ === "carhud") {
            if (item.status === true) {
                document.body.style.display = "flex";
            } else if (item.status === false) {
                document.body.style.display = "none";
            }
        } else if (item !== undefined && item.typ === "zmien") {
            document.getElementById("kilometry").innerHTML = item.predkosc;
            document.getElementById("ulica").innerHTML = item.ulica;
            document.getElementById("pasek").style.width = item.obroty + "%";
        }
    });
});