/* Setup Settings for javascript libraries */
toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "2000",
    "extendedTimeOut": "4000",
    "showEasing": "linear",
    "hideEasing": "linear",
    "showMethod": "slideDown",
    "hideMethod": "fadeOut"
}
jQuery.minicolors = {
    defaults: {
        animationSpeed: 50,
        animationEasing: 'swing',
        change: null,
        changeDelay: 0,
        control: 'hue',
        dataUris: true,
        defaultValue: '',
        format: 'rgb',
        hide: null,
        hideSpeed: 100,
        inline: false,
        keywords: '',
        letterCase: 'lowercase',
        opacity: true,
        position: 'bottom left',
        show: null,
        showSpeed: 100,
        theme: 'bootstrap',
        swatches: []
    }
};
var titan_editor_tinymce_init = function(){
tinymce.editors=[];
tinymce.init({
    selector: '.tem_rich_textarea',
    height: 500,
    plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen textcolor colorpicker",
        "insertdatetime media table contextmenu paste imagetools"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
    imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
    content_css: [
        '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
        '//www.tinymce.com/css/codepen.min.css'
    ],
   setup : function(ed) {
		  ed.on('change', function(e) {
	      	temSaveRichTextEditor(ed);
		  });
	}
});
}