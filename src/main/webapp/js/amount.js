// Función de validación personalizada para números decimales
function validateDecimal(input) {
  // Expresión regular para validar el formato decimal(8,2)
  var regexDecimal = /^\d{0,6}(\.\d{1,2})?$/;
  
  if (!regexDecimal.test(input.value)) {
    input.setCustomValidity('Por favor, ingrese un número decimal válido (máximo 8 dígitos, 2 decimales).');
  } else {
    input.setCustomValidity('');
  }
}

// Validar el campo de cantidad (amount) al cambiar su valor
amountInput.addEventListener('input', function() {
  validateDecimal(amountInput);
});