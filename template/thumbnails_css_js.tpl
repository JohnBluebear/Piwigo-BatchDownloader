{html_style}
.thumbnails  .wrap1 {ldelim} position:relative; }
.wrap1 .removeSet {ldelim} width:100%;height:16px;display:none;position:absolute;top:0;background:rgba(0,0,0,0.8);padding:2px;border-radius:2px;font-size:10px;z-index:100;color:#eee;white-space:nowrap; }
.wrap1:hover .removeSet {ldelim} display:block; 
{/html_style}

{footer_script require='jquery'}
jQuery(".removeSet").click(function() {ldelim}
  var toggle_id = jQuery(this).data("id");
  var $trigger = jQuery(this);
  
  jQuery.ajax({ldelim}
    type: "POST",
    url: "{$BATCH_DOWNLOAD_PATH}remove_image.php",
    data: {ldelim} "set_id": "{$SET_ID}", "toggle_id": toggle_id }
  }).done(function(msg) {ldelim}
    if (msg == "false") {ldelim}
      $trigger.parent(".wrap1").hide("fast", function() {ldelim} $trigger.remove() });
      jQuery(".nbImagesSet").html(parseInt(jQuery(".nbImagesSet").html()) -1);
    } else {ldelim}
      $trigger.html('{'Un unknown error occured'|@translate}');
    }
  });
  
  return false;
});
{/footer_script}