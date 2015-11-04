/*CODIGO TEMPORARIO*/

/*Search listener
$(document).ready(startSearch);

function startSearch() {
    $('#searchByNameID').keyup(function () {
        code = event.keyCode;
        if (code != 39 && code != 37 && code != 40 && code != 38) {
            var inputBox = document.getElementById('searchByNameID');
            var textfield = inputBox.value;
            $("#searchList").empty();
            $("#searchList").show();
            if (textfield.length > 0) {
                $.ajax({
                    type: "POST",
                    dataType: "html",
                    url: "../../api/games/searchGames.php",
                    data: {
                        word: textfield
                    },
                    async: false
                }).done(function (games) {
                    $("#searchList").append(games);
                });
            }
        }
    });
    var inputBox = document.getElementById('searchByNameID').addEventListener("click", showSearch);
    document.addEventListener("click", hideSearch, true);

    function showSearch() {
        $('#searchList').show();
    }

    function hideSearch() {
        if ($("#searchList").is(':visible')) {
            $("#searchList").hide();
        }
    }
}

Search listener End*/

/*
function searchGame($name,$minPrice,$maxPrice,$languages,$genres)
	{
		$langNum = str_repeat('?,', count($languages) - 1) . '?';
		if(!empty($genres)){
			$genresNum = str_repeat('?,', count($genres) - 1) . '?';
			$selectGen="AND ARRAY[$genresNum::int] <@ ARRAY(SELECT genreID FROM GameGenre WHERE GameGenre.gameID=Game.gameID)"; 
		}else {
			$selectGen="";
		}
		global $conn; 
		$stmt = $conn->prepare("SELECT DISTINCT Game.* FROM Game,GameLanguage
			WHERE LOWER(Game.name) LIKE LOWER(?)
			AND Game.price > ?
			AND Game.price < ?
			AND Game.gameID = GameLanguage.gameID
			AND GameLanguage.languageID IN ($langNum)"
			.$selectGen."ORDER BY Game.name ASC");

		$stmt->bindValue(1, $name);
		$stmt->bindValue(2, $minPrice);
		$stmt->bindValue(3, $maxPrice);

		$i=0;
		foreach ($languages as $k => $id){
			$stmt->bindValue(($k+4), $id);
			$i++;
		}

		if(!empty($genres)){
			foreach ($genres as $k => $id)
				$stmt->bindValue(($k+4+$i), $id);
		}
		$stmt->execute();
		return $stmt->fetchAll();
	}	*/