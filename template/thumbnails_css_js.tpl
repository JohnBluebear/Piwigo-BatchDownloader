{html_style}
#thumbnails li {ldelim} position:relative !important;display:inline-block; }
li .removeSet {ldelim} width:100%;height:16px;display:none;position:absolute;top:0;background:rgba(0,0,0,0.8);padding:2px;border-radius:2px;font-size:10px;z-index:100 !important;color:#eee;white-space:nowrap; }
li:hover .removeSet {ldelim} display:block !important; }
{/html_style}

{footer_script require='jquery'}
jQuery(".removeSet").click(function() {ldelim}
  var toggle_id = jQuery(this).data("id");
  var $trigger = jQuery(this);
  
  jQuery.ajax({ldelim}
    type: "POST",
    url: "{$ROOT_URL}index.php",
    data: {ldelim}
      action: "bd_remove_image",
      set_id: "{$SET_ID}",
      toggle_id: toggle_id
    },
    success: function(msg) {ldelim}
      if (msg == "ok") {ldelim}
        $trigger.parent("li").hide("fast", function() {ldelim}
          jQuery(this).remove();
          if (typeof GThumb != "undefined") GThumb.build();
        });
        
        jQuery(".nbImagesSet").html(parseInt(jQuery(".nbImagesSet").html()) -1);
      } else {ldelim}
        $trigger.html('{'Un unknown error occured'|@translate}');
      }
    },
    error: function() {ldelim}
      $trigger.html('{'Un unknown error occured'|@translate}');
    }
  });
  
  return false;
});
{/footer_script}