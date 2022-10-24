*** Variables ***
${select_arrow}     //div[@id="appointment-modal"]//span[./*[text()='Choisir un magasin']]//span[2]
${select_paris15}   //*[contains(@id,"select2-select_store") and text()='75 - IXINA Paris 15']
${step_descr_rendezvous}    Nous vous invitons à compléter votre projet et partager votre rêve de cuisine en amont du rendez-vous pour que votre conseiller puisse mieux comprendre vos besoins.
${rendezvous_adistance}     //button[@class="calendar-btn in-distance "]
${rendezvous_adistance_active}     //button[@class="calendar-btn in-distance active"]
${phone_rendezvous}     //*[@id="phone1"]
${etape_suivante_btn}   //button[@class='btn-next']
${prendre_rendezvous_btn}   //button[text()='Prendre rendez-vous sur un nouveau projet']