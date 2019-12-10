class ConfirmationMailer < ActionMailer::Base
    def confirm_email(target_email, activation_token)
        @activation_token = activation_token
        mail(to:target_email,
            body: "http//localhost:3000/sessions/#{@activation_token}/edit",
            content_type: "text/html",
            subject: "Test Confirmation!",
            template_path: "confirmation_mailer",
            template_name: "confirm_email")
    end
end