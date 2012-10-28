$(document).ready(function(){
    $("#movie_select").select2({
            placeholder: "Search for a movie",
            minimumInputLength: 3,
            ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
                url: "http://private-2bdb-themoviedb.apiary.io/3/search/movie",
                dataType: 'json',
                data: function (term, page) {
                    return {
                        query: term, // search term
                        api_key: "762b2857e0272594885f20c826d2aacd" // please do not use so this example keeps working
                    };
                },
                results: function (data, page) { // parse the results into the format expected by Select2.
                    // since we are using custom formatting functions we do not need to alter remote JSON data
                    return {results: data.results};
                }
            },
            formatResult: movieFormatResult, // omitted for brevity, see the source of this page
            formatSelection: movieFormatSelection  // omitted for brevity, see the source of this page
        });
});

    function movieFormatResult(movie) {
        // var markup = "<table class='movie-result'><tr>";
        // if (movie !== undefined && movie.poster_path !== undefined) {
        //     markup += "<td class='movie-image'><img src='http://cf2.imgobject.com/t/p/w92" + movie.poster_path + "'/></td>";
        // }
        var markup = "<div class='movie-result'>" + movie.title + "</div>";
        return markup;
    }

    function movieFormatSelection(movie) {
        return movie.title;
    }


