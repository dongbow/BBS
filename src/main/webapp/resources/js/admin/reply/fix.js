var $modalElement = this.$element;  
$(document).on('focusin.modal', function (e) {  
    var $parent = $(e.target.parentNode);  
    if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length  
            // add whatever conditions you need here:  
        &&  
        !$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {  
        $modalElement.focus()  
    }  
}) 