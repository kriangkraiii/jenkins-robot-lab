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
    
    # --- เพิ่มบรรทัดนี้ เพื่อบอกตำแหน่งของ Chromium ใน Docker ---
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium
    # -----------------------------------------------------

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    # สั่งสร้าง Webdriver โดยใช้ Options ที่ระบุตำแหน่ง Chromium ไว้แล้ว
    Create Webdriver    Chrome    options=${chrome_options}
    
    Go To    https://computing.kku.ac.th