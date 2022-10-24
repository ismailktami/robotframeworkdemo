*** Settings ***
Library	SeleniumLibrary
Resource    LoginPage.robot
Resource    ../resources/HelpersKeywords.robot
Library     Collections
*** Variables ****
${STEP1}    //a[@data-step="1"]
${INPUT_MAIN_RESIDENCE100000000}	//div[contains(@class,'item-type-radio')  and ./*[@id="main_residence100000000"]]
${INPUT_IS_OWNER100000000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="is_owner100000000"]]
${INPUT_HOUSE_APPARTMENT100000001}	//div[contains(@class,'item-type-radio')  and  ./*[@id="house_appartment100000001"]]
${INPUT_TYPE_DWELLING100000001}	//div[contains(@class,'item-type-radio')  and  ./*[@id="type_dwelling100000001"]]
${INPUT_CONSTRUCT_PERMIT100000000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="construct_permit100000000"]]
${INPUT_ELECTRICITY}	//div[contains(@class,'item-type-radio')  and  ./*[@id="electricity"]]
${INPUT_COMPOSITION100000002}	//div[contains(@class,'item-type-radio')  and  ./*[@id="composition100000002"]]
${INPUT_BEGIN_DATE100000000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="begin_date100000000"]]
${INPUT_AREA100000002}	//div[contains(@class,'item-type-radio')  and  ./*[@id="area100000002"]]
${INPUT_OPEN100000003}	//div[contains(@class,'item-type-radio')  and  ./*[@id="open100000003"]]
${INPUT_BACK_KITCHEN100000001}	//div[contains(@class,'item-type-radio')  and  ./*[@id="back_kitchen100000001"]]
${INPUT_COIN_REPAS100000000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="coin_repas100000000"]]
${INPUT_IMPLANTATION100000002}	//div[contains(@class,'item-type-radio')  and  ./*[@id="implantation100000002"]]
${INPUT_COLOR_FRONTS100000004}	//div[contains(@class,'item-type-radio')  and  ./*[@id="color_fronts100000004"]]
${INPUT_FACADES_ASPECT100000003}	//div[contains(@class,'item-type-radio')  and  ./*[@id="facades_aspect100000003"]]
${INPUT_FRONTS_STYLES100000002}	//div[contains(@class,'item-type-radio')  and  ./*[@id="fronts_styles100000002"]]
${INPUT_WORK_PLANS100000001}	//div[contains(@class,'item-type-radio')  and  ./*[@id="work_plans100000001"]]
${INPUT_BUDGET_MAX_7000_9000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="budget_max_7000_9000"]]
${INPUT_FUNDING100000000}	//div[contains(@class,'item-type-radio')  and  ./*[@id="funding100000000"]]
${INPUT_COMMENT_CONNU100000006}	//div[contains(@class,'item-type-radio')  and  ./*[@id="comment_connu100000006"]]
*** Keywords ***
CreateSimulation
	Click Element for ixina    //*[@id="simulate-card"]/a   ${True}

SimulationEtape1
	[Documentation]
	...	documentation
	Log To Console	SimulateEtape1
    Click Element for ixina    ${STEP1}
	Click Element for ixina    ${INPUT_MAIN_RESIDENCE100000000}     ${True}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div/div/div/label
	Click Element for ixina    ${INPUT_IS_OWNER100000000}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div/div[2]/div/label
	Click Element for ixina    ${INPUT_HOUSE_APPARTMENT100000001}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div/div[3]/div[2]/label
	Click Element for ixina    ${INPUT_TYPE_DWELLING100000001}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div/div[4]/div[2]/label
	Click Element for ixina    ${INPUT_CONSTRUCT_PERMIT100000000}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div[2]/div/div[4]/label
	Click Element for ixina    ${INPUT_ELECTRICITY}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div[2]/div[2]/div[2]/label
	Click Element for ixina    ${INPUT_COMPOSITION100000002}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[2]/div[2]/div[3]/div[3]/label
	Click Element for ixina    ${INPUT_BEGIN_DATE100000000}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[4]/div/div/div/label
	Click Element for ixina    ${INPUT_AREA100000002}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[4]/div/div[2]/div[3]/label
	Click Element for ixina    ${INPUT_OPEN100000003}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[4]/div/div[3]/div[4]/label
	Click Element for ixina    ${INPUT_BACK_KITCHEN100000001}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[4]/div[2]/div/div[2]/label
	Click Element for ixina    ${INPUT_COIN_REPAS100000000}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[4]/div[2]/div[2]/div/label
	Click Element for ixina    ${INPUT_IMPLANTATION100000002}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[6]/div/div/div[3]/label
	Click Element for ixina    ${INPUT_COLOR_FRONTS100000004}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[6]/div/div[3]/div[3]/label
	Click Element for ixina    ${INPUT_FACADES_ASPECT100000003}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[6]/div/div[4]/div[3]/label
	Click Element for ixina    ${INPUT_FRONTS_STYLES100000002}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[6]/div/div[5]/div[3]/label
	Click Element for ixina    ${INPUT_WORK_PLANS100000001}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[6]/div/div[6]/div/label
	Click Element for ixina    ${INPUT_BUDGET_MAX_7000_9000}
	Click Element for ixina    //*[@id="kitchen-form"]/div/div[10]/div/div/div[3]/label/span
	Click Element for ixina    ${INPUT_FUNDING100000000}
	Click Element for ixina    ${INPUT_COMMENT_CONNU100000006}

