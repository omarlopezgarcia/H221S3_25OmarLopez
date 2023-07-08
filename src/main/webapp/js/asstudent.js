// Activar las validaciones de Bootstrap en el formulario
(function () {
  'use strict';

  // Obtener el formulario a validar
  var form = document.querySelector('.needs-validation');

  // Obtener los campos de nombre y apellido
  var namesInput = form.querySelector('#frmNames');
  var last_nameInput = form.querySelector('#frmLast_name');
  var document_typeInput = form.querySelector('#frmDocument_type');
  var document_numberInput = form.querySelector('#frmDocument_number');
  var careerInput = form.querySelector('#frmCareer');
  var semesterInput = form.querySelector('#frmSemester');
  var titleInput = form.querySelector('#frmTitle');
  var amountInput = form.querySelector('#frmAmount');
  var activeInput = form.querySelector('#frmActive');

  // Expresión regular para validar letras, espacios y caracteres acentuados
  var regexLettersWithSpace = /^[A-Za-z\u00C0-\u017F\s]+$/;
  // Expresión regular para validar números y longitud
  var regexNumbers = /^\d+$/;

  // Función de validación personalizada para letras, espacios y caracteres acentuados
  function validateLettersWithSpace(input) {
    if (!regexLettersWithSpace.test(input.value)) {
      input.setCustomValidity('Por favor, ingrese solo letras, espacios y caracteres acentuados.');
    } else {
      input.setCustomValidity('');
    }
  }

  // Función de validación personalizada para números y longitud
  function validateNumbersLength(input, minLength, maxLength) {
    var value = input.value.trim();
    if (!regexNumbers.test(value) || value.length < minLength || value.length > maxLength) {
      input.setCustomValidity(`Por favor, ingrese solo números entre ${minLength} y ${maxLength} caracteres.`);
    } else {
      input.setCustomValidity('');
    }
  }

  // Validar los campos de nombre y apellido al cambiar su valor
  namesInput.addEventListener('input', function () {
    validateLettersWithSpace(namesInput);
  });

  last_nameInput.addEventListener('input', function () {
    validateLettersWithSpace(last_nameInput);
  });

  // Validar el campo de número de documento al cambiar su valor
  document_numberInput.addEventListener('input', function () {
    var selectedDocumentType = document_typeInput.value;
    if (selectedDocumentType === 'DNI') {
      validateNumbersLength(document_numberInput, 8, 8);
    } else if (selectedDocumentType === 'CNE') {
      validateNumbersLength(document_numberInput, 6, 9);
    } else {
      // Si no se selecciona un tipo de documento válido, no se aplican restricciones de longitud
      document_numberInput.setCustomValidity('');
    }
  });

  // Validar el formulario al intentar enviarlo
  form.addEventListener('submit', function (event) {
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    }

    form.classList.add('was-validated');
  }, false);
})();
