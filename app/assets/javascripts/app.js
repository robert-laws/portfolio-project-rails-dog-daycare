


function makeAlert(obj) {
  var id_val = obj.value
  var duration_id = "duration_id_" + id_val
  var duration_input = document.getElementById(duration_id)
  if (obj.checked) {
    duration_input.disabled = false
    duration_input.value = "30"
  } else {
    duration_input.value = ""
    duration_input.disabled = true
  }    
}