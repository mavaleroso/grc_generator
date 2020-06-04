var x, i, j, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /* For each element, create a new DIV that will act as the selected item: */
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /* For each element, create a new DIV that will contain the option list: */
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /* For each option in the original select element,
    create a new DIV that will act as an option item: */
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /* When an item is clicked, update the original select box,
        and the selected item: */
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
    /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
    e.stopPropagation();
    closeAllSelect(this);
    this.nextSibling.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });
}



function closeAllSelect(elmnt) {
  /* A function that will close all select boxes in the document,
  except the current select box: */
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);



var base_url = $('#base-url').val();

var qrcode = new QRCode(document.getElementById("qrcode"), {
    width : 165,
    height : 165
});

$('#generate-btn').on('click', function() {
    var division = $('#division option:selected');
    var section = $('#section option:selected');
    var classification = $('#classification option:selected');
    var sclass = $('#sub-class option:selected');
    var yearMonth = $('.year-month');
    var qrtext = $('#qr-text');
    var qrerror = $('.qr-error');

    if (division.val() == 'OTHERS') {
      if(yearMonth.val() == '') {
        qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Year & Month field is required!</p>');
      } else {
        make_qr_code(qrerror, qrtext, division.val(), section.val(), classification.val(), sclass.val());
      }
    } else {
      if (division.val() == 0 || classification.val() == 0) {
        if (division.val() == 0 && classification.val() != 0) {
          if (section.val() == 0 && yearMonth.val() != '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Division, Section and Sub-classification fields are required!</p>');
          } else if(section.val() == 0 && yearMonth.val() == '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Division, Section, Sub-classification and Year & Month fields are required!</p>');
          } else {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Division field is required!</p>');
          }
        } else if (classification.val() == 0 && division.val() != 0) {
          if (sclass.val() == 0 && yearMonth.val() != '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section, Classification and Sub-classification fields are required!</p>');
          } else if (sclass.val() == 0 && yearMonth.val() == '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section, Classification, Sub-classification and Year & Month fields are required!</p>');
          }else {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Classification field is required!</p>');
          }
        } else {
          if (yearMonth.val() != '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Division, Section, Classification, and Sub-classification fields are required!</p>');
          } else {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>All fields are required!</p>');
          }
        }
      } else if (section.val() == 0 || sclass.val() == 0) {  
        if (section.val() == 0 && sclass.val() != 0 && yearMonth.val() != '') {
          qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section field is required!</p>');
        } else if (section.val() == 0 && sclass.val() != 0 && yearMonth.val() == '') {
          qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section and Year & Month fields are required!</p>');
        } else if (sclass.val() == 0 && section.val() != 0 && yearMonth.val() != '') {
          qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Sub-classification field is required!</p>');
        } else if (sclass.val() == 0 && section.val() != 0 && yearMonth.val() == '') {
          qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Sub-classification and Year & Month fields are required!</p>');
        } else {
          if (yearMonth.val() != '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section and Sub-classification fields are required!</p>');
          } {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Section, Sub-classification, and Year & Month fields are required!</p>');
          }
        }
      } else {
          if (yearMonth.val() == '') {
            qrerror.html('<p><i class="fas fa-exclamation-circle"></i>Year & Month field is required!</p>');
          } else {
            make_qr_code(qrerror, qrtext, division.val(), section.val(), classification.val(), sclass.val());
          }
      }
    }
    
});

function make_qr_code(errField, txtField, div, sec, classi, sclass) {
  let code = null;
 
  errField.empty();

  if (div == 'OTHERS') {
    code = '16-'+div+'-XXXX-X-XXXX-XXXX-XXX-000001';
  } else {
    code ='16-'+div+'-'+sec+'-'+classi+'-'+sclass+'-'+year_month()+'-000001';
  }
  txtField.text(code);
  qrcode.makeCode(code);


  setTimeout(function () {
    var c = document.getElementById('qr-canvas');
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, c.width, c.height);
    var dataURL = $('#qrcode img')[0].src;
    ctx.font = "bold 15px Arial";
    ctx.fillText(code, 14, 200);

    var imageObj = new Image();
    imageObj.onload = function() {
      ctx.drawImage(this, 67, 10);
    };

    imageObj.src = dataURL;

    $('.download-btn').attr('disabled', false);
  }, 1000);
}

