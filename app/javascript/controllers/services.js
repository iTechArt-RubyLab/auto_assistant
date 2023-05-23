
    $(document).on('ready turbolinks:load', function() {
    $('#service_type').autocomplete({
        source: $('#service_type').data('autocomplete-source')
    });
});