EtapeSuivante
    Log To Console    Etape suivante
    Click element for ixina     //button[text()="étape suivante"]

SimulationEtape2
    Log To Console    SimulationEtape2
    Choose File    //*[@id="file_1"]    ${EXECDIR}/resources/files/cuisine.png
SimulationEtape3
    Log To Console    SimulationEtape3
    Click element for ixina   //div[@data-step="1"]//div[@class="mosaic_tile" and ./a[@data-result="1"]]/a/..     scroll_to_element=${False}
    Check Step Quiz Number     2
    Click element for ixina   //div[@data-step="2"]//div[@class="mosaic_tile" and ./a[@data-result="2"]]/a/..   scroll_to_element=${False}
    Check Step Quiz Number     3
    Click element for ixina   //div[@data-step="3"]//div[@class="mosaic_tile" and ./a[@data-result="3"]]/a/..   scroll_to_element=${False}
    Check Step Quiz Number     4
    Click element for ixina   //div[@data-step="4"]//div[@class="mosaic_tile" and ./a[@data-result="1"]]/a/..  scroll_to_element=${False}
    Check Step Quiz Number     5
    Click element for ixina   //div[@data-step="5"]//div[@class="mosaic_tile" and ./a[@data-result="1"]]/a/..  scroll_to_element=${False}
    Check Step Quiz Number     6
    Click element for ixina   //div[@data-step="6"]//div[@class="mosaic_tile" and ./a[@data-result="1"]]/a/..   scroll_to_element=${False}
    Check Step Quiz Number     7
    Click element for ixina   //div[@data-step="7"]//div[@class="mosaic_tile" and ./a[@data-result="2"]]/a/..  scroll_to_element=${False}
    Check Step Quiz Number     8
    Click element for ixina   //div[@data-step="8"]//div[@class="mosaic_tile" and ./a[@data-result="3"]]/a/..  scroll_to_element=${False}
    Check Step Quiz Number     9
    Click element for ixina   //div[@data-step="9"]//div[@class="mosaic_tile" and ./a[@data-result="3"]]/a/..  scroll_to_element=${False}
    Sleep    3s
    Click element for ixina     //a[./h3[text()='La Contemporaine']]/..     scroll_to_element=${False}
    Wait Until Element Is Visible    //*[@id="show_quizz-restart"]  60s
    
SimulationEtape4
    Log To Console    SimulationEtape4
    Choose File    //*[@id="new_file"]    ${EXECDIR}/resources/files/cuisine.png
    Wait Until Element Is Visible    //div[@class="cropper-crop-box"]       30s
    ${elem}     Get WebElement      //div[@class="cropper-crop-box"]
    SeleniumLibrary.Execute Javascript    arguments[0].style["width"] = "200px";    ARGUMENTS   ${elem}
    SeleniumLibrary.Execute Javascript    arguments[0].style["height"] = "150px";   ARGUMENTS   ${elem}
    Sleep    2s
    Click Element    //button[@id="crop"]

Check Step Quiz Number
    [Arguments]     ${step_number}
    Wait Until Element Is Visible    //div[@class="quizz-reco_step active" and @data-step="${step_number}"]    30s


Go to step
    [Arguments]     ${step_number}  ${excpected_title}
    Wait Until Element Is Visible  //li[.//div[@class="step-container step_${step_number}"]]    30s
    Scroll Element Into View    //li[.//div[@class="step-container step_${step_number}"]]
    Click Element    //li[.//div[@class="step-container step_${step_number}"]]
    Wait Until Keyword Succeeds     5   10s   Page Should Contain   ${excpected_title}

SimulationEtape5
    Wait Until Element Is Visible    //div[@class="swiper-wrapper"]//div[contains(@class,'new-simulation')]     30s
    Scroll Element Into View    //div[@class="swiper-wrapper"]//div[contains(@class,'new-simulation')]
    Click Link    //div[@class="swiper-wrapper"]//div[contains(@class,'new-simulation')]/a
    Wait Until Element Is Visible    //iframe[@id="iframe-simulator"]
    Select Frame    //iframe[@id="iframe-simulator"]
    Wait Until Element Is Visible    //li[contains(@class,"view_item")][1]      120s
    Sleep    5s
    Click element for ixina    //li[@class="view_item view_category"]
    Sleep    5s
    Click element for ixina    //li[.//div[text()="Cuisine linéaire"]]/div
    Wait Until Element Is Not Visible    //div[@id="loader_overlay"]    30s
#    Wait Until Element Is Visible    //div[@id="PUE192"]    30s
#    Click Element    //div[@id="PUE192"]
    Sleep    5s
    Click element for ixina    //div[@id="menu_project"]