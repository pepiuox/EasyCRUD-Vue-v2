<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" name="viewport"
              content="width-device=width, initial-scale=1" />
        <title>Admin CRUD</title>
        <link rel="stylesheet" href="css/theme.css">
        <link rel="stylesheet" href="css/fonts.css">
        <link rel="stylesheet"
              href="css/font-awesome.min.css">
        <!-- Custom .css -->
        <link rel="stylesheet" href="css/custom/custom.css">
        <!-- Custom font -->
        <link href="https://fonts.googleapis.com/css?family=Quicksand"
              rel="stylesheet">
        <link href="css/bootstrap-datepicker.min.css"
              rel="stylesheet" type="text/css" />
        <link href="css/jquery-ui.min.css" rel="stylesheet"
              type="text/css" />
        <script type="text/javascript"
        src="js/jquery.min.js"></script>
        <script type="text/javascript"
        src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/vue.js"></script>
        <script type="text/javascript" src="js/axios.js"></script>
        <script type="text/javascript"
        src="js/popper.min.js"></script>
        <script type="text/javascript"
        src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"
        type="text/javascript"></script>
        <script src="js/tinymce/tinymce.min.js"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <script>
            $('#imagen').on('change', function () {
                //get the file name
                var fileName = $(this).val();
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })
        </script>
