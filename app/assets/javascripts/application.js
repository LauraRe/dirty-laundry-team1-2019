// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('turbolinks:load', () => {
    const subscriptionForm = document.getElementById('subscription_form')

    if (subscriptionForm) {
        const stripe = Stripe('pk_test_uC6X9Rshj8WCjuGBfN9o9HvT')
        const elements = stripe.elements()
        const card = elements.create('card', {hidePostalCode: true})

        card.mount('#card_element')

        subscriptionForm.addEventListener('submit', (event) => {
            event.preventDefault();
            stripe.createToken(card).then(result => {
                const hiddenInput = document.createElement('input')
                hiddenInput.setAttribute('type', 'hidden')
                hiddenInput.setAttribute('name', 'stripeToken')
                hiddenInput.setAttribute('value', result.token.id)
                subscriptionForm.appendChild(hiddenInput)

                subscriptionForm.submit
            })
        })
    }
}) 
