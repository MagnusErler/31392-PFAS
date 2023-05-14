document.addEventListener("DOMContentLoaded", function() {
  var versions = [
      //['4.8.0-pre', '/4.x'],
      ['4.7.0-dev', '/4.x'],
      ['5.0.0-pre', '/5.x'],
      ['4.7.0', '/4.7.0'],
      ['4.6.0', '/4.6.0'],
      ['4.5.5', '/4.5.5'],
      ['4.5.4', '/4.5.4'],
      ['4.5.3', '/4.5.3'],
      ['4.5.2', '/4.5.2'],
      ['4.5.1', '/4.5.1'],
      ['4.5.0', '/4.5.0'],
      ['4.4.0', '/4.4.0'],
      ['4.3.0', '/4.3.0'],
      ['4.2.0', '/4.2.0'],
      ['4.1.2', '/4.1.2'],
      ['4.1.1', '/4.1.1'],
      ['4.1.0', '/4.1.0'],
      ['4.0.1', '/4.0.1'],
      ['4.0.0', '/4.0.0'],
      //['3.4.20-pre', '/3.4'],
      ['3.4.19-dev', '/3.4'],
      ['3.4.19', '/3.4.19'],
      ['3.4.18', '/3.4.18'],
      ['3.4.17', '/3.4.17'],
      ['3.4.16', '/3.4.16'],
      ['3.4.15', '/3.4.15'],
      ['3.4.14', '/3.4.14'],
      ['3.4.13', '/3.4.13'],
      ['3.4.12', '/3.4.12'],
      ['3.4.11', '/3.4.11'],
      ['3.4.10', '/3.4.10'],
      ['3.4.9', '/3.4.9'],
      ['3.4.8', '/3.4.8'],
      ['3.4.7', '/3.4.7'],
      ['3.4.6', '/3.4.6'],
      ['3.4.5', '/3.4.5'],
      ['3.4.4', '/3.4.4'],
      ['3.4.3', '/3.4.3'],
      ['3.4.2', '/3.4.2'],
      ['3.4.1', '/3.4.1'],
      ['3.4.0', '/3.4.0'],
      ['3.3.1', '/3.3.1'],
      ['3.3.0', '/3.3.0'],
      ['3.2.0', '/3.2.0'],
      ['3.1.0', '/3.1.0'],
      ['3.0.0', '/3.0.0'],
  ];
  var h = '<select>';
  var current_ver = $("#projectnumber")[0].innerText || versions[0][0];
  for (i = 0; i < versions.length; i++) {
      selected = ''
      if(current_ver === versions[i][0])
          selected = ' selected="selected"';
      h += '<option value="' + versions[i][0] + '"' + selected + '>' + versions[i][0] + '</option>';
  }
  h += '</select>';
  $("#projectnumber")[0].innerHTML = h;
  $("#projectnumber select")[0].addEventListener('change', function() {
      var v = $(this).children('option:selected').attr('value');
      var path = undefined;
      for (i = 0; i < versions.length; i++) {
          if(v === versions[i][0]) {
              path = versions[i][1];
              break;
          }
      }
      if (path) {
          var location = window.location;
          var url = location.href;
          var new_url = url.replace(window.location.hostname + '/' + current_ver,
                                    window.location.hostname + path);
          if (url == new_url) {
              var current_ver = /\/[^\/]+/.exec(location.pathname)
              new_url = url.replace(window.location.hostname + current_ver,
                                    window.location.hostname + path);
          }
          console.log(new_url);
          if (url != new_url)
              window.location.href = new_url; // navigate
      }
  });
  return current_ver;
});
