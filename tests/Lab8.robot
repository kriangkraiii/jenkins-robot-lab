*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # 1. ชี้เป้า Browser ไปที่ Chromium (สำคัญมากบน Docker ARM64)
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless

    # 2. [แก้ตรงนี้] ไม่ใช้ webdriver-manager แต่ชี้ไปที่ Driver ที่ติดตั้งมากับ Docker
    # เพราะ webdriver-manager ไม่มีสิทธิ์โหลดไฟล์ของ ARM64 ครับ
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service

    # 3. สร้าง Webdriver
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th
    Title Should Be    College of Computing, Khon Kaen University