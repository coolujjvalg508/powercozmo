require 'rake'
namespace :db do
	task :system_emails => :environment do
		system_emails = [
{title: "Registration email to user when registered through registration.",	
subject: "Welcome to PowerCozmo",
status: 1,
content: "<p>Hello ::USER_NAME::,</p>

<p>Thank you for registering with PowerCozmo.com. Please click on below link to activate your account.</p>

<p>::REGISTRATION_CONFIRMATION_LINK::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{
title: "Forgot password email to user received when submitted email from forgot password.",
subject: "Password Reset Request",
status: 1,
content: "<p>Hello ::USER_NAME::,</p>

<p>We have received a password reset request from your account. Please click below link to reset your password.</p>

<p>::RESET_PASSWORD_LINK::</p>

<p>Please ignore this email, If you have not requested this.</p>


<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to admin if a new contact us request is received through contact us form.",
subject: "A new contact request received from ::CONTACT_NAME::",
    content: "<p>Hello <strong>::ADMIN_USER_NAME::</strong>,</p>

<p>You have received a contact request from <strong>::CONTACT_NAME::</strong>. Please find below details.</p>
<p>Subject: <strong>::CONTACT_SUBJECT::</strong></p>
<p>Name: <strong>::CONTACT_NAME::</strong></p>
<p>Email: <strong>::CONTACT_EMAIL::</strong></p>
<p>phone: <strong>::CONTACT_PHONE::</strong></p>
<p>Message: <strong>::CONTACT_REPORT_MESSAGE::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Posted a buying request email sent to admin.',
subject: "New posted buying request.",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::REQUESTER_NAME::</strong> has post Buying request <strong>::BUYING_REQUEST_NAME::</strong> under category <strong>::CATEGORY_NAME::</strong> Please check the content of post and make sure no contacts details mentioned on it, then approve this buying request in order to be live in site and seller dashboard, please notify our sales engineers about this request to start search for suppliers.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'An Email to requester once post request (before admin approval)',
subject: "We got Your buying request for ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::REQUESTER_NAME::</strong></p>

<p>Thank you for your posting <strong>::BUYING_REQUEST_NAME::</strong>, Power Cozmo team will review your post and give You the approval to be live in site within less than 6 hours, you will receive notification Email once your request become live. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'An Email to buying requester after approving request.',
subject: "We got Your buying request for ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::REQUESTER_NAME::</strong></p>

<p>Congratulations! Your post for <strong>::BUYING_REQUEST_NAME::</strong> is live now for hundreds of verified sellers and suppliers worldwide, also sales engineers from Power Cozmo will start working in your request immediately to source out your requirements, we will forward to your proposals once we receive it from sellers. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'An email after buying request approved by admin to all sellers.',
subject: "New buying request.",
status: 1,
content: "<p>HELLO</p>

<p>New opportunity! <strong>::REQUESTER_NAME::</strong> has posted a Buying request <strong>::BUYING_REQUEST_NAME::</strong> under category <strong>::CATEGORY_NAME::</strong> Please check the detail description of this proposal via website or by your dashboard and write to us your proposal if you have interest in this job before expired on <strong>::DATE_OF_EXPIERY::</strong>.</p>

<p>You can check the detail of this request from this link:</p>

<p>::LINK_TO_BUYING_REQUESTS_URL::</p>

<p>Or from your dashboard under buying request filed, you can request for more information or click on submit proposal To send buyer your proposal.</p>

<p>::LINK_TO_SELLER_BUYING_REQUESTS_URL::</p>

<p>&nbsp;</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong><br />
&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'An Email to Admin after Proposal submission by seller on a buying request.',
subject: "New posted proposal.",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::SELLER_NAME::</strong> has post proposal for <strong>::BUYING_REQUEST_NAME::</strong> under category <strong>::CATEGORY_NAME::</strong> Please check the content of proposal and make sure no contacts details mentioned on it, then approve this proposal and forward it to buyer immediately, Please follow up with buyer for his feedback.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Seller name:&nbsp;<strong>::SELLER_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to seller after submission of proposal.',
subject: "We got Your proposal for ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong></p>

<p>We got your proposal for <strong>::BUYING_REQUEST_NAME::</strong>, We will review your proposal and share it immediately with potential buyer. You will get notification Email once we forwarded to <strong>::REQUESTER_NAME::</strong> A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'An Email to Seller after proposal submission to buyer.',
subject: "Your proposal for ::BUYING_REQUEST_NAME:: has been forwarded to buyer.",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong></p>

<p>Congratulations! your proposal for <strong>::BUYING_REQUEST_NAME::</strong> has been forwarded to <strong>::REQUESTER_NAME::</strong>, We will inform you once we got any feedback from <strong>::REQUESTER_NAME::</strong>. Power Cozmo will do their best to finalize this deal. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>User Id:&nbsp;<strong>::SELLER_EMAIL::</strong></p>

<p>Potently buyer Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:<strong> ::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>Offer price: <strong>::PRICE_OFFER::</strong></p>

<p>Currency:&nbsp;<strong>::CURRENCY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to buyer: Admin forwarding the proposal of seller on a buying request of buyer.',
subject: "Proposal for Your buying request for ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::REQUESTER_NAME::</strong></p>

<p>Sounds great! One of our registered sellers submit proposal for your buying request <strong>::BUYING_REQUEST_NAME::,</strong> Please check the proposal and back to us with your feedback. Power Cozmo will do best to converge views between you and seller, your fast response will help us to finish this deal. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>Offer price:&nbsp;<strong>::PRICE_CURRENCY::</strong></p>

<p>Proposal: <strong>::PROPOSAL_DESCRIPTION::</strong></p>

<p>Attachment:<strong>::ATTACHMENT_NAME::</strong><br />
&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to admin about request more information on a buying request of buyer.',
subject: "New RFI proposal.",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::SELLER_NAME::</strong> has request more information about <strong>::BUYING_REQUEST_NAME::</strong> under category <strong>::CATEGORY_NAME::</strong> Please check the content of request and make sure no contacts details mentioned on it, then approve this RFI and forward it to requester immediately, please follow up with buyer for his feedback.</p>

<p><strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Seller name:&nbsp;<strong>::SELLER_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>Message from seller :</p>

<p>::SELLER_RFI_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to seller after send RFI.",
subject: "We got Your RFI about ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong></p>

<p>We got your Request for more information regarding <strong>::BUYING_REQUEST_NAME::</strong>, and it forwarded to <strong>::REQUESTER_NAME::</strong>, We will inform you once we got any response. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Admin forwarding the seller's request more information on a buying request of buyer.",
subject: "Request for more information for ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::REQUESTER_NAME::</strong></p>

<p><strong>::SELLER_NAME::</strong>, one of our registered sellers requested more information for your buying request <strong>::BUYING_REQUEST_NAME::</strong>, Please check the Seller enquires below and back to us with your response asap. your fast response will help us to finish this deal. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>Seller name:&nbsp;<strong>::SELLER_NAME::</strong></p>

<p>Seller message:</p>

<p>::SELLER_RFI_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to seller after getting Reply from buyer for RFI.",
subject: "Response to your RFI about ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong></p>

<p>We got response from <strong>::REQUESTER_NAME::</strong>, for your Request for more information regarding <strong>::BUYING_REQUEST_NAME::</strong>,<strong> </strong>So please inform us if you still need any more information and do your best to submit your proposal asap. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>Seller name:&nbsp;<strong>::SELLER_NAME::</strong></p>

<p>Requester response message:</p>

<p>::REQUESTER_RESPONCE_MEASSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to sellers about near to expire buying request.",
subject: "Expired Soon -Buying request ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO!</p>

<p>We want to draw your attention that buying request <strong>::BUYING_REQUEST_NAME::</strong> will expire on <strong>::DATE_OF_EXPIERY::</strong>. So please submit your proposal before expiry date.</p>

<p>You can check the detail of this request from this link:</p>

<p>::LINK_TO_BUYING_REQUESTS_URL::</p>

<p>Or from your dashboard under buying request filed, you can request for more information or click on submit proposal To send buyer your proposal.</p>

<p>::LINK_TO_SELLER_BUYING_REQUESTS_URL::</p>

<p>&nbsp;</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name: <strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to Admin about near to expire buying request.",
subject: "Expired Soon -Buying request ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::BUYING_REQUEST_NAME::</strong> will expire on <strong>::DATE_OF_EXPIERY::</strong>, please try to submit proposal before expiry date.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to requester about buying request expiring.",
subject: "Your ::BUYING_REQUEST_NAME:: is expired now.",
status: 1,
content: "<p>HELLO <strong>::REQUESTER_NAME::</strong></p>

<p>Your buying request <strong>::BUYING_REQUEST_NAME::</strong>, Expired and it is not active now. if you still looking for proposal for your request please reply to this Email with your new expiry date to activate your buying request. Please print this page for your record.</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::DATE_OF_EXPIERY::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to sellers about Buying request expiry renewed by requester.",
subject: "extension of closed date for Buying request ::BUYING_REQUEST_NAME::",
status: 1,
content: "<p>HELLO!</p>

<p>We want to draw your attention that buying request <strong>::BUYING_REQUEST_NAME::</strong> closing date extended now. So please submit your proposal before new expiry date.</p>

<p>You can check the detail of this request from this link:</p>

<p>LINK_TO_BUYING_REQUESTS_URL</p>

<p>Or from your dashboard under buying request filed, you can request for more information or click on submit proposal To send buyer your proposal.</p>

<p>LINK_TO_SELLER_BUYING_REQUESTS_URL</p>

<p>&nbsp;</p>

<p>Name: <strong>::REQUESTER_NAME::</strong></p>

<p>E-mail: <strong>::REQUESTER_EMAIL::</strong></p>

<p>Country: <strong>::REQUESTER_COUNTRY::</strong></p>

<p>Buying request name:&nbsp;<strong>::BUYING_REQUEST_NAME::</strong></p>

<p>Expiration date: <strong>::NEW</strong>_<strong>DATE_OF_EXPIERY::</strong>.</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{
title: "Email to seller after successful of Listing new equipment.",
subject: "Congratulation! Your advertising is live now.",
status: 1,
content: "<p>Hello <strong>::SELLER_NAME::</strong></p>

<p>Thank you for listing your <strong>::ITEM_NAME::</strong> with power Cozmo. Now your advertising is live for thousands of buyers worldwide. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your records.</p>

<p>User name: <strong>::SELLER_NAME::</strong></p>

<p>User ID: <strong>::USER_EMAIL::</strong></p>

<p>Post Serial number: <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>Date of Submission: <strong>::POST_DATE::</strong></p>

<p>Expiry date : <strong>::EXPIRY_DATE::</strong></p>

<p>Category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Sub Category: <strong>::EQUIPMENT_SUBCATEGORY::</strong></p>

<p>Location: <strong>::EQUIPMENT_LOCATION::</strong></p>

<p>Asking Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team .</p>"
},
{title: "Email to buyer after posted a question on an equipment.",
subject: "We got Your Question for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong></p>

<p>Thank you for your interest in <strong>::ITEM_NAME::</strong>&nbsp;SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, You will get response for your question from seller asap. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN: <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Your Question to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to Buyer after posted offer on an equipment.",
subject: "We got Your offer for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong></p>

<p>Thank you for your interest in <strong>::ITEM_NAME::</strong> SN. <strong>::EQIPMENT_SERIALNUMBER::</strong>, You will get response for your offer from seller asap. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN: <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Your offered price: <strong>::OFFER_PRICE::</strong></p>

<p>Your Massage to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p><br />
&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to buyer after posted buying order on an equipment.",
subject: "We got Your Purchase request for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong></p>

<p>Thank you for your interest in <strong>::ITEM_NAME::</strong> SN. <strong>::EQIPMENT_SERIALNUMBER::</strong>, You will get response for your purchase request from seller asap. A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN: <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Your Massage to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p><br />
Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "An email to admin after posted a question on an equipment.",
subject: "New question for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::BUYER_NAME::</strong> has enquired on <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then share immediately with seller, please follow up with seller in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Massage to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "An email to admin after posted an offer on an equipment.",
subject: "New offer for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::BUYER_NAME::</strong> has bid on <strong>::ITEM_NAME::</strong> SN. <strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then share immediately with seller, please follow up with seller in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp; <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offered price: <strong>::OFFER_PRICE::</strong></p>

<p>Massage to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "An Email to admin after posted buying order on an equipment.",
subject: "New buying request for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong></p>

<p><strong>::BUYER_NAME::</strong> has sent buying request for <strong>::ITEM_NAME::</strong> SN. <strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then share immediately with seller and get the approval and start finalizing the deal, please follow up with seller in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>E-mail: <strong>::BUYER_EMAIL::</strong></p>

<p>Equipment name: <strong>::EQUIPMENT_NAME::</strong></p>

<p>SN: <strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Massage to seller:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to seller after admin approved a question on an equipment.",
subject: "New Question for your listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong>!</p>

<p>Sounds good! <strong>::BUYER_NAME::</strong> from <strong>::COUNTRY_NAME::</strong> has an interest on your listed <strong>::ITEM_NAME::</strong> SN. <strong>::EQIPMENT_SERIALNUMBER::</strong>, And looking for an answer for his enquiry / question exist below. Please login to your dashboard then go to question list and post your answer asap. Your fast response will help us to finish this deal.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Question from potential buyer:</p>

<p>::BUYER_MESSAGE_BODY::</p>

<p>Click on this link to log in to your account on Powercozmo.com.</p>

<p>::LINK_TO_USER_SIGN_IN_URL::</p>

<p>A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to seller after admin approved an offer on an equipment.",
subject: "New offer for your listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong>!</p>

<p>Sounds good! <strong>::BUYER_NAME::</strong> from <strong>::COUNTRY_NAME::</strong> has an interest on your listed <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, And has made a price offer for you with <strong>::OFFER_PRICE::</strong>. Please login to your dashboard then go to offer list to accept or reject the offer. Power Cozmo will do best to converge views between you and buyers, your fast response will help us to finish this deal.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offer price: <strong>::OFFER_PRICE::</strong></p>

<p>Message from potential buyer:</p>

<p><strong>::BUYER_MESSAGE_BODY::</strong></p>

<p>Click on this link to log in to your account on Powercozmo.com.</p>

<p>::LINK_TO_USER_SIGN_IN_URL::</p>

<p>A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to seller after admin approved buying order on an equipment.",
subject: "New buying request for your listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::SELLER_NAME::</strong>!</p>

<p>Sounds great! <strong>::BUYER_NAME:: </strong> from <strong>::COUNTRY_NAME:: </strong>has an interest on your listed <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, And has sent you buying request. Please login to your dashboard then go to offer list to accept or reject this request. Power Cozmo will do best to converge views between you and buyers, your fast response will help us to finish this deal.</p>

<p>Name: <strong>::BUYER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:<strong> ::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Message from potential buyer:</p>

<p><strong>::BUYER_MESSAGE_BODY::</strong></p>

<p>Click on this link to log in to your account on Powercozmo.com.</p>

<p>::LINK_TO_USER_SIGN_IN_URL::</p>

<p>A Power Cozmo representative will contact you in case of any raised enquiry. Please print this page for your record.</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to admin after seller answered a question on an equipment.",
subject: "Seller question answer for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong>!</p>

<p><strong>::SELLER_NAME::</strong> has answered to <strong>::BUYER_NAME::</strong> enquiry for <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then Forward immediately to the potential buyer, please follow up with potential buyer in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>User ID: <strong>::USER_EMAIL::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Seller Response:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::<br />
&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to admin after seller accepted an offer on an equipment.",
subject: "Seller accepted buyer offer for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong>!</p>

<p><strong>::SELLER_NAME::</strong> has accepted <strong>::BUYER_NAME::</strong> offer for <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then Forward immediately to the potential buyer, please follow up with him in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>User ID: <strong>::USER_EMAIL::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offer: <strong>::PRICE_OFFER::</strong></p>

<p>Status: <strong>Accepted</strong></p>

<p>Seller Response:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to admin after seller rejected an offer on an equipment.",
subject: "Seller rejected buyer offer for ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::ADMIN_USERNAME::</strong>!</p>

<p><strong>::SELLER_NAME::</strong> has rejected <strong>::BUYER_NAME::</strong> offer for <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>, Please check the content of message and make sure no contacts details mentioned on it, then Forward immediately to the potential buyer, please follow up with him in case of not getting answer within 24 hours.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>User ID: <strong>::USER_EMAIL::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offer: <strong>::PRICE_OFFER::.</strong></p>

<p><strong>Status: Rejected </strong></p>

<p>Seller Response:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: "Email to buyer after admin approved seller response on question on an equipment.",
subject: "Seller response to your question on listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong>!</p>

<p><strong>::SELLER_NAME:: </strong>has respond to your enquiry about <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>. The next step is to go to <strong>::ITEM_NAME::</strong> page and bid to this item or click on Buy to make buying request and start finalizing the deal. You can find <strong>::ITEM_NAME::</strong> again on website under <strong>::EQUIPMENT_CATEGORY:: , </strong>or search manually by name or serial number through website search engine.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:<strong> ::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Seller response:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to buyer after admin approved “seller acceptance offer” on an equipment.',
subject: "Seller accepted your offer for listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong>!</p>

<p>Congratulations! <strong>::SELLER_NAME:: </strong>has accepted your offer <strong>::OFFER_PRICE::</strong> for the <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>. A Power Cozmo representative will contact you soon to start finalize this deal.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:<strong> ::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offer price: <strong>::OFFER_PRICE::</strong></p>

<p>Status:&nbsp;&nbsp;<strong>Accepted</strong></p>

<p>Message from seller:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to buyer after admin approved “seller rejected an offer” on an equipment.',
subject: "Seller rejected your offer for listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong>!</p>

<p>Unfortunately, <strong>::SELLER_NAME:: </strong>has rejected your offer <strong>::OFFER_PRICE::</strong> for the <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>. so we asking you to bid again on <strong>::ITEM_NAME::</strong>, Power Cozmo will do best to converge views between you and buyers.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>Equipment name:<strong> ::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Offer price: <strong>::OFFER_PRICE::</strong></p>

<p>Status:&nbsp;<strong>Rejected</strong></p>

<p>Message from seller:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to buyer after admin approved “seller rejected buying request” on an equipment.',
subject: "Seller rejected your buying request for listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong>!</p>

<p>Unfortunately, <strong>::SELLER_NAME:: </strong>has rejected your buying order for the <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>. Power Cozmo will do best to converge views between you and buyers.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>Equipment name:<strong> ::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Status:&nbsp;<strong>Rejected</strong></p>

<p>Message from seller:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to buyer after admin approved “seller approved buying request” on an equipment.',
subject: "Seller approved your buying request for listed ::ITEM_NAME::",
status: 1,
content: "<p>HELLO <strong>::BUYER_NAME::</strong>!</p>

<p>Congratulations! <strong>::SELLER_NAME::</strong> has accepted your buying order for the <strong>::ITEM_NAME::</strong> SN.&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong>. A Power Cozmo representative will contact you soon to start finalize this deal.</p>

<p>Name: <strong>::SELLER_NAME::</strong></p>

<p>Equipment name:&nbsp;<strong>::EQUIPMENT_NAME::</strong></p>

<p>SN:&nbsp;<strong>::EQIPMENT_SERIALNUMBER::</strong></p>

<p>Equipment category: <strong>::EQUIPMENT_CATEGORY::</strong></p>

<p>Price: <strong>::EQUIPMENT_PRICE::</strong></p>

<p>Message from seller:</p>

<p>::SELLER_RESPONCE_MEASSGE_BODY::</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
},
{title: 'Email to seller when post expired.',
subject: "Warning! Your advertising is expired now.",
status: 1,
content: "<p>Hello <strong>::SELLER_NAME::</strong></p>

<p>Warning, your post for <strong>::ITEM_NAME::</strong> is expired and we will lose the opportunity to show your post for thousands of buyers over the world. In case of <strong>::ITEM_NAME::</strong> is still valid at your end, please login to your dashboard and go to my listed equipment page then click on edit to renew the validity of your post.</p>

<p>Please click on below link to login to your account:</p>

<p>::LINK_TO_USER_SIGN_IN_URL::</p>

<p>&nbsp;</p>

<p>Best Regards</p>

<p>Power Cozmo Team</p>"
}
]
		puts "================== Started loading system emails ========================\n"
		system_emails.each do |sys_email_hash|
			unless sys_email_hash[:title].to_s.blank?				
				system_email = SystemEmail.where(title: sys_email_hash[:title]).first_or_initialize
				system_email.subject = sys_email_hash[:subject]
				system_email.content = sys_email_hash[:content]
				system_email.status = sys_email_hash[:status] || 1
				system_email.save(validate: false)
				print "."
			end
		end
		puts "\n================== Finished loading system emails ========================\n"		
	end
end
