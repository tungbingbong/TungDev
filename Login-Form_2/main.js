const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

function Validator(formSelector) {
    var _this = this;
    var formRules = {};

    function getParent(element, selector) {

        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }


    /**
     * Convention create rules:
     * - If have mistakes, return `error message`
     * - If have not, return `undefined`
     */
    var validatorRules = {
        required: function(value) {
            return value ? undefined : `Please enter this form`
        },
        email: function(value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : `Please enter true email's form`
        },
        min: function(min) {
            return function(value) {
                return value.length >= min ? undefined : `Please enter at least ${min} characters`
            }
        },
        max: function(max) {
            return function(value) {
                return value.length >= max ? undefined : `Please enter at least ${max} characters`
            }
        },
    };
    // Get form element from DOM follow `formSelector`
    var formElement = document.querySelector(formSelector);

    // Only handle when have element in DOM
    if (formElement) {
        var inputs = formElement.querySelectorAll('[name][rules]');

        for (var input of inputs) {
            var rules = input.getAttribute('rules').split('|');

            for (var rule of rules) {

                var ruleInfo;
                var isRuleHasValue = rule.includes(':');

                if (isRuleHasValue) {
                    ruleInfo = rule.split(':');
                    rule = ruleInfo[0];
                }


                var ruleFunc = validatorRules[rule];

                if (isRuleHasValue) {
                    ruleFunc = ruleFunc(ruleInfo[1]);
                }

                if (Array.isArray(formRules[input.name])) {
                    formRules[input.name].push(ruleFunc);
                } else {
                    formRules[input.name] = [ruleFunc];
                }
            }

            // Listen the event to validate (blur, change, .....)
            input.onblur = handleValidate;
            input.oninput = handleClearMessages;
        }

        // Function validate errors
        function handleValidate(event) {
            var rules = formRules[event.target.name];
            var errorMessage;

            for (var rule of rules) {
                errorMessage = rule(event.target.value);
                if (errorMessage) break;
            }

            if (errorMessage) {
                var formGroup = getParent(event.target, '.form-group');
                if (formGroup) {
                    formGroup.classList.add('invalid');
                    var formMessage = formGroup.querySelector('.form-message');
                    if (formMessage) {
                        formMessage.innerText = errorMessage;
                    }
                }
            }


            return !errorMessage;
        }

        // Function clear errors
        function handleClearMessages(event) {
            var formGroup = getParent(event.target, '.form-group');
            if (formGroup.classList.contains('invalid')) {
                formGroup.classList.remove('invalid');

                var formMessage = formGroup.querySelector('.form-message');
                if (formMessage) {
                    formMessage.innerText = '';
                }
            }
        }
    }




    // Handle behavior defaults when enter on button submit form 
    formElement.onsubmit = function(event) {
        event.preventDefault();



        var isValid = true;
        var inputs = formElement.querySelectorAll('[name][rules]');

        for (var input of inputs) {
            if (!handleValidate({ target: input })) {
                isValid = false;
            }
        }

        // if not detect errors then submit form
        if (isValid) {

            if (typeof _this.onSubmit === 'function') {
                var enableInputs = formElement.querySelectorAll('[name]:not([disabled])');

                var formValues = Array.from(enableInputs).reduce(function(values, input) {

                    switch (input.type) {
                        case 'radio':
                            values[input.name] = formElement.querySelector('input[name="' + input.name + '"]:checked').value;
                            break;
                        case 'checkbox':
                            if (!input.matches(':checked')) {
                                values[input.name] = '';
                                return values;
                            }
                            if (!Array.isArray(values[input.name])) {
                                values[input.name] = [];
                            }
                            values[input.name].push(input.value);
                            break;
                        case 'file':
                            values[input.name] = input.files;
                            break;
                        default:
                            values[input.name] = input.value;
                    }

                    return values;
                }, {});

                // Re-call onSubmit function and return value of form
                _this.onSubmit(formValues);
            } else {
                formElement.submit();
            }
        }
    }

}