*** Settings ***
Library    SeleniumLibrary

# -------------------------------------------------------------
# ส่วนที่ขาดหายไป: ต้องประกาศ Test Cases ว่าจะให้ทดสอบอะไร
# -------------------------------------------------------------
*** Test Cases ***
Open KKU Computing Website
    Open Browser To Login Page
    Title Should Be    College of Computing, Khon Kaen University
    Capture Page Screenshot

# -------------------------------------------------------------
# ส่วน Keywords (ที่แก้ Path สำหรับ Docker/Mac ไว้แล้ว ห้ามแก้กลับ!)
# -------------------------------------------------------------
*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # ชี้เป้า Browser (สำคัญ)
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    # ชี้เป้า Driver (สำคัญ)
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service

    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th