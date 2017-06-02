$(document).ready(function() {
    $('#search_query').on("keyup", function () {
        var query = $('#search_query').val();
        console.log("debug: ");
        var movies = $('.movie-panel');
        var minis = $('.mini-movie');
        if (query) {

            for (i = 0; i < movies.length; i++) {
                if (!movies[i].textContent.toLowerCase().includes(query)) {
                    movies[i].style.display = 'none';
                    minis[i].style.display = 'none';
                }
            }
        } else {
            for (i = 0; i < movies.length; i++) {
                movies[i].style.display = 'inline-block';
                minis[i].style.display = 'inline-block';
            }
        }
    });
});

