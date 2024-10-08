jQuery( document ).ready(function($) {	
  
  /********************************/
 /**** Live Preview Controls *****/
/********************************/
/* Color Picker Inputs ###################################################################### */
$('INPUT.minicolors').minicolors();
var titanObjColors = {
    "titan-background-color" : "background-color",
    "titan-color" : "color",
    "titan-border-color" : "borderColor"
};
$.each( titanObjColors, function( key, value ) {
    $('#'+key).change(function(event){
        if(value == "borderColor"){
            var propArray = ["borderTopColor", "borderRightColor", "borderBottomColor", "borderLeftColor"]				
            var colorString = this.value + " " + this.value + " " + this.value + " " + this.value;
            $( "#titan-preview" ).css('borderColor', this.value);	
            $( "#titan-preview" ).css(titan_split_inputs(propArray, colorString, ''));	
        } else {
        $( "#titan-preview" ).css( value, this.value );
        }
    });
});
/* Unit Sizing Inputs ###################################################################### */
var titanObjSizes = {
    "titan-font-size"           :  "fontSize",
    "titan-border-width"        :  "borderWidth",
    "titan-padding"             :  "padding",
    "titan-margin"              :  "margin",
    "titan-height"              :  "height",  
    "titan-width"               :  "width"    
};
$.each( titanObjSizes, function( key, value ) {
    $('#'+key).change(function(event){
        if(value == "padding" || value == "margin"){
            var propArray = [value+"Top", value+"Right",value+"Bottom",value+"Left"];
            $( "#titan-preview" ).css(titan_split_inputs(propArray, this.value, $( "#"+key+"-units" ).val()));
        } else if(value == "borderWidth"){
            var propArray = ["borderTopWidth", "borderRightWidth", "borderBottomWidth", "borderLeftWidth"];			
            $( "#titan-preview" ).css(titan_split_inputs(propArray, this.value, $( "#"+key+"-units" ).val()));	
        } else {
            $( "#titan-preview" ).css( value, this.value + $( "#"+key+"-units" ).val());
        }
        
    });
});
		
/* Unit Select Box Inputs ###################################################################### */
var titanObjUnits = {
    "titan-font-size-units"     : "fontSize",
    "titan-padding-units"       : "padding",
    "titan-margin-units"        : "margin",
    "titan-height-units"        : "height",
    "titan-width-units"         : "width",
    "titan-border-width-units"  : "borderWidth"
};
$.each( titanObjUnits, function( key, value ) {
    $('INPUT.titan-units-'+value+'-select').click(function(event){
        // Grab selected value
        $( "#" + key ).val( this.value );
        // Close Dropdown
        $( ".input-group-btn.open").removeClass( "open" );
        // Apply parent value
        var parentId = key.replace("-units","");
        // Assign units properly if multiple are defined
        var unitParts = $("#"+parentId).val().split(" ");
        var finalOutput = "";
        for (var i = 0; i < unitParts.length; i++) {
            finalOutput += unitParts[i]+this.value+" ";
        }
        // Update preview
        $( "#titan-preview" ).css( value, finalOutput );
    });
});
        
/* Select Box Inputs ###################################################################### */
var titanObjSelect = {
    "titan-text-align-select"     : "textAlign",
    "titan-border-style-select"  : "borderStyle",
    "titan-background-repeat-select"  : "backgroundRepeat",
    "titan-background-position-select"  : "backgroundPosition",
    "titan-background-size-select"  : "backgroundSize"
};
$.each( titanObjSelect, function( key, value ) {
    $('INPUT.titan-'+value+'-select').click(function(event){
        // Grab selected value
        $( "#" + key ).val( this.value );
        var parentId = key.replace("-select","");
        $( "#"+parentId ).val( this.value );
        // Close Dropdown
        $( ".input-group-btn.open").removeClass( "open" );
        // Apply parent value
        $( "#titan-preview" ).css( value, this.value );
    });
});
/* Media Library Inputs ###################################################################### */
var titanObjectmedia = {
   "titan-background-image" : "backgroundImage",
   "titan-background-video-source" : "backgroundVideoSource",
   "titan-background-video-poster" : "backgroundVideoPoster",
   "titan-parallax-image" : "backgroundParallax"
};
$.each( titanObjectmedia, function( key, value ) {
$('#'+key+'-btn').click(function(e) {
e.preventDefault();
var image = wp.media({ 
    title: 'Upload Image',
    // mutiple: true if you want to upload multiple files at once
    multiple: false
}).open()
.on('select', function(e){
    // This will return the selected image from the Media Uploader, the result is an object
    var uploaded_image = image.state().get('selection').first();
    // We convert uploaded_image to a JSON object to make accessing it easier
    // Output to the console uploaded_image
    var image_url = uploaded_image.toJSON().url;
    // Let's assign the url value to the input field
    $('#'+key).val(image_url);
    if(value == "backgroundImage"){
    $( "#titan-preview" ).css( value, "url('"+image_url+"')" ); 
    }
});
});
});
/* Buttons to change controls ###################################################################### */
$( ".titan-elements-controls-selection" ).click(function(event) {
     titanControlsSetActiveTab(this.id);
    // Attach editor panel if able
     if(this.id == "titan-pick-control-elements"){
        titanElementsLoadElementPanel();
     }
     else if("titan-pick-control-advanced"){
         $(".titan-elements-advanced-editor-tabs").removeClass('te-adv-active');
         $("#titan-elements-advanced-standard").addClass('te-adv-active');
         editor.getSession().setMode("ace/mode/css");
         editor.setValue($("#titan-elements-advanced-standard").attr("data-te-editor").replace(new RegExp("<n />", 'g'), "\n"));
     }
});
var titanControlsSetActiveTab = function(id){
    // Set active tab
    $(".titan-elements-controls-selection").removeClass('cactive');
    $("#"+id).addClass('cactive');
    var contentTab = id.replace("titan-pick-control-", "");
    // hide or show controls
    $(".te-controls-tab").addClass('te-controls-hidden');
    $("#te-tab-"+contentTab).removeClass('te-controls-hidden');
}
/* Toggle to expand package controls ###################################################################### */
$("#titan-package-settings-toggle").click(function(){
   if($(this).attr("data-status") == "hidden"){
     $(".titan-elements-item-gallery-title").removeClass("titan-width-225");
     $("#titan-package-control-tray").removeClass("titan-tray-close"); 
     $("#titan-package-control-tray").addClass("titan-tray-open");
     $(this).attr("data-status", "show");
   } else {
     $(".titan-elements-item-gallery-title").addClass("titan-width-225");
     $("#titan-package-control-tray").removeClass("titan-tray-open");
     $("#titan-package-control-tray").addClass("titan-tray-close"); 
     $(this).attr("data-status", "hidden");  
   }    
});

$("#titan-package-control-tray button").click(function(){
    // Add new package
    if(this.id == "titan-add-new-package"){
        var data = {
         title:"Create Package",
         content: '<div> What will you name you new package? </div> <input id="titan-package-manager-name" class="form-control" value="" style="margin-top:10px" />',
         functions: "$('#titan-popup-modal label').hide();$('#result-window').css('padding', '0');$('#titan-modal-insert').html('<i class=\"fa fa-check\"></i> Create')",
         submit: "executePackageManager('add-new');"
        };        
    } 
    // Add delete package
    else if(this.id == "titan-delete-package"){
        var data = {
         title:"Delete Package",
         content: '<div> What package do you wish to delete? </div> <input id="titan-package-manager-name" class="form-control" value="" style="margin-top:10px" />',
         functions: "$('#titan-popup-modal label').hide();$('#result-window').css('padding', '0');$('#titan-modal-insert').html('<i class=\"fa fa-check\"></i> Delete')",
         submit: "executePackageManager('remove');"
        };        
    } 
    // Add delete all packages
    else if(this.id == "titan-delete-all-packages"){
        var data = {
         title:"Clear All Packages",
         content: '<div> Type in reset to confirm that your are deleting all the packages associated with this installation? </div> <input id="titan-package-manager-name" class="form-control" value="" style="margin-top:10px" />',
         functions: "$('#titan-popup-modal label').hide();$('#result-window').css('padding', '0');$('#titan-modal-insert').html('<i class=\"fa fa-check\"></i> Delete All')",
         submit: "executePackageManager('remove-all');"
        };
    }
    // Load Modal   
    titanElementsDrawModal(data);
});

  /********************************/   
 /******* HTTP Call Buttons ******/
/********************************/
/* Preform Extra Package Actions ###################################################################### */
var executePackageManager = function(functionType){
    var data = {
               function : functionType, 
               name: $("#titan-package-manager-name").val()
            };
    jQuery.post(ajaxurl, { action : 'titan_package_manager', data : data }, function(result) {
       var result = JSON.parse(result);  
       if(result.message){
            $("#titan-package-list-home").html(result.packageList);
            titanApplyLoadingToPackages();
            $("#titan-elements-loaded-sections").html(result.sectionList);
            titanApplyLoadingToList();
            $('.titan-elements-package-selection').removeClass('pactive');
            $("#titan-pick-filter-all").addClass('pactive');
            // If delete all then purge editor data
            if(result.message == "All packages deleted!"){
                titanElementsUpdatePreview();
                titanClearSectionsData();
            }
            toastr.success(result.message);
       } else {
           toastr.error(result.error); 
       }
    });
}
/* Load a Section or package ###################################################################### */
var titanApplyLoadingToPackages = function(){
// Package Action - Filter sections
$( ".titan-elements-package-selection" ).click(function(event) {
	var package = this.id.replace("titan-pick-filter-", "");
    $(".titan-elements-package-selection").removeClass('pactive');
    $("#"+this.id).addClass('pactive');
    jQuery.post(ajaxurl, {action:'titan_load_package', package:package}, function(data) {
        $("#titan-elements-loaded-sections").html(data); 
        titanApplyLoadingToList();
    });
});
}
var titanApplyLoadingToList = function(){
// Section Action - Apply section to preview
$( ".titan-elements-item-selection" ).click(function(event) {
    // Add selection highlight for button
    $( ".titan-elements-item-selection" ).removeClass("titan-elements-item-selection-active");
    $( this ).addClass("titan-elements-item-selection-active");
    // Setup section, name, and package
	var section = this.id.replace("titan-pick-section-", "");
    var name = section.split("***");
    var package = name[0];
    name = name [1];
    $( "#titan-preview" ).removeAttr("style"); // Remove style ***
    $("input.titan-main-field").val(""); // Clear previous field data ***
    $(".titan-main-field-data").attr("data-te-editor", ""); // Clear previous field data ***
    editor.getSession().setValue(""); // Clear editor data
    // Load Preview   
    jQuery.post(ajaxurl, {action:'titan_load_section_preview', package:package, name:name}, function(data) {
         $("#titan-preview-container").html(data);
         // Load input data
	    jQuery.post(ajaxurl, {action:'titan_load_section', section:section}, function(data) {
            console.log(data);
				var dataFile = JSON.parse(data);
                // Set up data
                 $("#titan-section-name").val(dataFile.name);
                 $("#titan-section-package").val(dataFile.package);
                 $("#titan-section-previous-name").val(dataFile.name);
                 $("#titan-section-previous-package").val(dataFile.package);
                 // Visual Special
                 $("#titan-background-video-source").val(dataFile.video.source);
                 $("#titan-background-video-poster").val(dataFile.video.poster);
                 $("#titan-parallax-image").val(dataFile.parallax.image); 
                 $("#titan-parallax-speed").val(dataFile.parallax.speed);
				 $("#titan-parallax-bleed").val(dataFile.parallax.bleed);
                 // Advanced Tab
                 $("#titan-elements-advanced-id").val(dataFile.id);
                 $("#titan-elements-advanced-class").val(dataFile.class);
                 $("#titan-elements-advanced-standard").attr("data-te-editor", dataFile.classStandard);
                 $("#titan-elements-advanced-mobile").attr("data-te-editor", dataFile.classMobile);               
                 $("#titan-elements-advanced-content").attr("data-te-editor", dataFile.content);
                 $("#titan-elements-advanced-script").attr("data-te-editor", dataFile.script); 
                // If elements selected and a element has been selected then load editor
                if(dataFile.element){
                 var elementData = JSON.parse(dataFile.element.replace(/'/g, '"'));  
                 console.log('elementData:'+elementData.type);
                if(elementData.type){
                $("#titan-element-list").val(elementData.type);
                    jQuery.post(ajaxurl, { action : 'titan_attach_to_editor', element : elementData.type, section: dataFile.name}, function(element) {    
                        $("#te-element-data-form").html(element);
                        // Load elements panel by default
                        titanElementsLoadElementPanel();
                        temInitNow();
                    });
                }
                }
                 
				// Prepare CSS
                if(dataFile.css.length > 1){
                var cssFiltered = dataFile.css.replace(/;/g, "\",\""); // add quotes around ;
				cssFiltered = cssFiltered.replace(/:/g, "\":\""); // Add quotes around :
                cssFiltered = cssFiltered.replace(/http":"/g, "http:");  // correct http:
				cssFiltered = cssFiltered.replace(/" /g, "\""); // Remove space in front of properties
				cssFiltered = "{\""+cssFiltered.slice(0,-2)+"}"; // Remove last 2 chars
				cssFiltered = JSON.parse(cssFiltered); // Convert into json
				// Filter CSS and add to inputs
				var allUnits = ["px", "%", "em", "rem"], filteredValue = "", tcolor = "", timage="", tprops = "";
				$.each( cssFiltered, function( property, value ) {
					if($("#titan-"+property).length){ // if property exists as an input
						filteredValue = titanFilterAndSelectUnits(value, allUnits);
						if(property == "color" || property == "border-color"){ // colors
							$("#titan-"+property).minicolors('value', value);
						} else { // everything else
							$("#titan-"+property).val(filteredValue);
						}
					} else if(property == "background"){ // background
                            // bg-color
                            tcolor = value.split(")");
                            if(tcolor[0]){
                            tcolor  = tcolor[0];
							$("#titan-"+property+"-color").minicolors('value', tcolor+")");
                            }
                            // bg-image
                            timage = value.split("url('");
                            if(timage[1]){
                            timage  = timage[1].split("')");
                            if(timage[0]){
							$("#titan-"+property+"-image").val(timage[0]);
                            }
                            }
                            // bg-props
                            tprops = value.split("')");
                            if(tprops[1]){
                            tprops = tprops[1].split(" ");
                            if(tprops[1]){
                            $("#titan-"+property+"-repeat").val(tprops[1]);
                            }
                            if(tprops[3] && tprops[4]){
                            $("#titan-"+property+"-position").val(tprops[3]+" "+tprops[4]);
                            }
                            if(tprops[5]){
                            $("#titan-"+property+"-size").val(tprops[5]);
                            }
                            }
					} else if ($("#titan-"+property+"-units").length){ // units
						filteredValue = titanDetectTheUnits(value, allUnits);
						$("#titan-"+property+"-units").val(filteredValue);
					}
				});
                }
                // Refresh tab
                titanControlsSetActiveTab('titan-pick-control-visual');
				// Initiate Parallaxing
				if(dataFile.parallax.image){
					if(dataFile.parallax.image.length > 4){	
                        $("#titan-preview-container").scrollTop(0);		
						$('#titan-preview').parallax({imageSrc: dataFile.parallax.image, bleed: 0});
						$('.parallax-mirror').prependTo('.titan-admin-parallaxing'); $('.parallax-mirror').css({'z-index':'0'});
					}
				}
	    }); // load fields into editor
     }); // Run Titan Section shortcode
});
}
titanApplyLoadingToPackages();
titanApplyLoadingToList();
/* Save a Section ###################################################################### */		
$( "#titan-save-section" ).click(function(event) {
    var elementName = $('#titan-element-list').val();
    var packageSelected = $('.titan-elements-package-selection.pactive').attr('id'); 
    var parallaxImage = $("#titan-parallax-image").val();
        var data = {
        name : $("#titan-section-name").val(),
        oldName : $("#titan-section-previous-name").val(),
        package : $("#titan-section-package").val(),
        oldPackage : $("#titan-section-previous-package").val(),
        packageSelected : $('.pactive').attr('id').replace("titan-pick-filter-", ""),
        elementData: $( "#titan-elements-"+elementName.replace(" ", "-")+"-data" ).val(),
        id: $("#titan-elements-advanced-id").val(),
        class: $("#titan-elements-advanced-class").val(),
        classStandard: JSON.stringify($("#titan-elements-advanced-standard").attr("data-te-editor")).replace(/\\n/g, "<n />").slice(1, -1),
        classMobile: JSON.stringify($("#titan-elements-advanced-mobile").attr("data-te-editor")).replace(/\\n/g, "<n />").slice(1, -1),
        content: JSON.stringify($("#titan-elements-advanced-content").attr("data-te-editor")).replace(/\\n/g, "<n />").slice(1, -1),
        script: JSON.stringify($("#titan-elements-advanced-script").attr("data-te-editor")).replace(/\\n/g, "<n />").slice(1, -1),
        css : $( "#titan-preview" ).attr("style"),
        video: { source: $("#titan-background-video-source").val(), poster: $("#titan-background-video-poster").val() },
        parallax: { image : $("#titan-parallax-image").val(), speed : $("#titan-parallax-speed").val(), bleed : $("#titan-parallax-bleed").val() }
        }
        /*  */
 
    if(data.name.length > 1){
    if(data.package.length > 1){
    jQuery.post(ajaxurl, {action:'titan_save_section', data:data}, function(data) {
            toastr.success('Saved Successfully!');
            var dataFile = JSON.parse(data);
            console.log(dataFile.elements);
            /* If new add to the sections and package load list */
            $("#titan-package-list-home").html(dataFile.packageList);
            $("#titan-elements-loaded-sections").html(dataFile.sectionList);
            titanApplyLoadingToPackages();
            titanApplyLoadingToList();
            titanElementsUpdatePreview();
            // Select correct package after refresh
            $('.titan-elements-package-selection').removeClass('pactive');
            $("#"+packageSelected).addClass('pactive');
            // Refresh parallaxing
            setTimeout(function(){
            if(parallaxImage.length > 4){    
            $("#titan-preview-container").scrollTop(0);
            $('#titan-preview').parallax({imageSrc: parallaxImage, bleed: 0});  
            $('.parallax-mirror').prependTo('.titan-admin-parallaxing');
            $('.parallax-mirror').css({'z-index':'0'});
            }
            }, 1000);
    });
    } else { toastr.error("Package can't be empty!");}
    } else { toastr.error("Name can't be empty!");}
});
/* Create a Section ###################################################################### */
$( "#titan-create-section" ).click(function(event) {
     titanClearSectionsData();
     $("#titan-preview-container").html("");
     $('.titan-elements-item-selection-active').removeClass('titan-elements-item-selection-active');
    });
    //Clear data with first visit  or page refresh
    $( window ).unload(function() {
        return titanClearSectionsData();
     });
    // Clear all bad data
var titanClearSectionsData = function(){
    $( "#titan-preview" ).removeAttr("style"); // remove style
    // Clear previous field data
    $("input.titan-main-field").val("");
    $(".titan-main-field-data").attr("data-te-editor", "");
    editor.getSession().setValue("");
    $("#titan-section-name").val("");
    $("#titan-section-package").val("");                    
    $("#titan-section-previous-name").val("");
    $("#titan-section-previous-package").val("");
    /* NOTE: keep package for reuse */
}
/* Duplicate a Section ###################################################################### */
$( "#titan-duplicate-section" ).click(function(event) {
    if($("#titan-section-name").val().length > 1){
    // Clear previous field data
    $("input.titan-main-field").val("");
    $(".titan-main-field-data").attr("data-te-editor", "");
    editor.getSession().setValue("");
    $("#titan-section-name").val($("#titan-section-name").val()+"_duplicate");
    $("#titan-section-previous-name").val("");
    $("#titan-section-previous-package").val("");
    toastr.info('Duplicated Successfully!');
    /* NOTE: keep package for reuse */
    } else {
        toastr.error("Section must have a valid name!");
    }
});
/* Delete a Section ###################################################################### */
$( "#titan-delete-section" ).click(function(event) {
     // Setup final submit
     var submit = "titanDeleteSectionAfterConfirm();";
     // Assign Data
     var data = {
         title:"Confirm",
         content: '<div> Are you sure you want to delete <b>'+$("#titan-section-previous-name").val()+'</b> from package <b>'+$("#titan-section-previous-package").val()+'</b>? </div>',
         functions: "$('#titan-popup-modal label').hide();$('#titan-modal-insert').html('<i class=\"fa fa-check\"></i> Confirm')",
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data);
});
var titanDeleteSectionAfterConfirm = function(){
    var jsNameSelect = $("#titan-section-previous-name").val();
    var jsPackageSelect = $("#titan-section-previous-package").val();
    var packageSelected = $('.pactive').attr("id");
    if(jsNameSelect.length > 1 || jsPackageSelect.length > 1){
    jQuery.post(ajaxurl, { action : 'titan_delete_section', name : jsNameSelect, package: jsPackageSelect, selected: packageSelected.replace('titan-pick-filter-', '') }, function(data) {
        toastr.success('Removed Successfully!');
            $("#titan-elements-loaded-sections").html(data);
            titanApplyLoadingToList();
            titanElementsUpdatePreview();
            titanClearSectionsData();
            // Select correct package selected after refresh
            $('.titan-elements-package-selection').removeClass('pactive');
            $("#"+packageSelected).addClass('pactive');
    });
    } else {   
        toastr.error("Can't delete unsaved sections!");
    }
}
/* Attach an Element ###################################################################### */
$( ".titan-elementList-select" ).click(function(event) {
    var jsNameSelect = this.value;
    $( ".input-group-btn.open").removeClass( "open" );
    $("#titan-element-list").val(jsNameSelect);
    titanElementsLoadElementPanel();
});

// Give elements a way to Update preview window
var titanElementsLoadElementPanel = function(){
    var jsNameSelect = $("#titan-element-list").val();
    var section = $("#titan-section-package").val()+"***"+$("#titan-section-name").val();
    jQuery.post(ajaxurl, { action : 'titan_attach_to_editor', element : jsNameSelect, section:section }, function(data) {    
        $("#te-element-data-form").html(data);
        temInitNow();
    });
}
  // Give elements a way to Update preview window
  var titanElementsUpdatePreview = function(){
    var name = jQuery('#titan-section-previous-name').val();
    var package = jQuery('#titan-section-previous-package').val();
    if(name != "" && package != ""){
    // Load Preview   
    jQuery.post(ajaxurl, {action:'titan_load_section_preview', package:package, name:name}, function(data) {
         jQuery("#titan-preview-container").html(data);
    });
    } else {
        // Don't Update
        // toastr.error("Must save once before updating the preview window.");
    }
}

  /********************************/   
 /******* Helper Functions *******/
/********************************/
// Split the string into different css default implementations     
var titan_split_inputs = function(key, value, units){					
    var stringArray = value.split(' ');
    var  top =    key[0], right = key[1], 
            bottom = key[2], left =  key[3];
    var telist = { }; 
    // If 1 different Options all 
    if(stringArray.length == 1){
        telist[top]    =  stringArray[0] + units;
        telist[bottom] =  stringArray[0] + units;
        telist[right]  =  stringArray[0] + units;
        telist[left]   =  stringArray[0] + units;
    }
    // If 2 different Options   [top-bottom][right-left] 
    if(stringArray.length == 2){ 
        telist[top]    =  stringArray[0] + units;
        telist[bottom] =  stringArray[0] + units;
        telist[right]  =  stringArray[1] + units;
        telist[left]   =  stringArray[1] + units;
    }
    // If 3 different Options  top [right-left] bottom  
    if(stringArray.length == 3){
        telist[top]    =  stringArray[0] + units;
        telist[bottom] =  stringArray[2] + units;
        telist[right]  =  stringArray[1] + units;
        telist[left]   =  stringArray[1] + units;
    }
    // If 4 different Options  top right bottom left 
    if(stringArray.length == 4){
        telist[top]    =  stringArray[0] + units;
        telist[bottom] =  stringArray[2] + units;
        telist[right]  =  stringArray[1] + units;
        telist[left]   =  stringArray[3] + units;
    }
    return telist;
};
// Filter through the different unit types and append one to the end of the number
var titanFilterAndSelectUnits = function(value, units){
    for(var i = 0; i < units.length; i++){
        value = value.replace(new RegExp(units[i], "g"), "");
    }
    return value;
}
// Find out what units a certian value has by checking the i
var titanDetectTheUnits = function(value, units){
    for(var i = 0; i < units.length; i++){
        if(string.iOf(units[i]) > -1){
                value = units[i];
        } 
    }
    return value;
}
/* Replace all occurances */
String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.replace(new RegExp(search, 'g'), replacement);
};
/* Scale Inputs
var titanDynamicScaleInputs = function(inputs, fontSize){
    var scale = fontSize*.50;
    for (var i = 0; i < inputs.length; i++) {
        $(inputs[i]).css("width", (($(inputs[i]).val().length + 1) * scale) + 10 + 'px');                   
    }
} */
/* ACE editor */
    ace.require("ace/ext/language_tools");
    var editor = ace.edit("titan-elements-advanced-editor");
    editor.setTheme("ace/theme/dreamweaver");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    })
    // Update data to the correct tab
    editor.on("input", function() {
    if(!editor.session.getUndoManager().isClean()){
      var checkActiveList = ["standard", "mobile", "content", "script"];
     for (var i=0; i < checkActiveList.length; i++) { 
        if($("#titan-elements-advanced-"+checkActiveList[i]).hasClass("te-adv-active")){
            $("#titan-elements-advanced-"+checkActiveList[i]).attr("data-te-editor", editor.getSession().getValue()); //.replace(/\r?\n|\r/g, " ")
        }
     } 
    }
    });
    
/************************* Advanced Editor ******************************** */
   // Swap editor content based on which tab is selected
   $(".titan-elements-advanced-editor-tabs").click(function(){
       $(".titan-elements-advanced-editor-tabs").removeClass("te-adv-active");
       $(this).addClass("te-adv-active");
       /* Format CSS with line-breaks */
       if(this.id == "titan-elements-advanced-standard" || this.id == "titan-elements-advanced-mobile"){
       editor.getSession().setMode("ace/mode/css");
       var content = $(this).attr("data-te-editor").replace(new RegExp("<n />", 'g'), "\n");
       }
       /* Format HTML with line-breaks */
       else if(this.id == "titan-elements-advanced-content"){
       editor.getSession().setMode("ace/mode/html");
       var content = $(this).attr("data-te-editor").replace(new RegExp("<n />", 'g'), "\n");
        }
        /* Format with javascript */
       else if(this.id == "titan-elements-advanced-script"){
       editor.getSession().setMode("ace/mode/javascript");
       var content = $(this).attr("data-te-editor").replace(new RegExp("<n />", 'g'), "\n");
        }
        /* Spacing for comments
        var contentArray = content.split("/");
        if(contentArray.length > 1){
        content = "";
        for (var i = 0; i < contentArray.length; i++) {
            if(contentArray[i].indexOf('/*') !== -1){
            content += contentArray[i]+"/\n";
            } else {
            content += contentArray[i];    
            }  
        } 
        } */
       // Add data to the editor
       editor.getSession().setValue(content);
       //To focus the ace editor
        editor.focus();
        session = editor.getSession();
        //Get the number of lines
        count = session.getLength();
        //Go to end of the last line
        editor.gotoLine(count, session.getLine(count-1).length);
   });
   /* Buttons to change advanced side tabs ###################################################################### */
    $( ".titan-advanced-qi-tabs" ).click(function(event) {
        // Set active tab
        $(".titan-advanced-qi-tabs").removeClass('te-adv-side-active');
        $(this).addClass('te-adv-side-active');
        var contentId = this.id.replace("tabs", "panel");
        // Hide or show controls
        $(".te-quick-insert-panel").removeClass('te-qi-active');
        $("#"+contentId).addClass('te-qi-active');
    });
   /* ################################################### */
   /* Insertion List ####################################*/
   var titanAdvancedMenuInit = function(){
       
      // Insert Filename Reference
   $("#titan-elements-advanced-insert-filename").click(function(){
        var image = wp.media({ 
        title: 'Get Image Url',
        // mutiple: true if you want to upload multiple files at once
        multiple: false
        }).open()
        .on('select', function(e){
        // This will return the selected image from the Media Uploader, the result is an object
        var uploaded_image = image.state().get('selection').first();
        // We convert uploaded_image to a JSON object to make accessing it easier
        // Output to the console uploaded_image
        var image_url = uploaded_image.toJSON().url;
        // Let's assign the url value to the input field
        editor.insert("'"+image_url+"'");
        });
   }); 
   // Insert Page Link  
    $("#titan-elements-advanced-insert-pagelink").click(function(){
         jQuery.post(ajaxurl, { action : 'titan_get_all_links' }, function(options) {
         var data = {
         title:"Get Page/Post URL",
         content: '<div> Select Page: </div> <select id="titan-modal-page-select" class="form-control"  style="margin-top:10px">'+options+'</select>',
         functions: "$('#titan-popup-modal label').hide();$('#result-window').css('padding', '0');$('#titan-modal-insert').html('<i class=\"fa fa-link\"></i> Insert Image')",
         selectTwo: ["titan-modal-page-select"],
         submit: "editor.insert($('#titan-modal-page-select').val());"
        }             
    // Load Modal   
    titanElementsDrawModal(data);
        });
    });     
       
   // Insert HTML - Icon Reference
  $("#titan-elements-advanced-insert-font-awesome").click(function(){ 
      // Setup select array
      var faIconList = ["", "glass", "music", "search", "envelope-o", "heart", "star", "star-o", "user", "film", "th-large", "th", "th-list", "check", "remove", "close", "times", "search-plus", "search-minus", "power-off", "signal", "gear", "cog", "trash-o", "home", "file-o", "clock-o", "road", "download", "arrow-circle-o-down", "arrow-circle-o-up", "inbox", "play-circle-o", "rotate-right", "repeat", "refresh", "list-alt", "lock", "flag", "headphones", "volume-off", "volume-down", "volume-up", "qrcode", "barcode", "tag", "tags", "book", "bookmark", "print", "camera", "font", "bold", "italic", "text-height", "text-width", "align-left", "align-center", "align-right", "align-justify", "list", "dedent", "outdent", "indent", "video-camera", "photo", "image", "picture-o", "pencil", "map-marker", "adjust", "tint", "edit", "pencil-square-o", "share-square-o", "check-square-o", "arrows", "step-backward", "fast-backward", "backward", "play", "pause", "stop", "forward", "fast-forward", "step-forward", "eject", "chevron-left", "chevron-right", "plus-circle", "minus-circle", "times-circle", "check-circle", "question-circle", "info-circle", "crosshairs", "times-circle-o", "check-circle-o", "ban", "arrow-left", "arrow-right", "arrow-up", "arrow-down", "mail-forward", "share", "expand", "compress", "plus", "minus", "asterisk", "exclamation-circle", "gift", "leaf", "fire", "eye", "eye-slash", "warning", "exclamation-triangle", "plane", "calendar", "random", "comment", "magnet", "chevron-up", "chevron-down", "retweet", "shopping-cart", "folder", "folder-open", "arrows-v", "arrows-h", "bar-chart-o", "bar-chart", "twitter-square", "facebook-square", "camera-retro", "key", "gears", "cogs", "comments", "thumbs-o-up", "thumbs-o-down", "star-half", "heart-o", "sign-out", "linkedin-square", "thumb-tack", "external-link", "sign-in", "trophy", "github-square", "upload", "lemon-o", "phone", "square-o", "bookmark-o", "phone-square", "twitter", "facebook-f", "facebook", "github", "unlock", "credit-card", "feed", "rss", "hdd-o", "bullhorn", "bell", "certificate", "hand-o-right", "hand-o-left", "hand-o-up", "hand-o-down", "arrow-circle-left", "arrow-circle-right", "arrow-circle-up", "arrow-circle-down", "globe", "wrench", "tasks", "filter", "briefcase", "arrows-alt", "group", "users", "chain", "link", "cloud", "flask", "cut", "scissors", "copy", "files-o", "paperclip", "save", "floppy-o", "square", "navicon", "reorder", "bars", "list-ul", "list-ol", "strikethrough", "underline", "table", "magic", "truck", "pinterest", "pinterest-square", "google-plus-square", "google-plus", "money", "caret-down", "caret-up", "caret-left", "caret-right", "columns", "unsorted", "sort", "sort-down", "sort-desc", "sort-up", "sort-asc", "envelope", "linkedin", "rotate-left", "undo", "legal", "gavel", "dashboard", "tachometer", "comment-o", "comments-o", "flash", "bolt", "sitemap", "umbrella", "paste", "clipboard", "lightbulb-o", "exchange", "cloud-download", "cloud-upload", "user-md", "stethoscope", "suitcase", "bell-o", "coffee", "cutlery", "file-text-o", "building-o", "hospital-o", "ambulance", "medkit", "fighter-jet", "beer", "h-square", "plus-square", "angle-double-left", "angle-double-right", "angle-double-up", "angle-double-down", "angle-left", "angle-right", "angle-up", "angle-down", "desktop", "laptop", "tablet", "mobile-phone", "mobile", "circle-o", "quote-left", "quote-right", "spinner", "circle", "mail-reply", "reply", "github-alt", "folder-o", "folder-open-o", "smile-o", "frown-o", "meh-o", "gamepad", "keyboard-o", "flag-o", "flag-checkered", "terminal", "code", "mail-reply-all", "reply-all", "star-half-empty", "star-half-full", "star-half-o", "location-arrow", "crop", "code-fork", "unlink", "chain-broken", "question", "info", "exclamation", "superscript", "subscript", "eraser", "puzzle-piece", "microphone", "microphone-slash", "shield", "calendar-o", "fire-extinguisher", "rocket", "maxcdn", "chevron-circle-left", "chevron-circle-right", "chevron-circle-up", "chevron-circle-down", "html5", "css3", "anchor", "unlock-alt", "bullseye", "ellipsis-h", "ellipsis-v", "rss-square", "play-circle", "ticket", "minus-square", "minus-square-o", "level-up", "level-down", "check-square", "pencil-square", "external-link-square", "share-square", "compass", "toggle-down", "caret-square-o-down", "toggle-up", "caret-square-o-up", "toggle-right", "caret-square-o-right", "euro", "eur", "gbp", "dollar", "usd", "rupee", "inr", "cny", "rmb", "yen", "jpy", "ruble", "rouble", "rub", "won", "krw", "bitcoin", "btc", "file", "file-text", "sort-alpha-asc", "sort-alpha-desc", "sort-amount-asc", "sort-amount-desc", "sort-numeric-asc", "sort-numeric-desc", "thumbs-up", "thumbs-down", "youtube-square", "youtube", "xing", "xing-square", "youtube-play", "dropbox", "stack-overflow", "instagram", "flickr", "adn", "bitbucket", "bitbucket-square", "tumblr", "tumblr-square", "long-arrow-down", "long-arrow-up", "long-arrow-left", "long-arrow-right", "apple", "windows", "android", "linux", "dribbble", "skype", "foursquare", "trello", "female", "male", "gittip", "gratipay", "sun-o", "moon-o", "archive", "bug", "vk", "weibo", "renren", "pagelines", "stack-exchange", "arrow-circle-o-right", "arrow-circle-o-left", "toggle-left", "caret-square-o-left", "dot-circle-o", "wheelchair", "vimeo-square", "turkish-lira", "try", "plus-square-o", "space-shuttle", "slack", "envelope-square", "wordpress", "openid", "institution", "bank", "university", "mortar-board", "graduation-cap", "yahoo", "google", "reddit", "reddit-square", "stumbleupon-circle", "stumbleupon", "delicious", "digg", "pied-piper", "pied-piper-alt", "drupal", "joomla", "language", "fax", "building", "child", "paw", "spoon", "cube", "cubes", "behance", "behance-square", "steam", "steam-square", "recycle", "automobile", "car", "cab", "taxi", "tree", "spotify", "deviantart", "soundcloud", "database", "file-pdf-o", "file-word-o", "file-excel-o", "file-powerpoint-o", "file-photo-o", "file-picture-o", "file-image-o", "file-zip-o", "file-archive-o", "file-sound-o", "file-audio-o", "file-movie-o", "file-video-o", "file-code-o", "vine", "codepen", "jsfiddle", "life-bouy", "life-buoy", "life-saver", "support", "life-ring", "circle-o-notch", "ra", "rebel", "ge", "empire", "git-square", "git", "y-combinator-square", "yc-square", "hacker-news", "tencent-weibo", "qq", "wechat", "weixin", "send", "paper-plane", "send-o", "paper-plane-o", "history", "circle-thin", "header", "paragraph", "sliders", "share-alt", "share-alt-square", "bomb", "soccer-ball-o", "futbol-o", "tty", "binoculars", "plug", "slideshare", "twitch", "yelp", "newspaper-o", "wifi", "calculator", "paypal", "google-wallet", "cc-visa", "cc-mastercard", "cc-discover", "cc-amex", "cc-paypal", "cc-stripe", "bell-slash", "bell-slash-o", "trash", "copyright", "at", "eyedropper", "paint-brush", "birthday-cake", "area-chart", "pie-chart", "line-chart", "lastfm", "lastfm-square", "toggle-off", "toggle-on", "bicycle", "bus", "ioxhost", "angellist", "cc", "shekel", "sheqel", "ils", "meanpath", "buysellads", "connectdevelop", "dashcube", "forumbee", "leanpub", "sellsy", "shirtsinbulk", "simplybuilt", "skyatlas", "cart-plus", "cart-arrow-down", "diamond", "ship", "user-secret", "motorcycle", "street-view", "heartbeat", "venus", "mars", "mercury", "intersex", "transgender", "transgender-alt", "venus-double", "mars-double", "venus-mars", "mars-stroke", "mars-stroke-v", "mars-stroke-h", "neuter", "genderless", "facebook-official", "pinterest-p", "whatsapp", "server", "user-plus", "user-times", "hotel", "bed", "viacoin", "train", "subway", "medium", "yc", "y-combinator", "optin-monster", "opencart", "expeditedssl", "battery-4", "battery-full", "battery-3", "battery-three-quarters", "battery-2", "battery-half", "battery-1", "battery-quarter", "battery-0", "battery-empty", "mouse-pointer", "i-cursor", "object-group", "object-ungroup", "sticky-note", "sticky-note-o", "cc-jcb", "cc-diners-club", "clone", "balance-scale", "hourglass-o", "hourglass-1", "hourglass-start", "hourglass-2", "hourglass-half", "hourglass-3", "hourglass-end", "hourglass", "hand-grab-o", "hand-rock-o", "hand-stop-o", "hand-paper-o", "hand-scissors-o", "hand-lizard-o", "hand-spock-o", "hand-pointer-o", "hand-peace-o", "trademark", "registered", "creative-commons", "gg", "gg-circle", "tripadvisor", "odnoklassniki", "odnoklassniki-square", "get-pocket", "wikipedia-w", "safari", "chrome", "firefox", "opera", "internet-explorer", "tv", "television", "contao", "500px", "amazon", "calendar-plus-o", "calendar-minus-o", "calendar-times-o", "calendar-check-o", "industry", "map-pin", "map-signs", "map-o", "map", "commenting", "commenting-o", "houzz", "vimeo", "black-tie", "fonticons", "reddit-alien", "edge", "credit-card-alt", "codiepie", "modx", "fort-awesome", "usb", "product-hunt", "mixcloud", "scribd", "pause-circle", "pause-circle-o", "stop-circle", "stop-circle-o", "shopping-bag", "shopping-basket", "hashtag", "bluetooth", "bluetooth-b", "percent"];
      var options = "";
      for (var i = 0; i < faIconList.length; i++) {
          options += '<option value="fa fa-'+faIconList[i]+'" >'+faIconList[i]+'</option>';   
      }
      // Setup associated functions 
      var functions = "$('#titan-modal-font-awesome-select').change(function(){"
                    + "$('#result-window').html('<i class=\"' + $('#titan-modal-font-awesome-select').val() + '\"></i>');"
                    + "$('#result-window').css({'border':'2px solid #06C', 'width': '200px', 'text-align': 'center', 'margin': '5px auto 25px auto', 'font-size' : '128px'});"
                    + "});";
     // Setup final submit
     var submit = "editor.insert($('#result-window').html());";
     // Assign Data
     var data = {
         title:"Font Awesome Icon Library",
         content: '<label> Select Font Awesome Icon: </label><select id="titan-modal-font-awesome-select" class="form-control">'+options+'</select>',
         selectTwo: ["titan-modal-font-awesome-select"],
         functions: functions,
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data);
   });
   
      // Insert HTML - Icon Reference
  $("#titan-elements-advanced-insert-grid").click(function(){ 
      // Setup select array
      var sizes = ["", "xs", "sm", "md", "lg"];var sizesNames = ["", "Extra Small", "Small", "Medium", "large"];
      var options = "";
      for (var i = 0; i < sizes.length; i++) {
          options += '<option value="'+sizes[i]+'" >'+sizesNames[i]+'</option>';   
      }
      // Setup associated functions 
      var functions = "$('#titan-modal-breakpoint-select, #titan-modal-column, #titan-modal-row').change(function(){"
                    + "$('#result-window').text(titanModalGridGenerate());"
                    + "var thisData = titanModalGridGenerate(); /* thisData = thisData.replace(/>/g, '>\n'); */"
                    + "$('#result-storage').val(thisData);"
                    + "$('#result-window').css({'border':'2px solid #06C', 'width': '250px', 'text-align': 'center', 'margin': '5px auto 25px auto', 'font-size' : '12px'});"
                    + "});";
     // Setup final submit
     var submit = "editor.insert($('#result-storage').val());";
     // Assign Data
     var data = {
         title:"Generate Bootstrap Grid",
         content: '<label> Select Grid Breakpoint: </label>'+
         '<select id="titan-modal-breakpoint-select" class="form-control">'+options+'</select>'+
         '<label> Row & Columns: </label><div class="container-fluid"><div class="row"><div class="col-xs-6"><input id="titan-modal-row" class="form-control" placeholder="row" value="1" /></div><div class="col-xs-6"><input id="titan-modal-column" class="form-control" placeholder="column" value="1" /></div></div></div><input type="hidden" id="result-storage" value="" />',
         selectTwo: ["titan-modal-breakpoint-select"],
         functions: functions,
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data);
   });
   
   
   
   // Insert Media Screen
   $("#titan-elements-advanced-insert-media-screen").click(function(){
	       // Setup select array
      var mediaScreenProperties = ["none", "aspect-ratio", "color", "color-index", "device-aspect-ratio", "device-height", "device-width", "grid", "height", "max-aspect-ratio", "max-color", "max-color-index", "max-device-aspect-ratio", "max-device-height", "max-device-width", "max-height", "max-monochrome", "max-resolution", "max-width", "min-aspect-ratio", "min-color", "min-color-index", "min-device-aspect-ratio", "min-device-width", "min-device-height", "min-height", "min-monochrome", "min-resolution", "min-width", "monochrome", "orientation", "overflow-block", "overflow-inline", "resolution", "scan", "update-frequency", "width"];
      var options = "";
      for (var i = 0; i < mediaScreenProperties.length; i++) {
          options += '<option>'+mediaScreenProperties[i]+'</option>';   
      }
      // Setup associated functions 
      var functions = "$('#titan-modal-media-screen-property').change(function(){"
                    + "$('#result-window').html('@media screen and (' + $('#titan-modal-media-screen-property').val() + ':' + $('#titan-modal-media-screen-value').val() + ')');"
                    + "$('#result-window').css('border', '2px solid #06C');"
                    + "});"
                    +"$('#titan-modal-media-screen-value').keyup(function(){"
                    + "$('#result-window').html('@media screen and (' + $('#titan-modal-media-screen-property').val() + ':' + $('#titan-modal-media-screen-value').val() + ')');"
                    + "$('#result-window').css('border', '2px solid #06C');"
                    + "});"
                    +"$('.titan-ms-btn').click(function(){"
                    + "$('#titan-modal-media-screen-value').val($(this).attr('data-size'));"
                    + "$('#result-window').html('@media screen and (' + $('#titan-modal-media-screen-property').val() + ':' + $('#titan-modal-media-screen-value').val() + ')');"
                    + "$('#result-window').css('border', '2px solid #06C');"
                    + "});";
     // Setup final submit
     var submit = "editor.insert($('#result-window').html()+'{\\n\\n}');";
     // Assign Data
     var data = {
         title:"Media Screen",
         content: '<label> Media Screen Type: </label><select id="titan-modal-media-screen-property" class="form-control">'+options+'</select>'+
         '<label> Media Screen Value: </label><input id="titan-modal-media-screen-value" class="form-control" value="" placeholder="Property Value" />'+
         '<label> Bootstrap Sizes: </label><div><button id="titan-modal-ms-mobile" class="btn btn-default titan-ms-btn" data-size="768px"> Mobile </buttton>'+
         '<button id="titan-modal-ms-tablet" class="btn btn-default titan-ms-btn" data-size="992px"> Tablet </buttton>'+
         '<button id="titan-modal-ms-comp" class="btn btn-default titan-ms-btn" data-size="1200px"> PC </buttton></div>',
         selectTwo: ["titan-modal-media-screen-property"],
         functions: functions,
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data);  
   }); 
   // Insert CSS Selector Reference
   $("#titan-elements-advanced-insert-selector").click(function(){
	  // Setup select array
      var selectorValue = ["none", ".intro", "#firstname", "*", "p", "div, p", "div p", "div > p", "div + p", "p ~ ul", "[target]", "[target=_blank]", "[title~=flower]", "[lang|=en]", 'a[href^="https"]', 'a[href$=".pdf"]', 'a[href*="wpplugindepot"]', 'a:active', 'p::after', 'p::before', 'input:checked', 'input:disabled', 'p:empty', 'input:enabled', 'p:first-child', 'p::first-letter', 'p::first-line', 'p:first-of-type', 'input:focus', 'a:hover', 'input:in-range', 'input:invalid', 'p:lang(it)', 'p:last-child', 'p:last-of-type', 'a:link', ':not(p)', 'p:nth-child(2)', 'p:nth-last-child(2)', 'p:nth-last-of-type(2)', 'p:nth-of-type(2)', 'p:only-of-type', 'p:only-child', 'input:optional', 'input:out-of-range', 'input:read-only', 'input:read-write', 'input:required', ':root', '::selection', '#news:target', 'input:valid', 'a:visited'];
      var selectorDecription = ['', 'Selects all elements with class="intro"', 'Selects the element with id="firstname"', 'Selects all elements', 'Selects all <i>p</i> elements', 'Selects all <i>div</i> elements and all <i>p</i> elements', 'Selects all <i>p</i> elements inside <i>div</i> elements', 'Selects all <i>p</i> elements where the parent is a <i>div</i> element', 'Selects all <i>p</i> elements that are placed immediately after <i>div</i> elements', 'Selects every <i>ul</i> element that are preceded by a <i>p</i> element', 'Selects all elements with a target attribute', 'Selects all elements with target="_blank"', 'Selects all elements with a title attribute containing the word "flower"', 'Selects all elements with a lang attribute value starting with "en"', 'Selects every <i>a</i> element whose href attribute value begins with "https"', 'Selects every <i>a</i> element whose href attribute value ends with ".pdf"', 'Selects every <i>a</i> element whose href attribute value contains the substring "wpplugindepot"', 'Selects the active link', 'Insert something after the content of each <i>p</i> element', 'Insert something before the content of each <i>p</i> element', 'Selects every checked <i>input</i> element', 'Selects every disabled <i>input</i> element', 'elects every <i>p</i> element that has no children (including text nodes)', 'Selects every enabled <i>input</i> element', 'Selects every <i>p</i> element that is the first child of its parent', 'Selects the first letter of every <i>p</i> element', 'Selects the first line of every <i>p</i> element', 'Selects every <i>p</i> element that is the first <i>p</i> element of its parent', 'Selects the input element which has focus', 'Selects links on mouse over', 'Selects input elements with a value within a specified range', 'Selects all input elements with an invalid value', 'Selects every <i>p</i> element with a lang attribute equal to "it" (Italian)', 'Selects every <i>p</i> element that is the last child of its parent', 'Selects every <i>p</i> element that is the last <i>p</i> element of its parent', 'Selects all unvisited links', 'Selects every element that is not a <i>p</i> element', 'Selects every <i>p</i> element that is the second child of its parent', 'Selects every <i>p</i> element that is the second child of its parent, counting from the last child', 'Selects every <i>p</i> element that is the second <i>p</i> element of its parent, counting from the last child', 'Selects every <i>p</i> element that is the second <i>p</i> element of its parent', 'Selects every <i>p</i> element that is the only <i>p</i> element of its parent', 'Selects every <i>p</i> element that is the only child of its parent', 'Selects input elements with no "required" attribute', 'Selects input elements with a value outside a specified range', 'Selects input elements with the "readonly" attribute specified', 'Selects input elements with the "readonly" attribute NOT specified', 'Selects input elements with the "required" attribute specified', 'Selects the document\'s root element', 'Selects the portion of an element that is selected by a user', 'Selects the current active #news element (clicked on a URL containing that anchor name)', 'Selects all input elements with a valid value', 'Selects all visited links'];
      var options = "";
      for (var i = 0; i < selectorValue.length; i++) {
          options += '<option value=\''+selectorValue[i]+'\'>'+ selectorValue[i] + " - " + selectorDecription[i]+'</option>';   
      }
      // Setup associated functions 
      var functions = "$('#titan-modal-selector-select').change(function(){"
                    + "$('#result-window').html($('#titan-modal-selector-select').val());"
                    + "$('#result-window').css('border', '2px solid #06C');"
                    + "});";
     // Setup final submit
     var submit = "editor.insert($('#result-window').html());";
     // Assign Data
     var data = {
         title:"CSS Selector Library",
         content: '<label> Pick Selector: </label><select id="titan-modal-selector-select" class="form-control">'+options+'</select>',
         selectTwo: ["titan-modal-selector-select"],
         functions: functions,
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data); 
   }); 
  // Insert Animation Reference
  $("#titan-elements-advanced-insert-animation").click(function(){ 
      // Setup select array
      var animations = ["none", "newspaper-in", "zoom-in", "swipe-top-in"];
      var options = "";
      for (var i = 0; i < animations.length; i++) {
          options += '<option>'+animations[i]+'</option>';   
      }
      // Setup associated functions 
      var functions = "$('#titan-modal-animation-select').change(function(){"
                    + "$('#result-window').html('animation:TEA-' + $('#titan-modal-animation-select').val() + ' 1s linear .1s forwards;');"
                    + "$('#result-window').css('border', '2px solid #06C');"
                    + "});";
     // Setup final submit
     var submit = "editor.insert($('#result-window').html());";
     // Assign Data
     var data = {
         title:"Animation Library",
         content: '<label> Select Animation: </label><select id="titan-modal-animation-select" class="form-control">'+options+'</select>',
         selectTwo: ["titan-modal-animation-select"],
         functions: functions,
         submit: submit
        };
    // Load Modal   
    titanElementsDrawModal(data);
   });
  // Insert copy of inline styles
  $("#titan-elements-advanced-insert-inline-css").click(function(){
	 if($("#titan-preview").attr('style')){
    editor.insert(".class {\n    "+$("#titan-preview").attr('style').replace(/;/g, ";\n   ")+"}\n");
	 } else {
		toastr.error("No inline styles found!"); 
	 }
  });
 // Insert a basic CSS block 
  $("#titan-elements-advanced-insert-basics").click(function(){
    editor.insert(".class {\n    color:#333;\n    background-color:#f6f6f6;\n    padding:20px;\n    margin:0px;\n    border:1px solid #eee\n}\n");
  });
  
/***** JS ******/
 // Insert JS - Insert document.ready
  $("#titan-elements-advanced-insert-js-ready").click(function(){
    editor.insert("jQuery( document ).ready(function($) { \n\n\n });");
  });
   // Insert JS - Insert click
  $("#titan-elements-advanced-insert-js-click").click(function(){
    editor.insert(" $('#id').click(function(){ \n\n\n });");
  });
   // Insert JS - Insert Function
  $("#titan-elements-advanced-insert-js-function").click(function(){
    editor.insert("var name = function() { \n\n\n }");
  });
   // Insert JS - Insert loop
  $("#titan-elements-advanced-insert-js-loop").click(function(){
    editor.insert("for(var i = 0; i > array.length; i++){ \n\n\n }");
  });
  
} // Reactivate button actions

// Apply Once
 titanAdvancedMenuInit();
 
 /* ######  Extra Advanced Menu Helpers ###### */ 
// HTML Font-Awesome Dynamic Selectbox Template
function titanHTMLFormatFA (state) {
if (!state.id) { return state.text; }
var $state = $(
'<span><i class="' + state.element.value.toLowerCase() + '"></i> ' + state.text + '</span>'
);
return $state;
}
// HTML Generate Bootstrap Grid
var titanModalGridGenerate = function(){
    var rows = $("#titan-modal-row").val();
    var columns = $("#titan-modal-column").val();
    var size = $("#titan-modal-breakpoint-select").val();
    var content = "";
    content += '<div class="container">';
    for (var r = 0; r < rows; r++) {
        content += '<div class="row">';
        for (var c = 0; c < columns; c++) {
            content += '<div class="col-'+size+'-'+(12/columns)+'"></div>';
        }
        content += "</div>"
    } 
    content += "</div>"
    return content.replace(/>/g, '>\n');
}

/* ######  Titan Modal ###### */ 
  /* Draw Modal  */
  var titanElementsDrawModal = function(data){
     var drawModal = "";
      drawModal += '<div id="titan-popup-modal" style="position:fixed; left:0px; right:0px;top:0px;bottom:0px;background:rgba(0,0,0,.2);z-index:100;">';
      drawModal += '<div style="position: relative;top: 50%;left: 50%;background:#fff;transform:translate(-50%,-50%);max-width:300px;padding:20px">';
      drawModal += '<span style="font-size:25px">'+data.title+'</span>';
      drawModal += '<div style="padding:10px">';
      drawModal +=  data.content;
      drawModal += '</div><label>Output:</label><div id="result-window" style="padding:10px;margin:10px;"> </div><div style="text-align:center">';
      drawModal += '<button id="titan-modal-cancel" class="btn btn-default titan-inline-block" ><i class="fa fa-ban"></i> Cancel </button>';
      drawModal += '<span> &nbsp;&nbsp; </span>';
      drawModal += '<button id="titan-modal-insert" class="btn btn-primary titan-inline-block" ><i class="fa fa-hand-o-down"></i> Insert </button>';
      drawModal += '</div></div></div>';
      // Execute draw
      $( "body" ).append( drawModal );
      // Custom Functions
      if(data.functions){
      eval(data.functions);
      }
      // Initialize select 2 boxes
      if(data.selectTwo){
       for (var i = 0; i < data.selectTwo.length; i++) {
           if(data.selectTwo[i] == "titan-modal-font-awesome-select"){
           $("#"+data.selectTwo[i]).select2({
                templateResult: titanHTMLFormatFA
            });
           } else {
           $("#"+data.selectTwo[i]).select2();
           }          
       }   
      }
      // Modal Cancel button
      $("#titan-modal-cancel").click(function(){
          $( "#titan-popup-modal" ).remove();
      });
      // Modal Insert Button
      $("#titan-modal-insert").click(function(){
          eval(data.submit); // Final purpose for modal
          $( "#titan-popup-modal" ).remove();
      });
  }
}); // Document Ready