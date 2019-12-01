
function initMap() {
    // The location of Uluru
    var dongguk = {lat: 37.558248, lng: 127.000189};
    // The map, centered at Uluru
    var map = new google.maps.Map(
        document.getElementById('map'), {zoom: 14, center: dongguk});
    // The marker, positioned at Uluru
    
    var locations = [['명동', 37.563576, 126.983431],

        ['신라호텔', 37.556684, 127.006119],

        ['대한극장', 37.561054, 126.995320],

        ['남산', 37.550925, 126.990945],

        ['제일병원', 37.562458, 126.999008]];
    
    var infowindow = new google.maps.InfoWindow();
    
    var marker, i;
    for(i = 0; i < locations.length; i++){
        marker = new google.maps.Marker({
            id : i,
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map
        });
        
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));
    }
}

function listMap(){
    var attractions = [["약령시장",	"02-969-4793", "02570  서울 동대문구 약령중앙로 10 (제기동)  약령시장", "1호선 제기역 2번 출구 	동대문구에 위치한 약령시장은 우리나라에서 거래되는 70%의 한약재를 유통하는 약재 전문 시장이다.", "9:00~18:00", "", "", ""],
    ["신응암시장", "02-389-3330", "03466  서울 은평구 응암로26길 3  신응암시장", "6호선 새절역 1번 출구	신응암시장은 농수산물, 축산물, 건어물 등을 판매하는 60여 개 점포로 이루어진 소규모 시장이다. 대형 마트 입점으로 어려운 상황 속에도 시장 상인들이 협력해 이를 극복한 대표적 사례로 손꼽힌다.", "", "", "", ""]];

    
}