$('#download-btn').on('click', function() {
  var qrCanvas = document.getElementById('qr-canvas');
  var qrtext = $('#qr-text').text() + '.png';
  if (window.navigator.msSaveBlob) {
      window.navigator.msSaveBlob(qrCanvas.msToBlob(), qrtext);
  } else {
    const a = document.createElement('a');
    document.body.appendChild(a);
    a.href = qrCanvas.toDataURL();
    a.download = qrtext;
    a.click();
    document.body.removeChild(a);
  }
});


$('.custom-select').click(function() {
    let id = $(this).children().attr('id');
    let div = $('#division option:selected');
    let classification = $('#classification option:selected').data('id');

    if (id == 'division') {
        fetch_section(div.data('id'));
        if (div.val() == 'OTHERS') {
          $('#classification').val(0);
          $('.classification .select-selected').text("Select Section:");
          $('.classification .select-items div').removeClass('same-as-selected');
          fetch_classification(classification);
        }
    } else if (id == 'classification') {
        fetch_classification(classification);
    }
});

function fetch_section(div) {
  let section = $('#section');
  let select_items = $('.section .select-items');
  let select_selected = $('.section .select-selected');

  $.ajax({
    url: base_url + 'models/fetch_data.php?qr=fetch_sections',
    type: 'get',
    dataType: 'json',
    data: {div:div},
    success: function(data) {
        section.empty();
        select_items.empty();
        section.append('<option value="0">Select Section:</option>');
        select_selected.text('Select Section:');
        $.each(data, function(k, v) {
          section.append('<option data-id="'+v.sec_id+'" value="'+v.sec_code+'">'+v.sec_description+'</option>');
          select_items.append('<div onclick="section(this,\''+v.sec_description+'\', \''+v.sec_code+'\')">'+v.sec_description+'</div>');
        });
    },
    error: function() {
        console.error('Error in fetching sections!');
    }
  })
}

function fetch_classification(classification) {
  let sclass = $('#sub-class');
  let select_items = $('.sub-class .select-items');
  let select_selected = $('.sub-class .select-selected');

  $.ajax({
    url: base_url + 'models/fetch_data.php?qr=fetch_sclassification',
    type: 'get',
    dataType: 'json',
    data: {classification: classification},
    success: function(data) {
      sclass.empty();
      select_items.empty();
      sclass.append('<option value="0">Select Sub-category:</option>');
      select_selected.text('Select Sub-class:');
      $.each(data, function(k, v) {
        sclass.append('<option data-id="'+v.sclass_id+'" value="'+v.sclass_code+'">'+v.sclass_description+'</option>');
        select_items.append('<div onclick="sclass(this, \''+v.sclass_description+'\', \''+v.sclass_code+'\')">'+v.sclass_description+'</div>');
      });
    },
    error: function() {
      console.error('Error in fetching categories!');
    }
  })
}

function section(THIS, description, value) {
  var select_selected = $('.section .select-selected');
  select_selected.text(description);
  $('#section').val(value);
  $('.section .select-items div').removeClass('same-as-selected');
  $(THIS).addClass('same-as-selected');
}

function sclass(THIS, description, value) {
  var select_selected = $('.sub-class .select-selected');
  select_selected.text(description);
  $('#sub-class').val(value);
  $('.sub-class .select-items div').removeClass('same-as-selected');
  $(THIS).addClass('same-as-selected');
}


function year_month() {
  let str = $('.year-month').val();
  let year_month = str.split(' ');
  var month = year_month[0];
  var year = year_month[1];
  var newMonth = month.substring(0, 3);

  var dateStr = year + "-" + newMonth.toUpperCase();

  return dateStr;
}


$('.date-picker').datepicker( {
  changeMonth: true,
  changeYear: true,
  showButtonPanel: true,
  dateFormat: 'MM yy',
  onClose: function(dateText, inst) { 
      function isDonePressed(){
          return ($('#ui-datepicker-div').html().indexOf('ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all ui-state-hover') > -1);
      }

      if (isDonePressed()){

          var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
          var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
          $(this).datepicker('setDate', new Date(year, month, 1));

      }
  }
});
