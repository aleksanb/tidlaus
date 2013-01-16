$("input#user_autocomplete").autocomplete({
    source: "/users/search.json",
    minChars: 2
});
