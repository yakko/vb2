$ ->
  
  $("input[type='number']").addClass         "input input-value input-number"
  
  $("input[type='text'], textarea").addClass "input input-value input-text"
  $("input[type='password']").addClass       "input input-value input-text input-password"
  
  $("select").addClass                       "input input-value input-select"
  $("input[type='radio']").addClass          "input input-value input-radio"
  $("input[type='checkbox']").addClass       "input input-value input-checkbox"
  
  $("input[type='submit']").addClass         "input input-submit"
  $("input[type='button']").addClass         "input input-submit input-button"
  $("input[type='image']").addClass          "input input-submit input-image"
