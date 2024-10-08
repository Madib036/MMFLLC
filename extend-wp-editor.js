(function() {
    tinymce.PluginManager.add('TE_tc_button', function( editor, url ) {
        editor.addButton( 'TE_tc_button', {
            title: 'Titan Elements',
            icon: "icon titan-elements-icon",
            onclick: function() {
		jQuery.post(ajaxurl, { action : 'titan_elements_global_get_titan_sections'}, function(data) {
        console.log(data);	
		editor.windowManager.open( {
        title: 'Insert Titan Section',
        body: [{
            type: 'textbox',
            name: 'id',
            label: 'Section id'
        },
        {
            type: 'textbox',
            name: 'class',
            label: 'Class(es)'
        },
        {
            type: 'listbox', 
            name: 'section', 
            label: 'Titan Section', 
            'values': JSON.parse(data)
        }
		],
        onsubmit: function( e ) {
			var content = '[titan-section ';
			if(e.data.id){ // Add id is not empty
				content += 'id="'+e.data.id+'" ';	
			}
			if(e.data.class){ // Add class is not empty
				content += 'class="'+e.data.class+'" ';	
			}			
			content += 'package="'+e.data.section.split('***')[0]+'" template="'+e.data.section.split('***')[1]+'"][/titan-section]';
            editor.insertContent(content);
        }
    });
				
	    });	 // Ajax
					
            }
        });
    });
})();