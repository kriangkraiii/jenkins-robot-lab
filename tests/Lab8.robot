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
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    # สำคัญมาก: ต้องระบุ path ของ chrome driver ถ้าไม่ได้อยู่ใน path ปกติ (แต่ใน docker เราลงไว้ใน path แล้ว)
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th