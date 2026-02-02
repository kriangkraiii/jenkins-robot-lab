*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open KKU Computing Website
    Open Browser To Login Page
    Title Should Be    College of Computing, Khon Kaen University
    Capture Page Screenshot

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # แค่ใส่ Argument สำหรับรันใน Docker
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    
    Create Webdriver    Chrome    options=${chrome_options}
    
    Go To    https://computing.kku.ac.th