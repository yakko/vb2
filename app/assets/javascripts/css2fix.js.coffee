$ ->
  
  $("input[type='number']").addClass         "input-value input-number"
  
  $("input[type='text'], textarea").addClass "input-value input-text"
  $("input[type='password']").addClass       "input-value input-text input-password"
  
  $("select").addClass                       "input-value input-select"
  $("input[type='radio']").addClass          "input-value input-radio"
  $("input[type='checkbox']").addClass       "input-value input-checkbox"
  
  $("input[type='submit']").addClass         "input-submit"
  $("input[type='button']").addClass         "input-submit input-button"
  $("input[type='image']").addClass          "input-submit input-image"
