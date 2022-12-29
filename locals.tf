locals {
    verification_message_with_code = lookup(var.verification_message_template, "default_email_option", "CONFIRM_WITH_CODE") == "CONFIRM_WITH_CODE"
    verification_message_with_link = lookup(var.verification_message_template, "default_email_option", "CONFIRM_WITH_CODE") == "CONFIRM_WITH_LINK"
    email_subject = "Your verification code"
    email_message = "{username}, your verification code is `{####}`"
    email_subject_by_link = "Your verification link"
    email_message_by_link = "Please click the link below to verify your email address. {##Verify Email##}"
    sms_message = "Your username is {username} and temporary password is `{####}`"
}