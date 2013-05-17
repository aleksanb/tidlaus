autocomplete = $("input#user_autocomplete").autocomplete({
    source: "/users/search.json",
    minChars: 2
});

$(document).ready(autocomplete);
$(document).on('page:load', autocomplete);
